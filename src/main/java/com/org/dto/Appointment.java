package com.org.dto;

import javax.persistence.CascadeType;
import javax.persistence.Entity;
import javax.persistence.GeneratedValue;
import javax.persistence.GenerationType;
import javax.persistence.Id;
import javax.persistence.JoinColumn;
import javax.persistence.ManyToOne;
import javax.persistence.OneToMany;
import javax.persistence.OneToOne;

import lombok.AllArgsConstructor;
import lombok.Getter;
import lombok.NoArgsConstructor;
import lombok.Setter;

@Getter
@Setter
@Entity
public class Appointment {
	
	@Id
	@GeneratedValue(strategy = GenerationType.IDENTITY)
    private int id;
	
	private String name;
	
	private int age;
	
	private String gender;
	
	private String email;
	
	private long mobile;
	
	private String disease;
	
	private String status ="pending";
	
	private String appointmentDate;
	
	private long aadhar;
	
	private String address;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	private Doctor doctor;
	
	@ManyToOne(cascade = CascadeType.ALL)
	@JoinColumn
	private User user;

}
