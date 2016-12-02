package controllers;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.QuestionObjectDAO;
import dao.QuizDAO;
import data.QuestionObject;
import data.Quiz;

@Controller
public class CreateQuizController {
	@Autowired
	private QuizDAO quizDAO;
	@Autowired
	private QuestionObjectDAO qoDAO;
	
	@RequestMapping(path = "createQuiz", method = RequestMethod.GET)
	public ModelAndView createQuiz(@RequestParam(name = "username", required = false) String username) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createQuiz.jsp");
		mv.addObject("username", username);
		
		return mv;
	}
	
	@RequestMapping(path = "createNewQuiz", method = RequestMethod.GET)
	public ModelAndView createNewQuiz(@RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "quizName", required = false) String quizName) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createQuiz.jsp");
		System.out.println("in controller: "+username);
		int quizId = quizDAO.createNewQuiz(quizName, username);
		mv.addObject("username", username);
		mv.addObject("quizId", quizId);
		mv.addObject("quiz", quizDAO.getQuizById(quizId));
		
		
		return mv;
	}
	
	@RequestMapping(path = "createNewQuestion", method = RequestMethod.GET)
	public ModelAndView createNewQuestion(@RequestParam(name = "quizId", required = false) String quizIdString,
			@RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "question", required = false) String question,
			@RequestParam(name = "answer", required = false) String answer) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("createQuiz.jsp");
		int quizId = Integer.parseInt(quizIdString);
		Quiz quiz = quizDAO.getQuizById(quizId);
		qoDAO.createNewQuestionObject(question, answer, quizId);
		
		mv.addObject("quiz", quiz);
		mv.addObject("username", username);
		
		return mv;
	}

}
