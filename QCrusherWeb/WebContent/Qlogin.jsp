<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">

<head>

<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1">
<meta name="description" content="">
<meta name="author" content="">

<title>QuizCrusher</title>

<!-- Bootstrap Core CSS -->
<link href="css/bootstrap.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="css/one-page-wonder.css" rel="stylesheet">
<link rel="stylesheet" type="text/css" href="css/custom.css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

</head>

<body>

	<!-- Navigation -->
	<nav class="navbar navbar-inverse navbar-fixed-top" role="navigation">
		<div class="container">
			<!-- Brand and toggle get grouped for better mobile display -->
			<div class="navbar-header">
				<button type="button" class="navbar-toggle" data-toggle="collapse"
					data-target="#bs-example-navbar-collapse-1">
					<span class="sr-only">Toggle navigation</span> <span
						class="icon-bar"></span> <span class="icon-bar"></span> <span
						class="icon-bar"></span>
				</button>
				<a class="navbar-brand" href="#">QCrusher</a>
			</div>
			<!-- Collect the nav links, forms, and other content for toggling -->
			<div class="collapse navbar-collapse"
				id="bs-example-navbar-collapse-1">
				<ul class="nav navbar-nav">
					<li><a href="about.html">About</a></li>
					<li><a href="profile.do">Profile</a></li>
					<li><a href="takeQuiz.do">Take Quiz</a></li>
					<li><a href="createAccount.do">Create Account</a></li>
				</ul>
			</div>
			<!-- /.navbar-collapse -->
		</div>
		<!-- /.container -->
	</nav>

	<!-- Full Width Image Header -->
	<header class="header-image">
		<div class="headline">
			<div class="container">
				<h1>Quiz Crusher</h1>
				<h2>Login Page</h2>
			</div>
		</div>
	</header>

	<!-- Page Content -->
	<div class="container">

		<hr class="featurette-divider">

		<!-- Second Featurette -->
		<div class="featurette" id="services">
			<img class="featurette-image img-circle img-responsive pull-left"
				src="https://cutelypoisoned.files.wordpress.com/2011/08/question-marks-background-cute.gif">

			<p class="lead">
				Username: <input type="text" name="username"> Password: <input
					type="text" name="password">
			<form method="link" action="main.do">
				<input type="submit" value="Log In">
	</form>
		<form method="link" action="createAccount.do">
		<input type="submit" value="Create Account">
	</form>

	<form method="link" action="takeQuiz.do">
		<input type="submit" value="Take Quiz">
	</form>
	<form method="link" action="takeQuiz.do">
		<input type="submit" value="Continue as Guest">
	</form>
	
	</p>
			
        </div>

        <hr class="featurette-divider">


        <!-- Footer -->
        <footer>
            <div class="row">
                <div class="col-lg-12">
                    <p>Copyright &copy; Joshua Bone, Kyle Ennis, Yvette Menase | SD7, 2016</p>
                </div>
            </div>
        </footer>

    </div>
    <!-- /.container -->

    <!-- jQuery -->
    <script src="js/jquery.js"></script>

    <!-- Bootstrap Core JavaScript -->
    <script src="js/bootstrap.min.js"></script>

</body>

</html>
