package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.QAAttachVO;
import org.zerock.domain.QAVO;
import org.zerock.service.QAService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j
@RequestMapping(value = "/inquiry/*")
@AllArgsConstructor
public class QAController {

	private QAService service;
	
	// 등록 입력 페이지와 등록 처리 : 게시물의 등록 작업은 POST 방식으로 처리하지만,
	// 화면에서 입력을 받아야 하므로 GET 방식으로 입력 페이지를 볼 수 있도록
	// BoardController에 메서드를 추가해 줍니다.
	// register() 메서드는 입력 페이지를 보여주는 역할만을 하기 때문에
	// 별도의 처리가 필요하지 않습니다.
	@GetMapping("/register")
	public void register() {
	}
	
	/*
	@GetMapping("/list")  // @GetMapping() GET 방식 URL 메핑
	public void list(Model model) {
		log.info("list");
		model.addAttribute("list", service.getList());
	}
	*/
	
	@GetMapping("/list")  // @GetMapping() GET 방식 URL 메핑
	public void list(Criteria cri, Model model) {
		log.info("list : " + cri);
		model.addAttribute("list", service.getList(cri));
		
		// list() 메서드는 'pageMaker'라는 이름으로 PageDTO 클래스에서
		// 객체를 만들어서 Model에 담아줍니다. PageDTO를 구성하기 위해서는
		// 전체 데이터 수가 필요한데, 아직 처리가 이루어지지 않았으므로
		// 임의의 값으로 123을 지정했습니다. 아래 구문은 Page324 연습할때 주석 처리함.
		// model.addAttribute("pageMaker", new PageDTO(cri, 123));

		//Page324 BoardController 클래스 수정 코딩
		int total = service.getTotal(cri);
		log.info("total : 전체 카운트 개수 = " + total);
		// ex02 웹프로젝트 실행 후 Console 창에 나타난 전체 카운트 개수를 확인해 봅니다.
		// INFO : org.zerock.controller.BoardController - total : 전체 카운트 개수 = 720894
		// 그리고, http://localhost:9005/inquiry/list 웹사이트에서
		// 데이터를 2개 삭제해 봅니다. 그리고, 다시 STS Console 창에 나타난
		// 전체 카운트 개수를 확인해 봅니다.
		//	INFO : org.zerock.controller.BoardController - total : 전체 카운트 개수 = 720892
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	// Page570 BoardController에 특정한 게시물 번호를 이용해서 첨부파일과 관련된
	// 데이터를 JSON으로 반환하도록 처리합니다.
	@GetMapping(value = "/getAttachList", produces = {			
			MediaType.APPLICATION_JSON_UTF8_VALUE})
	@ResponseBody  // @ResponseBody를 적용해서 JSON 데이터를 반환하도록 처리합니다.
	public ResponseEntity<List<QAAttachVO>> getAttachList(Long qno){
		log.info("getAttachList~!! " + qno);
		return new ResponseEntity<>(service.getAttachList(qno), HttpStatus.OK);
	}
	
	// Page712 아래 1줄 소스 코딩 추가
	// @PreAuthorize을 이용할 때 표현식은 isAuthenticated()로 했습니다.
	// 이것은 어떠한 사용자든 로그인이 성공한 사용자만이 해당 기능을 사용할 수 있도록 처리합니다.
	@PreAuthorize("isAuthenticated()")
	@PostMapping("/register") // @PostMapping() POST 방식 URL 메핑
	// register() 메서드는 String을 리턴 타입으로 지정하고, Redirect Attributes를
	// 파라미터로 지정합니다. 이것은 등록 작업이 끝난 후 다시 목록 화면으로 이동하기 위함이며,
	// 추가적으로 새롭게 등록된 게시물의 번호를 같이 전달하기 위해서 RedirectAttributes를
	// 이용합니다. 이때, 리턴 시에는 "redirect:" 접두어를 사용하는데,
	// 이것을 이용하면 스프링 MVC가 내부적으로 response.sendRedirect()를 처리해 주기
	// 때문에 편리합니다.
	// BoardController에서 register() 메서드는 "redirect:/inquiry/list"를
	// 전송하는데 브라우저는 이를 통보받은 후 "/inquiry/list"로 이동하게 됩니다.
	// BoardController에서 redirect 처리를 할 때 RedirectAttributes라는
	// 특별한 타입의 객체를 이용합니다. addFlashAttribute()메서드의 경우, 이러한
	// 처리에 적합하며, 그 이유는 일회성으로만 데이터를 전달하기 때문입니다.
	// addFlashAttribute() 메서드로 보관된 데이터는 단 한 번만 사용할 수 있게 보관됩니다.
	// (내부적으로는 HttpSession을 이용해서 처리함)	
	public String register(QAVO board, RedirectAttributes rttr) {
		
		// Page565 소스 코딩 추가 적용
		log.info("==========================");
		log.info("register : ==> " + board);
		if(board.getAttachList() != null) {
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("==========================");
		
		// Page565 소스 코딩할 때 아래 3줄 소스는 주석 처리함
		// log.info("register(등록) : " + board);		
		// service.register(board);
		// rttr.addFlashAttribute("result", board.getqno());
		
		// Page567 실행 확인할 때 아래 2줄 소스 코딩 추가
		service.register(board);
		rttr.addFlashAttribute("result", board.getQno());
		
		return "redirect:/inquiry/list";
	}
	// 조회 처리와 테스트 : 등록처리와 유사하게 조회 처리도 BoardController를 이용해서
	// 처리할 수 있습니다. 특별한 경우가 아니라면 조회는 GET 방식으로 처리하므로,
	// @GetMapping을 이용합니다.
	// BoardController의 get() 메서드에는 qno 값을 좀 더 명시적으로 처리하는
	// @RequestParam을 이용해서 지정합니다.(파라미터 이름과 변수 이름을 기준으로 동작하기
	// 때문에 생략해도 됩니다). 또한 화면 쪽으로 해당 번호의 게시물을 전달해야 하므로
	// Model을 파라미터로 지정합니다.
	// @GetMapping("/get")
	@GetMapping({"/get", "/modify"})
//	public void get(@RequestParam("qno") Long qno, Model model) {
	// Page316 14.4.1 조회 페이지에서 다시 목록 페이지로 이동 : 페이지 번호 유지
	// @ModelAttribute 어노테이션은 자동으로 Model에 데이터를 지정한 이름으로 담아줍니다.
	// @ModelAttribute 어노테이션을 사용하지 않아도 Controller에서 화면으로
	// 파라미터가 된 객체는 전달이 되지만, 좀 더 명시적으로 이름을 지정하기 위해 사용합니다.
	public void get(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/get or modify");
//		log.info("/get 조회  처리");
		model.addAttribute("board",service.get(qno));
	}
	// 수정 처리와 테스트 : 수정 작업은 등록과 비슷합니다. 변경된 내용을 수집해서
	// BoardVO 파라미터로 처리하고, BoardService를 호출합니다. 수정 작업을 시작하는
	// 화면의 경우에는 GET 방식으로 접근하지만 실제 작업은 POST 방식으로 동작하므로
	// @PostMapping을 이용해서 처리합니다.
	// Page720 아래 1줄 소스 코딩 추가 : BoardController의 수정 처리
	// @PreAuthorize("principal.username == #board.writer")
	@PostMapping("/modify")
	public String modify(QAVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("modify: 수정 처리 " + board);
		// service.modify() 메서드는 수정 여부를 boolean으로 처리하므로
		// 이것을 이용해서 성공한 경우에만 RedirectAttributes에 추가합니다.
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}	
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		// Page346 수정/삭제 처리는 BoardController에서 redirect 방식으로 동작하므로
		// type과 keyword 조건을 같이 리다이렉트 시에 포함시켜야만 합니다.
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/inquiry/list";
	}
	// 삭제 처리와 테스트 : 삭제 처리도 조회와 유사하게 BoardController와 테스트 코드를
	// 작성합니다. 삭제는 반드시 POST 방식으로만 처리합니다.
	// Page720 아래 1줄 소스 코딩 추가 : BoardController의 삭제 처리
	// @PreAuthorize("principal.username == #writer")
	@PostMapping("/remove")
	// Page581 소스 코딩할 때 아래 1줄 소스는 주석 처리합니다.
	// public String remove(@RequestParam("qno") Long qno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
	// Page581 아래 1줄 소스 코딩
	public String remove(@RequestParam("qno") Long qno, Criteria cri, RedirectAttributes rttr, String writer) {
	
		log.info("remove: 삭제 처리 " + qno);
		
		// Page581 아래 1줄 소스 코딩 추가
		List<QAAttachVO> attachList = service.getAttachList(qno);
		
		// BoardController의 remove() 메서드는 삭제 후 페이지의 이동이 필요하므로
		// RedirectAttributes를 파라미터로 사용하고, 'redirect'를 이용해서
		// 삭제 처리 후에 다시 목록 페이지로 이동 처리 합니다.
		if (service.remove(qno)) {
			
			// Page581 아래 1줄 소스 코딩 추가(delete Attach Files)
			deleteFiles(attachList);
			
			rttr.addFlashAttribute("result", "success");
		}	
		
		// Page581 소스 코딩할때 아래 2개 소스 코드 주석 처리 바랍니다.
		// rttr.addAttribute("pageNum", cri.getPageNum());
		// rttr.addAttribute("amount", cri.getAmount());
		
		// Page346~Page347 수정/삭제 처리는 BoardController에서 redirect 방식으로 동작하므로
		// type과 keyword 조건을 같이 리다이렉트 시에 포함시켜야만 합니다.
		// Page581 소스 코딩할때 아래 2개 소스 코드 주석 처리 바랍니다.
		// rttr.addAttribute("type", cri.getType());
		// rttr.addAttribute("keyword", cri.getKeyword());
		
		// Page581 소스 코딩할때 아래 1개 소스 코드 주석 처리 바랍니다.
		// return "redirect:/inquiry/list";
		
		// Page581 아래 1줄 소스 코딩 추가
		return "redirect:/inquiry/list" + cri.getListLink();
	}
	
	// Page579 BoardController 파일 삭제
	// BoardController는 데이터베이스의 삭제를 먼저 호출하고, 이후 파일을 삭제해야 합니다.
	// 다만, 파일을 삭제하기 위해서는 해당 게시물의 첨부파일 목록이 필요합니다.
	// 즉, 해당 게시물의 첨부파일 정보를 미리 준비하고, 데이터베이스 상에서 해당 게시물과
	// 첨부파일 데이터를 삭제 처리하고, 첨부파일 목록을 이용해서 해당 폴더에서
	// 섬네일 이미지(이미지 파일의 경우에 한함)와 일반 파일을 삭제 처리 합니다.
	// 파일 삭제는 BoardController에 deleteFiles() 메서드를 추가해서 처리하게 합니다.
	// deleteFiles()는 java.nio.file 패키지의 Path를 이용해서 처리합니다.
	// Page581 deleteFiles() 메서드 정의
private void deleteFiles(List<QAAttachVO> attachList) {
	    
	    if(attachList == null || attachList.size() == 0) {
	      return;
	    }
	    
	    log.info("delete attach files...................");
	    log.info(attachList);
	    
	    attachList.forEach(attach -> {
	      try {        
	        Path file  = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
	        
	        Files.deleteIfExists(file);
	        
	        if(Files.probeContentType(file).startsWith("image")) {
	        
	          Path thumbNail = Paths.get("C:\\upload\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
	          
	          Files.delete(thumbNail);
	        }
	
	      }catch(Exception e) {
	        log.error("delete file error" + e.getMessage());
	      }//end catch
	    });//end foreachd
	  }
	
}



