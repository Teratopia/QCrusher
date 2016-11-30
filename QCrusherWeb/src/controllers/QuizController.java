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
import test.LevenshteinDistTest;

@Controller
public class QuizController {
	@Autowired
	private QuizDAO quizDAO;

	private LevenshteinDistTest ldt;
	private String state;
	private String username;

	@RequestMapping(path = "takeQuiz", method = RequestMethod.GET)
	public ModelAndView takeQuiz(@RequestParam(name = "quizNumber") Integer quizNumber,
			@RequestParam(name = "answerText", required = false) String answerText,
			@RequestParam(name = "questionNumber", required = false) Integer questionNumber,
			@RequestParam(name = "username", required = false) String username) {
		
		if(username != null){
			this.username = username;
		}
		ModelAndView mv = new ModelAndView();

		Quiz quiz = quizDAO.getQuizById(quizNumber);
		List<QuestionObject> questions = quiz.getQuestionObjects();
		for(QuestionObject qo : questions){
			
		}
		String state = "";

		if (quiz == null) {
			state = "error";
		} else {

			if (questionNumber == null) {
				questionNumber = 1;
				state = "initialQuizLoad";
			} else {
				if (answerText != null) {
					state = "submittingForGrade";
				} else {
					if (questionNumber < questions.size()) {
						questionNumber++;
						state = "nextQuestion";
					} else {
						state = "lastQuestion";
					}
				}
			}
		}
		QuestionObject question = questions.get(questionNumber - 1);

		switch (state) {
		case "initialQuizLoad":
			
		case "nextQuestion":
			
			mv.setViewName("takeQuiz.jsp");
			mv.addObject("quiz", quiz);
			mv.addObject("quizNumber", quizNumber);
			mv.addObject("questionNumber", questionNumber);
			mv.addObject("question", question);
			break;
		case "submittingForGrade":

			mv.setViewName("takeQuiz.jsp");
			mv.addObject("quiz", quiz);
			mv.addObject("quizNumber", quizNumber);
			mv.addObject("questionNumber", questionNumber);
			mv.addObject("question", question);
			ldt = new LevenshteinDistTest();
			Double percentMatch = ldt.levPercent(answerText.toLowerCase(), question.getAnswer().toLowerCase());
			String percentMatch2 = "%"+String.format("%.2f", percentMatch*100);
			mv.addObject("percentMatch", percentMatch2);
			mv.addObject("rightAnswer", question.getAnswer());
			mv.addObject("userAnswer", answerText);
			if(percentMatch > .75){
				mv.addObject("passFail", "Correct!");
			}else{
				mv.addObject("passFail", "Incorrect.");
			}
			break;
		case "lastQuestion":
			
			//break;
		case "error":
		default:
			mv.setViewName("welcome.jsp");
			mv.addObject("error", "Quiz does not exist!");
		}

		return mv;
	}

}
