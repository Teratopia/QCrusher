package controllers;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.QuizDAO;
import data.QuestionObject;
import data.Quiz;

@Controller
public class QuizController {
	@Autowired
	private QuizDAO quizDAO;
	
	@RequestMapping(path="takeQuiz", method=RequestMethod.GET)
	public ModelAndView takeQuiz(@RequestParam(name = "quizNumber") Integer quizNumber, 
			@RequestParam(name = "answerText", required = false) String answerText, 
			@RequestParam(name = "questionNumber", required = false) Integer questionNumber){
		ModelAndView mv = new ModelAndView();
		
		Quiz quiz = quizDAO.getQuizById(quizNumber);
		List<QuestionObject> questions = quiz.getQuestionObjects();
		
		if(questionNumber == null){
			questionNumber = 1;
		} else {
			if(questionNumber < questions.size()){
				questionNumber++;
			}
		}
		
		QuestionObject question = questions.get(questionNumber-1);
		
		if(quiz == null){
			mv.setViewName("welcome.jsp");
			mv.addObject("error", "Quiz does not exist!");
		}else{
			mv.setViewName("takeQuiz.jsp");
			mv.addObject("quiz", quiz);
			mv.addObject("quizNumber", quizNumber);
			mv.addObject("questionNumber", questionNumber);
			mv.addObject("question", question);
		}
		
		return mv;
	}
	
//	@RequestMapping(value = "createNewUser", method = RequestMethod.GET)
//	public ModelAndView createNewUser(String username, String password) {
//		ModelAndView model = new ModelAndView();
//		if (userDAO.createNewUser(username, password)) {
//			model.setViewName("j_spring_security_check");
//			model.setViewName("login");
//			model.addObject("msg", "Account created! Please login with your new credentials.");
//		} else {
//			model.setViewName("signup");
//			model.addObject("error", "Username already exists!");
//		}
//		return model;
//	}
	

}
