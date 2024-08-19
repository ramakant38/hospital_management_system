package com.org.controller;

import java.util.ArrayList;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;

import com.org.dao.AppointmentDao;
import com.org.dao.DoctorDao;
import com.org.dao.UserDao;
import com.org.dto.Appointment;
import com.org.dto.Doctor;
import com.org.dto.User;

@Controller
public class AppointmentController {

	@Autowired
	private AppointmentDao appointmentDao;

	@Autowired
	private DoctorDao doctorDao;
	
	@Autowired
	private UserDao userDao;

	@GetMapping("/temp_appointment")
	public ModelAndView tempAppointment() {
		ModelAndView mav = new ModelAndView("user/add_appointment.jsp");
		return mav;
	}

	@PostMapping("/addAppointment")
	public ModelAndView appointment(@ModelAttribute Appointment appointment, @RequestParam int doctorId,
			@RequestParam int userId) {
		ModelAndView mav = new ModelAndView("user/user_homepage.jsp");
		Doctor doctor = doctorDao.fetchDoctor(doctorId);

		appointment.setDoctor(doctor);
		
		User user = userDao.fetchUser(userId);
		List<Appointment> list = user.getAppointment();
		if(list == null) {
			list = new ArrayList<Appointment>();
			list.add(appointment);
		}
		else
			list.add(appointment);
		
		List<Appointment> listOfAppointment = doctor.getAppointment();
		listOfAppointment.add(appointment);
		doctor.setAppointment(listOfAppointment);
		
		user.setAppointment(list);
		appointment.setUser(user);

		appointmentDao.insertAndUpdate(appointment);
		

		return mav;
	}
	
	@GetMapping("/temp_view")
	public ModelAndView viewAppointment() {
		ModelAndView mav = new ModelAndView("user/view_appointment.jsp");
		return mav;
	}
	
	@GetMapping("/updateAccept")
	public ModelAndView updateAccept(@RequestParam int id) {
		System.out.println(id);
		ModelAndView mav = new ModelAndView("doctor/doctor_homepage.jsp");
		Appointment appointment = appointmentDao.fetchAppointment(id);
		
		appointment.setStatus("accepted");
		
		appointmentDao.insertAndUpdate(appointment);
		
		return mav;
	}
	
	@GetMapping("/updateReject")
	public ModelAndView updateReject(@RequestParam int id) {
		ModelAndView mav = new ModelAndView("doctor/doctor_homepage.jsp");
		Appointment appointment = appointmentDao.fetchAppointment(id);
		
		appointment.setStatus("rejected");
		
		appointmentDao.insertAndUpdate(appointment);
		
		return mav;
	}
	
	@GetMapping("/updateEdit")
	public ModelAndView updateEdit(HttpSession session ,@RequestParam int id) {
		ModelAndView mav = new ModelAndView("user/edit_appointment.jsp");
		Appointment appointment = appointmentDao.fetchAppointment(id);
		
		session.setAttribute("fetch", appointment);
		return mav;
	}
	
	@PostMapping("/editAppointment")
	public ModelAndView edit(@ModelAttribute Appointment appointment, @RequestParam int doctorId, @RequestParam int userId) {
		ModelAndView mav = new ModelAndView("user/view_appointment.jsp");
		
		Doctor doctor = doctorDao.fetchDoctor(doctorId);
		User user = userDao.fetchUser(userId);
		appointment.setDoctor(doctor);
		appointment.setUser(user);
		
		List<Appointment> list = doctor.getAppointment();
		list.add(appointment);
		
		List<Appointment> list2 = user.getAppointment();
		doctor.setAppointment(list);
		user.setAppointment(list2);
		
		appointmentDao.insertAndUpdate(appointment);
		
		return mav;
		
	}
}
