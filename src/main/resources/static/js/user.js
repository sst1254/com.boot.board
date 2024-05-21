
let userObject = {

	init: function() {
		let _this = this;

		$("#btn-save").on("click", () => {
			_this.insertUser();
		});
	},

	insertUser: function() {
		alert("회원가입 요청");


		let user = {
			username: $("#username").val(),
			password: $("#password").val(),
			email: $("#email").val()
		}

		$.ajax({
			type: "POST",
			url: "/auth/insertUser",
			data: JSON.stringify(user),
			contentType: "application/json; charset= utf-8"
		}).done(function(response) {
			console.log(response);
			alert("회원가입 완료!")
			location = "/";
		}).fail(function(error) {
			alert("에러발생 :" + error)
		});
	},
}
userObject.init();