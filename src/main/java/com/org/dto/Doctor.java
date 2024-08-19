package com.org.dto;

import java.util.List;

import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.OneToMany;

import lombok.Getter;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Doctor {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	private String name;
	
	private int age;
	
	private String email;
	
	private String password;
	
	private String specialist;
	
	private String dob;
	
	private int experience;
	
	private long mobile;
	
	@OneToMany(mappedBy = "doctor")
	private List<Appointment> appointment;

}
