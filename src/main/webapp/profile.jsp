<%@page import="model.User"%>
<%@page import="constant.sessionAthtt"%>
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="ISO-8859-1">
<title>ProFile User</title>
<link rel="icon" type="image/png" sizes="16x16" href="https://www.youtube.com/s/desktop/2fc4f2e2/img/favicon_32x32.png">
<link
	href="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/css/bootstrap.min.css"
	rel="stylesheet">
<script
	src="https://cdn.jsdelivr.net/npm/bootstrap@5.0.0-alpha1/dist/js/bootstrap.bundle.min.js"></script>
<style type="text/css">
#changePasswordForm {
	background-color: white;
}

body {
	background: rgb(99, 39, 120)
}

.form-control:focus {
	box-shadow: none;
	border-color: #BA68C8
}

.profile-button {
	background: rgb(99, 39, 120);
	box-shadow: none;
	border: none
}

.profile-button:hover {
	background: #682773
}

.profile-button:focus {
	background: #682773;
	box-shadow: none
}

.profile-button:active {
	background: #682773;
	box-shadow: none
}

.chanepassword-button {
	background: #FF66CC;
	box-shadow: none;
	border: none
}

.chanepassword-button:hover {
	background: #66FF00
}

.chanepassword-button:focus {
	background: #682773;
	box-shadow: none
}

.chanepassword-button:active {
	background: #682773;
	box-shadow: none
}

.back:hover {
	color: #682773;
	cursor: pointer
}

.labels {
	font-size: 11px
}

.add-experience:hover {
	background: #BA68C8;
	color: #fff;
	cursor: pointer;
	border: solid 1px #BA68C8
}
</style>
</head>
<body>
	<div class="container rounded bg-white mt-5 mb-5">
		<div class="row">
			<div class="col-md-3 border-right">
				<div
					class="d-flex flex-column align-items-center text-center p-3 py-5">
					<%
					User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
					%>
					<img class="rounded-circle mt-5" width="150px"
						src="https://st3.depositphotos.com/15648834/17930/v/600/depositphotos_179308454-stock-illustration-unknown-person-silhouette-glasses-profile.jpg">
					<span class="font-weight-bold">${currentUser.id}</span> <span
						class="text-black-50">${currentUser.email}</span><span> </span>
				</div>
			</div>
			<div class="col-md-5 border-right">
				<div class="p-3 py-5">
					<div class="d-flex justify-content-between align-items-center mb-3">
						<h4 class="text-right">Profile Settings</h4>
					</div>
					<form action="" method="post">
						<div class="row mt-3">
							<div class="col-md-12">
								<label class="label">Họ Tên</label> <input type="text"
									class="form-control" value="${currentUser.fullname}"
									name="fullname">
							</div>
							<div class="col-md-12">
								<label class="label">Email:</label> <input type="text"
									class="form-control" value="${currentUser.email}" name="email">
							</div>
							<div class="mt-5 text-center">
								<a href="update-profile">
									<button class="btn btn-primary profile-button" type="submit"
										formaction="update-profile">Save Profile</button>
								</a> <a href="#">
									<button type="button" id="changePasswordBtn"
										class="btn btn-primary chanepassword-button">Đổi mật
										khẩu</button>
								</a>
							</div>
						</div>
					</form>
				</div>
			</div>
			<div class="modal fade" id="changePasswordModal" tabindex="-1"
				aria-labelledby="changePasswordModalLabel" aria-hidden="true">
				<div class="modal-dialog">
					<div class="modal-content">
						<div class="modal-header">
							<h5 class="modal-title" id="changePasswordModalLabel">Change
								Password</h5>
							<button type="button" class="btn-close" data-bs-dismiss="modal"
								aria-label="Close"></button>
						</div>
						<div class="modal-body">
							<form action="changepassword" method="post">
								<div class="form-group">
									<label for="currentPassword">Current Password</label> <input
										type="password" class="form-control" name="password">
								</div>
								<div class="form-group">
									<label for="newPassword">New Password</label> <input
										type="password" class="form-control" name="passwordnew">
								</div>
								<div class="form-group">
									<label for="confirmNewPassword">Confirm New Password</label> <input
										type="password" class="form-control" name="passwordcomfirm">
								</div>
								<div class="modal-footer">
									 <input type="submit" class="btn btn-primary" value="Save changes">
								</div>
							</form>
						</div>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script>
  const changePasswordBtn = document.querySelector('#changePasswordBtn');
  const closeChangePasswordFormBtn = document.querySelector('[data-bs-dismiss="modal"]');
  const changePasswordForm = document.querySelector('#changePasswordModal');

  changePasswordBtn.addEventListener('click', () => {
    changePasswordForm.classList.toggle('show');
    changePasswordForm.style.display = 'block';
  });

  closeChangePasswordFormBtn.addEventListener('click', () => {
    changePasswordForm.classList.remove('show');
    changePasswordForm.style.display = 'none';
  });
</script>


</body>
</html>