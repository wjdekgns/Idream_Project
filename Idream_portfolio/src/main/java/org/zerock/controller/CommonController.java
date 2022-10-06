package org.zerock.controller;

import javax.inject.Inject;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.security.core.Authentication;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.zerock.domain.MemberVO;
import org.zerock.service.MemberService;

import lombok.extern.log4j.Log4j;

@Controller
@Log4j
public class CommonController {   
   
   private static final Logger logger = LoggerFactory.getLogger(CommonController.class);
   
    @Inject MemberService service;
    
    @Inject BCryptPasswordEncoder pwdEncoder;
   
   

   @GetMapping("/accessError")
   public void  accessDenied(Authentication auth, Model model) {
      log.info("access Denied : " + auth);
      
      model.addAttribute("msg", "Access Denied");
   }
   
   // Page631 소스 코딩 : loginInput() 메서드는 GET방식으로 접근하고,
   // 에러 메시지와 로그아웃 메시지를 파라미터로 사용할 수 있습니다.
   // 이제, views 폴더에 customLogin jsp 파일을 추가해 줍니다.
   @GetMapping("/customLogin")
   public void loginInput(String error, String logout, Model model) {
      log.info("error : " + error);
      log.info("logout : " + logout);
      
      if (error != null) {
         model.addAttribute("error", "Login Error Check Your Account");
      }
      
      if (logout != null) {
         model.addAttribute("logout", "Logout!!!");
      }
   }
   
      // Page640 : CommonController에는 GET 방식으로 로그아웃을 결정하는
        //           페이지에 대한 메서드를 추가합니다.
      @GetMapping("/customLogout")
      public void logoutGET() {
         log.info("custom logout");
      }
      
      
      
      // 회원가입 get
         @RequestMapping(value = "/user/signup", method = RequestMethod.GET)
         public void getRegister() throws Exception {
            logger.info("get signup");
         }   
      
      
       // 회원가입 post
         @RequestMapping(value = "/user/signup", method = RequestMethod.POST)
         public String postRegister(MemberVO vo) throws Exception {
            int result = service.idChk(vo);
            try {
               if(result == 1) {
                  return "/user/signup";
               }else if(result == 0) {
                  String inputPass = vo.getUserid();
                  String pwd = pwdEncoder.encode(inputPass);
                  vo.setUserpw(pwd);
                  
                  service.register(vo);
               }
               // 요기에서~ 입력된 아이디가 존재한다면 -> 다시 회원가입 페이지로 돌아가기 
               // 존재하지 않는다면 -> register
            } catch (Exception e) {
               throw new RuntimeException();
            }
            return "redirect:/index";   
         }
      
      
      
      
   
}