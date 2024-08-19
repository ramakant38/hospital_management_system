package com.org.controller;

import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.dao.AdminDao;
import com.org.dao.DoctorDao;
import com.org.dto.Admin;

@Controller
public class AdminController {

	@Autowired
	private AdminDao adminDao;
	
	@Autowired
	private DoctorDao doctorDao;

	@GetMapping("/temp_admin")
	public ModelAndView adminHome() {
		ModelAndView mav = new ModelAndView("admin/admin_homepage.jsp");
		return mav;
	}

	@PostMapping("/admin_register")
	public ModelAndView admin_register(@ModelAttribute Admin admin) {
		ModelAndView mav = new ModelAndView("admin_register.jsp");
		adminDao.insertAndUpdate(admin);
		mav.addObject("success", "Registration Successfull");
		return mav;
	}

	@PostMapping("/admin_login")
	public ModelAndView admin_login(HttpSession session, @RequestParam("email") String email,
			@RequestParam("password") String pwd) {
		List<Admin> list = adminDao.verifyAdminByEmailAndPassword(email, pwd);
		if (list.isEmpty()) {
			ModelAndView mav = new ModelAndView("admin_login.jsp");
			mav.addObject("failed", "Invalid Email or Password");
			return mav;
		}
		ModelAndView mav = new ModelAndView("admin/admin_homepage.jsp");
		session.setAttribute("adminId", list.get(0).getId());

		return mav;
	}

	@GetMapping("/adminlogout")
	public ModelAndView logout(HttpSession session, @RequestParam int id) {
		int adminId = (int) session.getAttribute("adminId");
		if (id == adminId) {
            session.removeAttribute("adminId");
            ModelAndView mav = new ModelAndView("admin_login.jsp");
            return mav;
		}
		ModelAndView mav = new ModelAndView("admin/admin_homepage.jsp");
		return mav;
	}
	
	@GetMapping("/deleteDoctor")
	public ModelAndView delete(@RequestParam int id) {
		ModelAndView mav = new ModelAndView("doctor/fetch_doctor.jsp");
		System.out.println(id);
		boolean flag = doctorDao.deleteDoctor(id);
		if(flag) {
			ModelAndView mav1 = new ModelAndView("doctor/fetch_doctor.jsp");
			return mav1;
		}
		return mav;
	}

}
