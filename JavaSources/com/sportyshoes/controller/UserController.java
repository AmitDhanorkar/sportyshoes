package com.sportyshoes.controller;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RequestParam;

import com.sportyshoes.entity.User;
import com.sportyshoes.services.SecurityService;
import com.sportyshoes.services.UserService;
import com.sportyshoes.validator.UserValidator;


@Controller
public class UserController {

	@Autowired
	private UserService userService;
	
	@Autowired
	private SecurityService securityService;

	@Autowired
	private UserValidator userValidator;
	
	@RequestMapping(value = "/signUp", method = RequestMethod.GET)
	public String signUp(Model model) {
		model.addAttribute("userForm", new User());

		return "signup";
	}
	
	@RequestMapping(value = "/signUp", method = RequestMethod.POST)
	public String signUp(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		
		userValidator.validate(userForm, bindingResult);

		if (bindingResult.hasErrors()) {
			return "signup";
		}
		userService.save(userForm);

		securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());
		
		return "redirect:/login";
	}
	
	@RequestMapping(value = "/changepassword", method = RequestMethod.GET)	
	public String changePassword(@RequestParam("username") String username, Model model) {
		model.addAttribute("userForm", userService.findByUsername(username));
		return "changepassword";
	}
	
	@RequestMapping(value = "/changepassword", method = RequestMethod.POST)	
	public String changePassword(@ModelAttribute("userForm") User userForm, BindingResult bindingResult, Model model) {
		
		userService.update(userForm);

		securityService.autologin(userForm.getUsername(), userForm.getPasswordConfirm());
		
		return "redirect:/welcome";		
	}
	
	@RequestMapping(value = "/userList", method = RequestMethod.GET)	
	public String userList(Model model) {
		List<User> list = userService.listOfAllSignUpUsers();
		model.addAttribute("listOfSignUpUsers", list);
		return "userlist";
	}
	
	@RequestMapping(value = "/searchUser", method = RequestMethod.GET)	
	public String searchUser( @RequestParam(value = "username", required = true) String username, Model model) {
		List<User> list = new ArrayList<>();
		User user = userService.findByUsername(username);
		list.add(user);
		model.addAttribute("listOfSignUpUsers", list);
		return "userlist";
	}
	
	
	@RequestMapping(value = "/login", method = RequestMethod.GET)
	public String login(Model model, String error, String logout) {
		if (error != null)
			model.addAttribute("error", "Your username and password is invalid.");

		if (logout != null)
			model.addAttribute("message", "You have been logged out successfully.");

		return "login";
	}

	@RequestMapping(value = {"/", "/welcome"}, method = RequestMethod.GET)
	public String welcome(Model model) {
			return "redirect:/listProducts";
	}
}