package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
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
import org.zerock.domain.NoticeAttachVO;
import org.zerock.domain.NoticeVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.MemberService;
import org.zerock.service.NoticeService;

import lombok.extern.log4j.Log4j;

// Page613 SampleController 소스 코딩
@Log4j
@RequestMapping("/userlist/*")
@Controller
public class SampleController {
	
	// 회원 리스트
	@Autowired
	private MemberService mservice;
	
	 // 공지사항 관리자
    @Autowired
    private NoticeService service;

   @GetMapping("/all")
   public void doAll() {
      log.info("do all can access everybody : 로그인을 하지 않은 사용자도 접근 가능한 URI");
   }

    @GetMapping("/admin")
   public void doAdmin(Criteria cri, Model adminmodel) {
      log.info("Admin only : 로그인한 사용자들 중에서 관리자 권한(admin)을 가진 사용자만이 접근할 수 있는  URI");
      adminmodel.addAttribute("admin", mservice.getList(cri));
      
      int total = mservice.getTotal(cri);
      
      adminmodel.addAttribute("pageMaker", new PageDTO(cri, total));
   }
   
    @GetMapping("/register")
    public void register() {
    }
    
	/*
	 * @GetMapping("/list") public void list(Criteria cri, Model model) {
	 * log.info("list : " + cri); model.addAttribute("list", service.getList(cri));
	 * 
	 * 
	 * int total = service.getTotal(cri); log.info("total : 전체 카운트 개수 = " + total);
	 * model.addAttribute("pageMaker", new PageDTO(cri, total)); }
	 */
    
    @GetMapping(value = "/getAttachList", produces = {         
          MediaType.APPLICATION_JSON_UTF8_VALUE})
    @ResponseBody  // @ResponseBody를 적용해서 JSON 데이터를 반환하도록 처리합니다.
    public ResponseEntity<List<NoticeAttachVO>> getAttachList(Long bno){
       log.info("getAttachList~!! " + bno);
       return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
    }
    
    @PreAuthorize("isAuthenticated()")
    @PostMapping("/register") // @PostMapping() POST 방식 URL 메핑
    public String register(NoticeVO board, RedirectAttributes rttr) {
       
       // Page565 소스 코딩 추가 적용
       log.info("==========================");
       log.info("register : ==> " + board);
       if(board.getAttachList() != null) {
          board.getAttachList().forEach(attach -> log.info(attach));
       }
       
       log.info("==========================");
       
       // Page567 실행 확인할 때 아래 2줄 소스 코딩 추가
       service.register(board);
       rttr.addFlashAttribute("result", board.getBno());
       
       return "redirect:/notice/list";
    }
    @GetMapping({"/get", "/modify"})
    public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
       log.info("/get or modify");
//       log.info("/get 조회  처리");
       model.addAttribute("board",service.get(bno));
    }
    @PreAuthorize("principal.username == #board.writer")
    @PostMapping("/modify")
    public String modify(NoticeVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
       log.info("modify: 수정 처리 " + board);
       if (service.modify(board)) {
          rttr.addFlashAttribute("result", "success");
       }   
       
       rttr.addAttribute("pageNum", cri.getPageNum());
       rttr.addAttribute("amount", cri.getAmount());
       rttr.addAttribute("type", cri.getType());
       rttr.addAttribute("keyword", cri.getKeyword());
       
       return "redirect:/notice/list";
    }
    @PreAuthorize("principal.username == #writer")
    @PostMapping("/remove")
    public String remove(@RequestParam("bno") Long bno, Criteria cri, RedirectAttributes rttr, String writer) {
    
       log.info("remove: 삭제 처리 " + bno);
       
       List<NoticeAttachVO> attachList = service.getAttachList(bno);
       
       if (service.remove(bno)) {
          
          deleteFiles(attachList);
          
          rttr.addFlashAttribute("result", "success");
       }   
       
       return "redirect:/notice/list" + cri.getListLink();
    }
    
 private void deleteFiles(List<NoticeAttachVO> attachList) {
        
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