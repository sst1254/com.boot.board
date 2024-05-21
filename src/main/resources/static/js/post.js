//postObject 객체 선언
let postObject = {
	//init 메소드 선언
	init: function() {
		let _this = this;

		$("#btn-insert").on("click", () => {
			_this.insertPost();
		});

		$("#btn-delete").on("click", () => {
			_this.deletePost();
		});

		$("#btn-update").on("click", () => {
			_this.updatePost();
		});
	},

	insertPost: function() {
		alert("글등록 처리")

		let post = {
			title: $("#title").val(),
			content: $("#content").val()
		}

		$.ajax({
			type: "POST",
			url: "/post/insertPost",
			data: JSON.stringify(post),
			contentType: "application/json; charset = utf-8"
		}).done(function(response) {
			console.log(response);
			location = "/";
		});
	},

	deletePost: function(){
		alert("글삭제 처리")
		
		let id = $("#id").val()
			
		$.ajax({
			type: "DELETE",
			url: "/post/deletePost/" + id
			
		}).done(function(response){
			alert("글삭제 완료");
			location = "/";
		}).fail(function(error){
			alert("에러발생:" + error);
		});
	},





	updatePost: function() {
		alert("글 수정하기");

		let update = {
			id: $("#id").val(),
			title: $("#title").val(),
			content: $("#content").val()
		}

		$.ajax({
			type: "PUT",
			url: "/post/updatePost",
			data: JSON.stringify(update),
			contentType: "application/json; charset = utf-8"
		}).done(function(response) {
			alert("글 수정완료!")
			console.log(response);
			location = "/";
		});
	},
}
postObject.init();