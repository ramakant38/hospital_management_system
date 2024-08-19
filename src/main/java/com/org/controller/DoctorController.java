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

import com.org.dao.DoctorDao;
import com.org.dao.SpecialistDao;
import com.org.dto.Doctor;
import com.org.dto.Specialist;

@Controller
public class DoctorController {

	@Autowired
	private SpecialistDao specialistDao;

	@Autowired
	private DoctorDao doctorDao;

	@PostMapping("/add_specialist")
	public ModelAndView addDoctor(@ModelAttribute Specialist specialist) {
		ModelAndView mav = new ModelAndView("doctor/add_specialist.jsp");
		specialistDao.insertAndUpdate(specialist);
		mav.addObject("success", "Specialist Added");

		return mav;
	}

	@GetMapping("/temp_specialist")
	public ModelAndView addSpecialist() {
		ModelAndView mav = new ModelAndView("doctor/add_specialist.jsp");
		return mav;
	}

	@GetMapping("/temp_doctor")
	public ModelAndView tempDoctor() {
		ModelAndView mav = new ModelAndView("doctor/addAndUpdateDoctor.jsp");
		Doctor d = new Doctor();
		mav.addObject("doctor", d);

		List<Specialist> list = specialistDao.fetchAll();
		mav.addObject("list", list);

		return mav;
	}

	@PostMapping("/registerAndUpdateDoctor")
	public ModelAndView registerAndUpdate(@ModelAttribute Doctor doctor) {
		doctorDao.insertAndUpdate(doctor);
		ModelAndView mav = new ModelAndView("admin/admin_homepage.jsp");
		mav.addObject("success", "Successfully Updated");

		return mav;
	}

	@GetMapping("/fetchAllDoctors")
	public ModelAndView fetchDoctor() {
		ModelAndView mav = new ModelAndView("doctor/fetch_doctor.jsp");
		List<Doctor> list = doctorDao.fetchAll();
		mav.addObject("list", list);
		return mav;
	}

	@PostMapping("/doctor_login")
	public ModelAndView login(HttpSession session, @RequestParam String email, @RequestParam String password) {
		List<Doctor> list = doctorDao.verifyDoctorByEmailAndPassword(email, password);
		if (list.isEmpty()) {
			ModelAndView mav = new ModelAndView("doctor_login.jsp");
			mav.addObject("invalid", "Invalid Email and Password");
			return mav;
		}
		ModelAndView mav = new ModelAndView("doctor/doctor_homepage.jsp");
		session.setAttribute("doctorId", list.get(0).getId());
		return mav;
	}
	@GetMapping("/doctorlogout")
	public ModelAndView logout(HttpSession session, @RequestParam int id) {
		int doctorId = (int) session.getAttribute("doctorId");
		if (id == doctorId) {
            session.removeAttribute("doctorId");
            ModelAndView mav = new ModelAndView("doctor_login.jsp");
            return mav;
		}
		ModelAndView mav = new ModelAndView("doctor/doctor_homepage.jsp");
		return mav;
	}
	
	public ModelAndView profile(HttpSession session, @RequestParam int id) {
		ModelAndView mav = new ModelAndView("doctor/doctor_profile.jsp");
		
		Doctor doctor = doctorDao.fetchDoctor(id);
		session.setAttribute("profile", doctor);
		
		return mav;
	}
	
}
