package com.pagecontroller.in;

import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import com.EMSbackend.in.dao.UserDao;
import com.EMSbackend.in.entities.User;
import com.EMSbackend.in.helper.Message;

@Controller

public class PageController {
	@Autowired
	private UserDao userDao;

	@RequestMapping("/")
	public String home() {

		return "home";
	}

	@RequestMapping("/about")
	public String about() {

		return "AboutUs";
	}

	@RequestMapping("/contact")
	public String contact() {

		return "ContactUs";
	}

	@RequestMapping("/signup")
	public String signup() {

		return "signup";
	}

	@RequestMapping("/login")
	public String login() {

		return "login";
	}

	@RequestMapping(value = "/registered", method = RequestMethod.POST)

	public String registerUser(@Valid @ModelAttribute("user") User user, BindingResult result, HttpSession session,
			Model model) {

		if (result.hasErrors()) {
			model.addAttribute("firstNameClass",
					result.hasFieldErrors("firstName") ? "form-control is-invalid" : "form-control");
			model.addAttribute("emailClass",
					result.hasFieldErrors("email") ? "form-control is-invalid" : "form-control");
			model.addAttribute("lastNameClass",
					result.hasFieldErrors("email") ? "form-control is-invalid" : "form-control");
			model.addAttribute("passwordClass",
					result.hasFieldErrors("email") ? "form-control is-invalid" : "form-control");
			return "signup";
		} else {

			boolean registerUser = userDao.registerUser(user);

			if (registerUser) {

				session.setAttribute("msg", new Message("Registered Successfully", "alert-success"));

				return "redirect:/signup";

			} else {
				session.setAttribute("msg", new Message("An Error Occurred", "alert-danger"));
				return "redirect:/signup";
			}
		}

	}

	// logiin

	@RequestMapping(value = "/loggedin", method = RequestMethod.POST)
	public String loginModule(@ModelAttribute("user") User user, HttpSession session, Model model) {

		User userByEmailAndPassword = userDao.getUserByEmailAndPassword(user.getEmail(), user.getPassword());

		if (userByEmailAndPassword != null) {

			session.setAttribute("user", userByEmailAndPassword);
			return "redirect:/dashboard";
		} else {
			session.setAttribute("msg", new Message("Invalid Username or Password", "alert-danger"));
			return "login";
		}
	}
}
