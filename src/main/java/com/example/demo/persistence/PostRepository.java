package com.example.demo.persistence;

import org.springframework.data.jpa.repository.JpaRepository;

import com.example.demo.dormain.Post;

public interface PostRepository extends JpaRepository<Post,Integer> {

}
