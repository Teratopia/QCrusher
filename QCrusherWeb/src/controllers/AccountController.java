package controllers;

import java.util.ArrayList;
import java.util.List;
import java.util.Set;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDAO;
import data.Attempt;
import data.AttemptQuestion;
import data.QuestionObject;
import data.Quiz;
import data.User;

@Controller
public class AccountController {
	@Autowired
	private UserDAO userDAO;
	
	
	
	@RequestMapping(path="/account", method=RequestMethod.GET)
	public ModelAndView profile(@RequestParam(name = "username", required = false) String username) {
		System.out.println(username);
		ModelAndView mv = new ModelAndView();
		mv.setViewName("profile.jsp");
		
		User user = userDAO.getUserByUserName(username);
		Set<Attempt> attempts = user.getAttempts();
		List<AttemptQuestion> correctAQS = new ArrayList<AttemptQuestion>();
		List<AttemptQuestion> incorrectAQS = new ArrayList<AttemptQuestion>();
		for(Attempt a : attempts){
			Set<AttemptQuestion> aqs = a.getAttemptQuestions();
			for(AttemptQuestion aq : aqs){
				if(aq.getPassFail()==true){
					correctAQS.add(aq);
				}else{
					incorrectAQS.add(aq);
				}
			}
		}
		
		Double totalAverage = ((double)(correctAQS.size())/(incorrectAQS.size()+correctAQS.size()));
		Set<Quiz> quizzes = user.getQuizzes();
		List<QuestionObject> qos = new ArrayList<QuestionObject>();
		List<AttemptQuestion> aqs = new ArrayList<AttemptQuestion>();
		int countStumperQuestions = 0;
		int countNonStumperQuestions = 0;
		for(Quiz quiz : quizzes){
			for(QuestionObject qo : quiz.getQuestionObjects()){
				for(AttemptQuestion aq : qo.getAttemptQuestions()){
					if(aq.getPassFail()==true){
						countNonStumperQuestions++;
					}else{
						countStumperQuestions++;
					}
				}
			}
		}
		System.out.println(countStumperQuestions);
		System.out.println(countNonStumperQuestions);
		int numQuizzesCreated = quizzes.size();
		int totalQuestions = countNonStumperQuestions + countStumperQuestions;
		Double stumpRate = ((double)countStumperQuestions)/totalQuestions;
		
		mv.addObject("username", username);
		mv.addObject("incorrectAttempts", incorrectAQS);
		mv.addObject("correctAttempts", correctAQS);
		mv.addObject("totalAverage", totalAverage);
		mv.addObject("numQuizzesCreated", numQuizzesCreated);
		mv.addObject("stumpRate", stumpRate);
		mv.addObject("numStumpQuestions", countStumperQuestions);
		mv.addObject("numNonStumpQuestions", countNonStumperQuestions);
		
		
		return mv;
	}
	
}
