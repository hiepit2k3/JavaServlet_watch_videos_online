<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<!DOCTYPE html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<title>Lịch Sử</title>
<link rel="icon" type="image/png" sizes="16x16" href="https://www.youtube.com/s/desktop/2fc4f2e2/img/favicon_32x32.png">
<meta name="description" content="">
<meta name="viewport" content="width=device-width, initial-scale=1">


<link rel='stylesheet' media='screen' href='css/layoutindex.css'>

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />

<style type="text/css">
.title {
	color: blue;
	font-size: 24px;
	font-weight: bold;
	font-family: Montserrat;
}
</style>

</head>

<body style="background-color: #1f1e1e">
	<div class="container-fluid" style="background-color: #1f1e1e">
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
	<div class="container">
		<div class="row">
			<h4 class="title" style="color: white;font-family: fantasy;">Lịch Sử</h4>
		</div>
		<div class="col-sm-12">
			<c:forEach var="l" items="${listhistory}">
				<div class="row">
					<div class="col-sm-4">

						<iframe width="300" height="150"
							src="https://www.youtube.com/embed/${l.urlvideo}"
							title="YouTube video player" frameborder="0"
							allow="accelerometer; autoplay; clipboard-write; encrypted-media; gyroscope; picture-in-picture; web-share"
							allowfullscreen></iframe>

					</div>
					<div class="col-sm-8" style="margin-left: -22px;">

						<div class="col-sm-12">
							<a href="detail1?action=watch&id=${l.id}"
								style="text-decoration: none; color: black;">
								<div class="d-flex flex-row align-items-center">
									<div class="p-2">
										<p style="font-size: 24px;color: white;">${l.title}</p>
										<p style="font-size: 16px;color: white;">Lượt Xem: ${l.views}</p>
									</div>
								</div>
							</a>
						</div>
					</div>
				</div>
			</c:forEach>
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
</body>
</html>