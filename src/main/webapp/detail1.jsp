<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>

<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<link rel="icon" type="image/png" sizes="16x16" href="https://www.youtube.com/s/desktop/2fc4f2e2/img/favicon_32x32.png">
<title>Chi Tiết</title>
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="">

<link rel='stylesheet' media='screen' href='css/layoutindex.css'>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style>
.btn-like .fa-heart {
	color: #fff; /* Màu trắng */
}

.btn-like.liked .fa-heart {
	color: #f00; /* Màu đỏ */
}
</style>

</head>

<body>
	<div class="container-fluid" style="background-color: black;">
		<nav class="navbar navbar-expand-lg">
			<a class=" navbar-brand" href="#"></a>
			<button class="navbar-toggler" type="button" data-toggle="collapse"
				data-target="#navbarNav" aria-controls="navbarNav"
				aria-expanded="false" aria-label="Toggle navigation">
				<span class="navbar-toggler-icon"></span>
			</button>
			<div class="collapse navbar-collapse" id="navbarNav">
				<ul class="navbar-nav">
					<li class="nav-item"><a class="nav-link" href="QLVideo">Trang
							Chủ <span class="sr-only">(current)</span>
					</a></li>
					<li class="nav-item"><a class="nav-link" href="#">Liên Hệ</a>
					</li>
					<li class="nav-item"><a class="nav-link" href="#">Hỗ trợ</a></li>
				</ul>
				<ul class="navbar-nav ml-auto">
					<li class="nav-item dropdown"><a
						class="nav-link dropdown-toggle" href="#"
						id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
						aria-haspopup="true" aria-expanded="false"> <img
							src="img/profile.jpg" class="user-img" alt="User Image"
							onclick="showDropdown()">
					</a>
						<div class="dropdown-menu" id="user-dropdown"
							aria-labelledby="navbarDropdownMenuLink"
							onmouseleave="hideDropdown()">
							<c:choose>
								<c:when test="${not empty sessionScope.currentUser}">
									<a class="dropdown-item" href="history"><i
										class="fas fa-history"></i> Lịch sử xem</a>
									<a class="dropdown-item" href="user/edit-profile"><i
										class="fas fa-user-circle"></i> Thông tin cá nhân</a>
									<a class="dropdown-item" href="logout"><i
										class="far fa-user"></i> Đăng xuất</a>
								</c:when>
								<c:otherwise>
									<a class="dropdown-item" href="login"><i
										class="fas fa-sign-out-alt"></i> Đăng nhập</a>
									<a class="dropdown-item" href="login"><i
										class="far fa-user"></i> Đăng ký</a>
								</c:otherwise>
							</c:choose>
						</div></li>
					<li class="nav-item"><a class="nav-link"> <img
							src="img/covn.png" class="rectangle-img" alt="User Image">
					</a></li>
				</ul>
			</div>
		</nav>
	</div>
	<div class="container-fluid" style="background-color: #000000 ;color: white;">
		<div class="row">
			<div class="col-md-8">
				<div class="embed-responsive embed-responsive-16by9">
					<iframe class="embed-responsive-item"
						src="https://www.youtube.com/embed/${detailvideo.urlvideo}"
						title="YouTube video player" frameborder="0"
						allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
						allowfullscreen></iframe>
				</div>
				<div class="video-info mt-3">
					<h3 class="video-title">${detailvideo.title}</h3>
					<c:choose>
						<c:when test="${not empty sessionScope.currentUser}">
							<div class="social-icons">
								<div class="text-left" style="margin-left: 20px;">
									<span>Lượt xem:${detailvideo.views}</span>
								</div>
								<div class="text-right" style="margin-right: 20px;">
									<button id="likeorunlike"
										class="btn btn-primary rounded-pill btn-like"
										data-toggle="tooltip" data-placement="top" title="Like">
										<c:choose>
											<c:when test="${flaglikeVideo == true}">UnLike</c:when>
											<c:otherwise>Like</c:otherwise>
										</c:choose>
									</button>
									<button class="btn btn-primary rounded-pill btn-share"
										data-toggle="tooltip" data-placement="top" title="Chia sẻ">
										Chia Sẻ <i class="fa fa-share"></i>
									</button>
								</div>
							</div>

						</c:when>
					</c:choose>

					<input type="hidden" id="videoid" value="${detailvideo.id}">
					<div class="video-description mt-3">
						<h3 class="description-title">Mô Tả Video</h3>
						<p>${detailvideo.descriptions}</p>
					</div>
				</div>
			</div>

			<div class="col-md-4" style="color: white;">
				<h3 class="description-title">Video liên quan</h3>
				<c:forEach items="${ramdomVdeoList}" var="video">
					<div style="margin: 10px">
						<a class="row a" href="detail1?action=watch&id=${video.id}">
							<div class="col-md-4">
								<img src="${video.poster}" class="img-fluid rounded" alt="Ảnh">
							</div>
							<div class="col-md-8">
								<p style="color: white">${video.title}</p>
							</div>
						</a>

					</div>
				</c:forEach>
			</div>
			<!-- form share video -->

			<div class="modal-popup">
				<div class="popup-header">
					<h1>Chia sẻ video cho bạn bè của bạn chỉ bằng Email.</h1>
					<button class="close-btn">
						<i class="fas fa-times"></i>
					</button>
				</div>

				<div class="popup-body">
					<div class="popup-content">
						<form action="#" method="post" class="popup-form">
							<input type="email" class="popup-form-input"
								placeholder="Email Address" name="email" id="email" required>
							<button id="sharevideo" class="popup-form-submit" type="submit"
								value="Subscribe">Subscribe</button>
						</form>
						<span class="popup-alt-txt">Vui lòng nhập Email mà bạn muốn
							chia sẻ video.</span>
					</div>
				</div>
			</div>
		</div>
	</div>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
	<script>
		$('#likeorunlike').click(function() {
			console.log('chay');
			var videoid = $('#videoid').val();
			$.ajax({
				url : 'detail1?action=like&id=' + videoid
			}).then(function(data) {
				var text = $('#likeorunlike').text();
				console.log(text);
				if (text == "Like") {
					$('#likeorunlike').text('UnLike');
				} else {
					$('#likeorunlike').text('Like');
				}
			})
		});

		/* share video */
		
		
		$('#sharevideo').click(function() {
			var email = $('#email').val();
			alert(email);
			console.log(email);
			var videoid = $('#videoid').val();
			$.ajax({
				url: 'detail1?action=share&id=' + videoid
			})
		})
		
	/* 	lấy id */
		
		var dropdownMenu = document.getElementById("user-dropdown");

		// Function to show the dropdown menu
		function showDropdown() {
			dropdownMenu.classList.add("show");
		}

		// Function to hide the dropdown menu
		function hideDropdown() {
			dropdownMenu.classList.remove("show");
		}

		/* nút share */

		// Lấy đối tượng button và form
		var button = document.querySelector('.btn-share');
		var closeButton = document.querySelector('.close-btn');
		var form = document.querySelector('.modal-popup');

		// Xử lý sự kiện click chuột vào button
		button.addEventListener('click', function() {
			// Hiển thị form
			form.style.display = 'block';
		});
		closeButton.addEventListener('click', () => {
			form.style.display = 'none';
		});
		
		

	</script>
</body>

</html>