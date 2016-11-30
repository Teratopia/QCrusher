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

import dao.AttemptDAO;
import dao.AttemptQuestionDAO;
import dao.QuizDAO;
import dao.UserDAO;
import data.AttemptQuestion;
import data.QuestionObject;
import data.Quiz;
import test.LevenshteinDistTest;

@Controller
public class QuizController {
	@Autowired
	private QuizDAO quizDAO;
	@Autowired
	private AttemptDAO attemptDAO;
	@Autowired
	private AttemptQuestionDAO attemptQuestionDAO;
	@Autowired
	private UserDAO userDAO;
	private LevenshteinDistTest ldt;
	private String state;
	private String username;
	int attemptId;

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
			attemptId = attemptDAO.createNewAttempt(userDAO.getUserByUserName(username).getId(), quizNumber);
			System.out.println(attemptId);
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
			boolean wasCorrect = false;
			if(percentMatch > .75){
				mv.addObject("passFail", "Correct!");
				wasCorrect = true;
			}else{
				mv.addObject("passFail", "Incorrect.");
				wasCorrect = false;
			}
			attemptQuestionDAO.createNewAttemptQuestion(question.getId(), attemptId, wasCorrect);
			break;
		case "lastQuestion":
			mv.setViewName("scoreQuiz.jsp");
			
			Set<AttemptQuestion> attemptSet = attemptDAO.getAttemptById(attemptId).getAttemptQuestions();
			List<AttemptQuestion> attemptList = new ArrayList<AttemptQuestion>();
			int count = 0;
			for(AttemptQuestion aq : attemptSet){
				attemptList.add(aq);
				if(aq.getPassFail()){
					count++;
				}
			}
			Double percentCorrect = ((double)(count))/attemptList.size();
			String percentCorrect2 = "%"+String.format("%.2f", percentCorrect*100);
			mv.addObject("quiz", quiz);
			mv.addObject("percentCorrect", percentCorrect2);
			mv.addObject("answeredQuestions", attemptList);
			//break;
		case "error":
		default:
			mv.setViewName("welcome.jsp");
			mv.addObject("error", "Quiz does not exist!");
		}

		return mv;
	}

}
