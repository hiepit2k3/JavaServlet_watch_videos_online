<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Login</title>
<link rel="icon" type="image/png" sizes="16x16" href="https://www.youtube.com/s/desktop/2fc4f2e2/img/favicon_32x32.png">
<!-- css  -->
<link href="css/login.css" rel="stylesheet">
<!-- Bootstraps v 4.5  -->

<style type="">
.popup {
	width: 320px;
	height: fit-content;
	background: #FFFFFF;
	box-shadow: 0px 187px 75px rgba(0, 0, 0, 0.01), 0px 105px 63px
		rgba(0, 0, 0, 0.05), 0px 47px 47px rgba(0, 0, 0, 0.09), 0px 12px 26px
		rgba(0, 0, 0, 0.1), 0px 0px 0px rgba(0, 0, 0, 0.1);
	border-radius: 13px;
	position: fixed;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	background-color: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
	display: none;
	top: 50%;
	left: 50%;
	transform: translate(-50%, -50%);
	z-index: 9999;
	background-color: white;
	padding: 20px;
	box-shadow: 0 0 10px rgba(0, 0, 0, 0.2);
}

.form {
	display: flex;
	flex-direction: column;
	align-items: flex-start;
	padding: 20px;
	gap: 20px;
}

.icon {
	display: flex;
	align-items: center;
	justify-content: center;
	width: 60px;
	height: 60px;
	background: #ECF1FD;
	box-shadow: 0px 0.5px 0.5px #EFEFEF, 0px 1px 0.5px
		rgba(239, 239, 239, 0.5);
	border-radius: 5px;
}

.note {
	display: flex;
	flex-direction: column;
	gap: 8px;
}

.title {
	font-style: normal;
	font-weight: 700;
	font-size: 17px;
	line-height: 24px;
	color: #2B2B2F;
}

.subtitle {
	font-style: normal;
	font-weight: 600;
	font-size: 13px;
	line-height: 18px;
	color: #5F5D6B;
}

.input_field {
	width: 100%;
	height: 42px;
	padding: 0 0 0 12px;
	border-radius: 5px;
	outline: none;
	border: 1px solid #e5e5e5;
	filter: drop-shadow(0px 1px 0px #efefef)
		drop-shadow(0px 1px 0.5px rgba(239, 239, 239, 0.5));
	transition: all 0.3s cubic-bezier(0.15, 0.83, 0.66, 1);
}

.input_field:focus {
	border: 1px solid transparent;
	box-shadow: 0px 0px 0px 1px #2B2B2F;
	background-color: transparent;
}

.submitbtn {
	display: flex;
	flex-direction: row;
	justify-content: center;
	align-items: center;
	padding: 10px 18px;
	gap: 10px;
	width: 100%;
	height: 42px;
	background: linear-gradient(180deg, #4480FF 0%, #115DFC 50%, #0550ED 100%);
	box-shadow: 0px 0.5px 0.5px #EFEFEF, 0px 1px 0.5px
		rgba(239, 239, 239, 0.5);
	border-radius: 5px;
	border: 0;
	font-style: normal;
	font-weight: 600;
	font-size: 12px;
	line-height: 15px;
	color: #ffffff;
}

.popup.show {
	display: block;
}

.popup .close {
	position: absolute;
	top: 10px;
	right: 10px;
	cursor: pointer;
}

.close-icon {
	position: absolute;
	top: 40px;
	right: 40px;
	font-size: 50px;
	color: #fff;
	cursor: pointer;
}
</style>
</head>

<body>

	<c:if test="${not empty errorMessage}">
		<div class="alert alert-danger" role="alert">${errorMessage}</div>
	</c:if>

	<div class="container" id="container">
		<div class="form-container sign-up-container">
			<form action="register" method="post">
				<h1>Tạo Tài Khoản</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>

				<input type="text" placeholder="Name" name="id" /> <input
					type="text" placeholder="FullName" name="fullname" /> <input
					type="email" placeholder="Email" name="email" /> <input
					type="password" placeholder="Password" name="password" /> <input
					type="password" placeholder="Password confirm"
					name="passwordcomfirm" />
				<button formaction="register">Đăng Ký</button>
			</form>
		</div>
		<div class="form-container sign-in-container">
			<form action="" method="post">
				<h1>Login</h1>
				<div class="social-container">
					<a href="#" class="social"><i class="fab fa-facebook-f"></i></a> <a
						href="#" class="social"><i class="fab fa-google-plus-g"></i></a> <a
						href="#" class="social"><i class="fab fa-linkedin-in"></i></a>
				</div>
				<span>Đăng nhập bằng</span> <input type="text" placeholder="Email"
					name="username" value="admin" /> <input type="password"
					placeholder="Password" name="password" value="123" /> <a href="#"
					id="forgetpassword">Quên mật khẩu?</a>
				<button formaction="">Đăng Nhập</button>
			</form>
		</div>
		<div class="overlay-container">
			<div class="overlay">
				<div class="overlay-panel overlay-left">
					<h1>Bạn Đã Có Tài Khoản!</h1>
					<p>Vui lòng nhập thông tin để đăng nhập</p>
					<button class="ghost" id="signIn">Đăng Nhập</button>
				</div>
				<div class="overlay-panel overlay-right">
					<h1>Xin Chào!</h1>
					<p>Đăng Kí Tài Khoản Để tận Hướng Video Chất Lượng Từ Chúng
						Tôi.</p>
					<button class="ghost" id="signUp">Đăng Ký Tài Khoản</button>
				</div>
			</div>
		</div>

		<!-- 	quên mat khau -->

		<div class="popup" id="popup">
			<span class="close" id="closeButton">&times;</span>
			<form action="forgetpassword"  method="post">
				<div class="note">
					<label class="title">ForgetPassword</label> <span
						class="subtitle">Bạn vui lòng nhập Email mà bạn đã đăng ký.</span>
				</div>
				<input placeholder="Enter your e-mail" title="Enter your e-mail"
					name="email" type="email" class="input_field" id="email">
				<input class="submitbtn" type="submit" />
			</form>
		</div>
	</div>
	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
        const signUpButton = document.getElementById('signUp');
        const signInButton = document.getElementById('signIn');
        const container = document.getElementById('container');

        signUpButton.addEventListener('click', () => {
            container.classList.add("right-panel-active");
        });

        signInButton.addEventListener('click', () => {
            container.classList.remove("right-panel-active");
        })
        
        /* lay lai mat khau */
        /* 
        $('#sendforget').click(function() {
			var email = $('email').val()
			$.ajax({
				url : 'forgetpassword',
				type : 'POST',
			}).then(function(data) {
				alert('gui mail thanh cong');
			}).fail(function(err) {
				console.log(err);
			})	
		}) */
        
/*         goi form lay mat khau
 */        
        function showForgetPasswordPopup() {
        	  const popup = document.getElementById("popup");
        	  popup.classList.add("show");
        	}

        const forgetPasswordLink = document.getElementById("forgetpassword");
        	forgetPasswordLink.addEventListener("click", (event) => {
        	  event.preventDefault();
        	  showForgetPasswordPopup();
        });

        const closeButton = document.getElementById("closeButton");
        	closeButton.addEventListener("click", () => {
        const popup = document.getElementById("popup");
        	  popup.classList.remove("show");
        });
        
        
    </script>

</body>

</html>