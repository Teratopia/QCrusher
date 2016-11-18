package controllers;

import java.util.UUID;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;


@Controller
@SessionAttributes("dao")
public class QCrusherController {
//@Autowired
//SomethingSomething dao;
	

//	@ModelAttribute("dao")
//	public SomethingSomething getDao() {
//		return dao;
//	}
	
	@RequestMapping("/login.do")
	public String login(){
		return "login.jsp";
	}
	
	@RequestMapping("/main.do")
	public String main(){
		return "main.jsp";
	}
	
	@RequestMapping("/takequiz.do")
	public String takequiz(){
		return "takequiz.jsp";
	}
	
	@RequestMapping("/scorequiz.do")
	public String scorequiz(){
		return "scorequiz.jsp";
	}
}
