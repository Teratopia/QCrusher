package qcontrollers;

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
	
	@RequestMapping("/createQuiz.do")
	public String createQuiz(){
		return "createQuiz.jsp";
	}
	@RequestMapping("/createAccount.do")
	public String createAccount(){
		return "createAccount.jsp";
	}
	
	@RequestMapping("/takeQuiz.do")
	public String takeQuiz(){
		return "takeQuiz.jsp";
	}
	
	@RequestMapping("/scoreQuiz.do")
	public String scoreQuiz(){
		return "scoreQuiz.jsp";
	}
	@RequestMapping("/profile.do")
	public String profile(){
		return "profile.jsp";
	}
}
