<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>Quiz Selection</title>

</head>
<body>
<div>What is the capital of Alberta?</div>

<div>Answer: <input type="text" name="userAnswer">
	<a href="scoreQuiz.do">Submit</a>
	<a href="scoreQuiz.do">I don't know</a>
</div>
<div>
	Correct answer: ${correctAnswer }
	Percent Match${regexCalculation }
	<input class="quizButton" type="button" value="nextQuestion">Next</button>
	
	 <form action="demo_form.asp">
	 Feedback: <input type="text" name="feedback"><br>
	  <input type="submit" value="Submit">
	</form>
		Rating Box <div class="rating">
		<span>☆</span><span>☆</span><span>☆</span><span>☆</span><span>☆</span></div>
</div>

</body>
</html>