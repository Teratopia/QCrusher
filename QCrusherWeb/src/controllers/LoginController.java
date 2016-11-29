package controllers;

import javax.persistence.EntityManager;
import javax.persistence.EntityManagerFactory;
import javax.persistence.Persistence;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import data.User;

@Controller
public class LoginController {
	@RequestMapping(value = "login", method = RequestMethod.GET)
	public ModelAndView login(@RequestParam(value = "error", required = false) String error) {
		
		ModelAndView model = new ModelAndView();
		if (error != null) {
			System.out.println(error);
			model.addObject("error", "Invalid username and password TEST TEST!");
		}

		model.setViewName("login.jsp");

		return model;

	}
}
