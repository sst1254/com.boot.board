package com.example.demo.dormain;

import java.sql.Timestamp;

import org.hibernate.annotations.CreationTimestamp;
import org.springframework.context.annotation.EnableAspectJAutoProxy;

import jakarta.persistence.Column;
import jakarta.persistence.Entity;
import jakarta.persistence.FetchType;
import jakarta.persistence.GeneratedValue;
import jakarta.persistence.GenerationType;
import jakarta.persistence.Id;
import jakarta.persistence.JoinColumn;
import jakarta.persistence.Lob;
import jakarta.persistence.ManyToOne;
import lombok.AllArgsConstructor;
import lombok.Builder;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@AllArgsConstructor
@NoArgsConstructor
@Builder
@EnableAspectJAutoProxy
@Entity
public class Post {

	@Id

	@GeneratedValue(strategy = GenerationType.IDENTITY)
	private int id;

	@Column(nullable = false, length = 100)
	private String title;

	@Lob
	@Column(nullable = false, length = 2000)
	private String content;

	@CreationTimestamp
	private Timestamp CreateDate;

	private int cnt;

	@ManyToOne(fetch = FetchType.EAGER)
	@JoinColumn(name = "userid")
	private User user;
}
