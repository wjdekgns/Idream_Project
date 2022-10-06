package org.zerock.controller;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller 
@Log4j
@AllArgsConstructor
public class SubController {

	@GetMapping("/inquire")
	public void inquire() {
	}

	@GetMapping("/questions")
	public void questions() {
	}
	
	@GetMapping("/direction")
	public void direction() {
	}
	
	@GetMapping("/userlist/hu1")
	public void hu1() {
		log.info("hu1");
	}
	
	@GetMapping("/index")
	public void index() {
		log.info("index");
	}
	
	 @RequestMapping(value="logout.do", method=RequestMethod.POST)
	    public String logoutMainGET(HttpServletRequest request) throws Exception{
	        
	        HttpSession session = request.getSession();
	        
	        session.invalidate();
	        
	        return "redirect:/index";  
	    }
}



