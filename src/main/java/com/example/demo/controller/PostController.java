package com.example.demo.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.data.domain.Page;
import org.springframework.data.domain.Pageable;
import org.springframework.data.web.PageableDefault;
import org.springframework.http.HttpStatus;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.PutMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.ResponseBody;

import com.example.demo.dormain.Post;
import com.example.demo.dormain.User;
import com.example.demo.dto.ResponseDTO;
import com.example.demo.service.PostService;

import jakarta.servlet.http.HttpSession;

@Controller
public class PostController {

	@Autowired
	private PostService postService;

	@GetMapping("/post/insertPost")
	public String insertPostPage() {
		return "post/insertPost";
	}

	@PostMapping("/post/insertPost")
	public @ResponseBody ResponseDTO<?> insertPost(@RequestBody Post post, HttpSession session) {

		User principal = (User) session.getAttribute("principal");
		post.setUser(principal);
		postService.insertPost(post);

		return new ResponseDTO<>(HttpStatus.OK.value(), "님의 글 등록 완료");

	}

	@GetMapping("/post/getPostList")
	public String getPostList(HttpSession session, @PageableDefault(size = 10) Pageable pageable, Model model) {
		Page<Post> postPage = postService.getPostPage(pageable);
		session.setAttribute("postPage", postPage);
		return "post/getpostList";
	}

	@GetMapping("/post/getPost/{id}")
	public String getPost(HttpSession session, @PathVariable int id) {
		postService.getCnt(id);
		Post post = postService.getPost(id);
		session.setAttribute("post", post);
		return "post/getPost";
	}

//	@DeleteMapping("/post/deletePost/{id}")
//	public @ResponseBody ResponseDTO<?> deletePost(@PathVariable int id) {
//		postService.deletePost(id);
//
//		return new ResponseDTO<>(HttpStatus.OK.value(), id + "번 글 삭제");
//
//	}

	@DeleteMapping("/post/deletePost/{id}")
	public @ResponseBody ResponseDTO<?> deletePost(@PathVariable int id, HttpSession session) {
		User user = (User) session.getAttribute("principal");
		Post post = postService.getPost(id);

		// 현재 사용자가 작성자인 경우에만 삭제를 허용
		if (user != null && user.getId() == post.getUser().getId()) {
			postService.deletePost(id);
			return new ResponseDTO<>(HttpStatus.OK.value(), id + "번 글 삭제");
		} else {
			return new ResponseDTO<>(HttpStatus.UNAUTHORIZED.value(), "작성자만이 글을 삭제할 수 있습니다.");
		}
	}

	@GetMapping("/post/updatePost/{id}")
	public String updatePostpage(@PathVariable int id, Model model) {
		model.addAttribute("post", postService.getPost(id));

		return "post/updatePost";
	}

	@PutMapping("/post/updatePost")
	public @ResponseBody ResponseDTO<?> updatePost(@RequestBody Post post) {
		postService.updatePost(post);
		return new ResponseDTO<>(HttpStatus.OK.value(), post.getId() + "번 글 수정 완료");
	}

}
