package com.example.demo.dormain;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.EnumType;
import jakarta.persistence.Enumerated;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.Table;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
@Builder
@Entity
@Table(name = "USERS")
public class User {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, length = 50, unique = true)
	private String username;

	@Column(length = 50)
	private String password;

	@Column(nullable = false, length = 100)
	private String email;

	@Enumerated(EnumType.STRING)
	private RoleType role;
	
	public boolean isAdmin() {
		return this.role == RoleType.ADMIN;
	}

	@CreationTimestamp
	private Timestamp createDate;
}
