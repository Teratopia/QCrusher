package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.servlet.ModelAndView;

import dao.QuizDAO;
import dao.UserDAO;

@Controller
public class WelcomeController {
	@Autowired
	private QuizDAO quizDAO;
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(path={"/", "/welcome"}, method=RequestMethod.GET)
	public ModelAndView welcome(){
		System.out.println("in welcome controller");
		if (userDAO.getUserByUserName("Anonymous") == null){
			System.out.println("creating Anonymous");
			userDAO.createNewUser("Anonymous", "testpassword");
		}
		System.out.println("2");
		ModelAndView mv = new ModelAndView();
		mv.setViewName("welcome.jsp");
		System.out.println("3");
		mv.addObject("quizzes", quizDAO.getAllQuizzes());
		System.out.println("4");
		return mv;
	}
}
