package com.example.demo.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Transactional;

import com.example.demo.dormain.Post;
import com.example.demo.persistence.PostRepository;

@Service
public class PostService {

	@Autowired
	private PostRepository postRepository;

	@Transactional
	public void insertPost(Post post) {
		postRepository.save(post);
	}

	@Transactional(readOnly = true)
	public Page<Post>getPostPage(Pageable pageable){
		return postRepository.findAll(pageable);
	}
	
	@Transactional
	public void getCnt(int postId) {
		Post post = postRepository.findById(postId).orElse(null);
		if(post != null) {
			post.setCnt(post.getCnt() +1);
			postRepository.save(post);
		}
	}

	@Transactional(readOnly = true)
	public Post getPost(int id) {
		Post findPost = postRepository.findById(id).orElseGet(() -> {
			return new Post();
		});

		return findPost;

	}

	@Transactional
	public void deletePost(int id) {
		postRepository.deleteById(id);
	}

	@Transactional
	public void updatePost(Post post) {
		Post findPost = postRepository.findById(post.getId()).get();
		findPost.setTitle(post.getTitle());
		findPost.setContent(post.getContent());
	}

}
