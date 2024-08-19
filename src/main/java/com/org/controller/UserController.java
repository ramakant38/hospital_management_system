package com.org.controller;

import java.util.List;
import java.util.Scanner;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.dao.UserDao;
import com.org.dto.User;
@Controller
public class UserController {
	@Autowired
	private UserDao userDao;
	
	@PostMapping("/user_register")
	public ModelAndView userRegister(@ModelAttribute User user) {
		ModelAndView mav = new ModelAndView("user_register.jsp");
		userDao.insertAndUpdate(user);
		mav.addObject("success1","User successfully registered");
		
		return mav;
	}
	
	@PostMapping("/user_login")
	public ModelAndView userlogin(HttpSession session, @RequestParam("email") String email, @RequestParam("password") String pwd) {
		
		List<User> list = userDao.verifyUserByEmailAndPassword(email, pwd);
		
		if(list.isEmpty()) {
			ModelAndView mav = new  ModelAndView("user_login.jsp");
			mav.addObject("fail","Invalid email or password");
			return mav;
		}
		session.setAttribute("userId", list.get(0).getId());
		ModelAndView mav = new ModelAndView("user/user_homepage.jsp");
		return mav;
	}
	
	@GetMapping("/userLogout")
	public ModelAndView logout(HttpSession session, @RequestParam int id) {
		int userId = (int) session.getAttribute("userId");
		if (id == userId) {
            session.removeAttribute("userId");
            ModelAndView mav = new ModelAndView("user_login.jsp");
            return mav;
		}
		ModelAndView mav = new ModelAndView("user/user_homepage.jsp");
		return mav;
	}
	
}
