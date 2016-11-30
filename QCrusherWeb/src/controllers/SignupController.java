package controllers;

import java.io.DataOutputStream;
import java.net.HttpURLConnection;
import java.net.URL;
import java.nio.charset.StandardCharsets;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import dao.UserDAO;

@Controller
public class SignupController {
	@Autowired
	private UserDAO userDAO;

	@RequestMapping(value = "signup", method = RequestMethod.GET)
	public ModelAndView signup(@RequestParam(value = "error", required = false) String error) {

		ModelAndView model = new ModelAndView();
		if (error != null) {
			model.addObject("error", error);
		}

		model.setViewName("signup.jsp");

		return model;
	}

	@RequestMapping(value = "createNewUser", method = RequestMethod.GET)
	public ModelAndView createNewUser(String username, String password) {
		ModelAndView model = new ModelAndView();
		if (userDAO.createNewUser(username, password)) {
			model.setViewName("j_spring_security_check");
			model.setViewName("login");
			model.addObject("msg", "Account created! Please login with your new credentials.");
		} else {
			model.setViewName("signup");
			model.addObject("error", "Username already exists!");
		}
		return model;
	}
}
