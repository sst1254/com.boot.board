
let loginObject = {
	init: function() {
		let _this = this;

		$("#btn-login").on("click", () => {
			_this.login();
		});
	},

	login: function() {
		alert("로그인 요청");

		let user = {
			username: $("#username").val(),
			password: $("#password").val()
		};

		$.ajax({
			type: "POST",
			url: "/auth/login",
			data: JSON.stringify(user),
			contentType: "application/json; charset=utf-8"
		}).done(function(response) {
			let message = response["data"];
			alert(message);
			location = "/";

		}).fail(function(error) {
			let message = error["data"]
			alert("문제 발생 :" + message);
		});
	},
}
loginObject.init();