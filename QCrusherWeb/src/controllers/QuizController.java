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
import dao.QuestionRatingDAO;
import dao.QuizDAO;
import dao.QuizRatingDAO;
import dao.UserDAO;
import data.Attempt;
import data.AttemptQuestion;
import data.QuestionObject;
import data.Quiz;
import data.User;
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
	@Autowired
	private QuestionRatingDAO questionRatingDAO;
	@Autowired
	private QuizRatingDAO quizRatingDAO;
	private LevenshteinDistTest ldt;
	private String state;
	private String username;
	int attemptId;

	@RequestMapping(path = "takeQuiz", method = RequestMethod.GET)
	public ModelAndView takeQuiz(@RequestParam(name = "quizNumber") Integer quizNumber,
			@RequestParam(name = "answerText", required = false) String answerText,
			@RequestParam(name = "questionNumber", required = false) Integer questionNumber,
			@RequestParam(name = "username", required = false) String username,
			@RequestParam(name = "questionRating", required = false) String questionRatingText,
			@RequestParam(name = "feedbackText", required = false) String feedbackText) {

		if (username != null) {
			this.username = username;
		}
		ModelAndView mv = new ModelAndView();

		Quiz quiz = quizDAO.getQuizById(quizNumber);
		List<QuestionObject> questions = quiz.getQuestionObjects();
		for (QuestionObject qo : questions) {

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
			System.out.println("initial Quiz load, user is " + username);
			attemptId = attemptDAO.createNewAttempt(userDAO.getUserByUserName(username).getId(), quizNumber);
			System.out.println(attemptId);
		case "nextQuestion":

			mv.setViewName("takeQuiz.jsp");
			mv.addObject("quiz", quiz);
			mv.addObject("quizNumber", quizNumber);
			mv.addObject("questionNumber", questionNumber);
			mv.addObject("question", question);

			if (questionRatingText != null) {
				System.out.println(username);
				User user = new User();
				if (this.username == null) {
					user = userDAO.getUserByUserName("Anonymous");
				} else {
					user = userDAO.getUserByUserName(this.username);
				}
				int questionRating = Integer.parseInt(questionRatingText);
				questionRatingDAO.createNewQuestionRating(questionRating, feedbackText, user, question);
			}
			break;
		case "submittingForGrade":

			mv.setViewName("takeQuiz.jsp");
			mv.addObject("quiz", quiz);
			mv.addObject("quizNumber", quizNumber);
			mv.addObject("questionNumber", questionNumber);
			mv.addObject("question", question);
			ldt = new LevenshteinDistTest();
			Double percentMatch = ldt.levPercent(answerText.toLowerCase(), question.getAnswer().toLowerCase());
			String percentMatch2 = "%" + String.format("%.2f", percentMatch * 100);
			mv.addObject("percentMatch", percentMatch2);
			mv.addObject("rightAnswer", question.getAnswer());
			mv.addObject("userAnswer", answerText);
			boolean wasCorrect = false;
			if (percentMatch > .75) {
				mv.addObject("passFail", "Correct!");
				wasCorrect = true;
			} else {
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
			for (AttemptQuestion aq : attemptSet) {
				attemptList.add(aq);
				if (aq.getPassFail()) {
					count++;
				}
			}
			Double percentCorrect = ((double) (count)) / attemptList.size();
			String percentCorrect2 = "%" + String.format("%.2f", percentCorrect * 100);
			mv.addObject("quiz", quiz);
			mv.addObject("percentCorrect", percentCorrect2);
			mv.addObject("answeredQuestions", attemptList);
			break;
		case "error":
		default:
			mv.setViewName("welcome.jsp");
			mv.addObject("quizzes", quizDAO.getAllQuizzes());
			mv.addObject("error", "Quiz does not exist!");
		}

		return mv;
	}

	@RequestMapping(path = "rateQuiz", method = RequestMethod.GET)
	public ModelAndView rateQuiz(@RequestParam(name = "quizNumber") Integer quizNumber,
			@RequestParam(name = "quizNumber") Integer quizRating,
			@RequestParam(name = "feedbackText", required = false) String feedbackText) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("welcome.jsp");
		User user = new User();
		if (username == null) {
			user = userDAO.getUserByUserName("Anonymous");
		} else {
			user = userDAO.getUserByUserName(this.username);
		}
		quizRatingDAO.createNewQuizRating(quizRating, feedbackText, user, quizDAO.getQuizById(quizNumber));
		mv.addObject("quizzes", quizDAO.getAllQuizzes());
		return mv;
	}

	@RequestMapping(path = "viewQuiz", method = RequestMethod.GET)
	public ModelAndView viewQuiz(@RequestParam(name = "quizID") Integer quizID,
			@RequestParam(name = "username") String username) {
		ModelAndView mv = new ModelAndView();
		mv.setViewName("viewQuiz.jsp");

		boolean allowedToViewQuestions = false;
		Quiz quiz = quizDAO.getQuizById(quizID);

		String createdOrAttempted = null;
		String score = null;
		if (username != null && username != "Anonymous") {
			User u = userDAO.getUserByUserName(username);
			// view is allowed if user either created or has attempted the quiz
			if (quiz.getUser().equals(u)){
				createdOrAttempted = "created";
				allowedToViewQuestions = true;
			} else if (quiz.hasAttempted(u)){
				createdOrAttempted = "attempted";
				allowedToViewQuestions = true ;
			}
		}

		mv.addObject("quiz", quiz);
		if (allowedToViewQuestions){
			mv.addObject("allowedToViewQuestions", "true"); //will be null if false
			mv.addObject("createdOrAttempted", createdOrAttempted);
		}
		return mv;
	}

}