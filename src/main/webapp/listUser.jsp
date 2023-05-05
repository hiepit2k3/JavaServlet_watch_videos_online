
<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<link rel="icon" type="image/png" sizes="16x16" href="https://www.youtube.com/s/desktop/2fc4f2e2/img/favicon_32x32.png">
<!-- ICON -->
<title>Người dùng</title>
<script src="https://unpkg.com/phosphor-icons"></script>
<!-- MY CSS -->
<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">

<title>List User</title>

<style>
li {
	position: relative;
}

li:hover::before {
	content: attr(title);
	display: block;
	position: absolute;
	bottom: 100%;
	left: 50%;
	transform: translateX(-50%);
	padding: 5px;
	background-color: 00A97F;
	color: white;
}

.tooltip {
	position: absolute;
	background-color: black;
	color: white;
	padding: 5px;
	border-radius: 5px;
	font-size: 14px;
	white-space: nowrap;
}

.editbutton {
	--color: #00A97F;
	padding: 0.3em 1em;
	background-color: transparent;
	border-radius: .3em;
	position: relative;
	overflow: hidden;
	cursor: pointer;
	transition: .5s;
	font-weight: 400;
	font-size: 17px;
	border: 1px solid;
	font-family: inherit;
	text-transform: uppercase;
	color: var(--color);
	z-index: 1;
	width: 100px;
}

.editbutton::before, .editbutton::after {
	content: '';
	display: block;
	width: 50px;
	height: 50px;
	transform: translate(-50%, -50%);
	position: absolute;
	border-radius: 50%;
	z-index: -1;
	background-color: var(--color);
	transition: 1s ease;
}

.editbutton::before {
	top: -1em;
	left: -1em;
}

.editbutton::after {
	left: calc(100% + 1em);
	top: calc(100% + 1em);
}

.editbutton:hover::before, .editbutton:hover::after {
	height: 410px;
	width: 410px;
}

.editbutton:hover {
	color: white;
}

.editbutton:active {
	filter: brightness(.8);
}

.deletebutton {
	--color: #FF9900;
	padding: 0.3em 1em;
	background-color: transparent;
	border-radius: .3em;
	position: relative;
	overflow: hidden;
	cursor: pointer;
	transition: .5s;
	font-weight: 400;
	font-size: 17px;
	border: 1px solid;
	font-family: inherit;
	text-transform: uppercase;
	color: var(--color);
	z-index: 1;
	width: 100px
}

.deletebutton::before, .editbutton::after {
	content: '';
	display: block;
	width: 50px;
	height: 50px;
	transform: translate(-50%, -50%);
	position: absolute;
	border-radius: 50%;
	z-index: -1;
	background-color: var(--color);
	transition: 1s ease;
}

.deletebutton::before {
	top: -1em;
	left: -1em;
}

.deletebutton::after {
	left: calc(100% + 1em);
	top: calc(100% + 1em);
}

.deletebutton:hover::before, .editbutton:hover::after {
	height: 410px;
	width: 410px;
}

.deletebutton:hover {
	color: white;
}

.deletebutton:active {
	filter: brightness(.8);
}
</style>
</head>

<body>

	<!-- start: SIDEBAR -->
	<section id="sidebar">
		<a href="admin.jsp" class="brand"> <i class="ph-flame-fill"></i>
		</a>

		<ul class="sidebar__menu">
			<li title="Danh Sách Video"><a href="admin.jsp"><i
					class="ph-house-fill"></i></a></li>
			<li title="Add Video"><a href="addVideo.jsp"><i
					class="ph-clipboard-fill"></i></a></li>
			<li title="Edit Video"><a href="editVideo.jsp"><i
					class="ph-file-fill"></i></a></li>
			<li title="Danh Sách User"><a href="listUser.jsp"><i
					class="ph-user-circle-fill"></i></a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="ph-gear-fill"></i></a></li>
			<li title="Đăng Xuất"><a href="#" class="logout"><i
					class="ph-sign-out-fill"></i></a></li>
		</ul>
	</section>

	<!-- start: SIDEBAR OVERLAY -->
	<div class="sidebar-overlay"></div>
	<!-- end: SIDEBAR OVERLAY -->
	<!-- end: SIDEBAR -->

	<!-- start: SIDEBAR MOBILE -->
	<section id="sidebar-mobile">
		<i class="ph-squares-four-fill toggle-sidebar"></i> <a href="#"
			class="brand"> <i class="ph-flame-fill"></i> Adminweb
		</a>
	</section>
	<!-- end: SIDEBAR MOBILE -->

	<!-- start: MAIN -->
	<section id="main">

		<!-- start: MAIN TOP -->
		<div class="main__top">
			<div class="main__top__title">
				<h3>Dashboard</h3>
				<ul class="breadcrumbs">
					<li><a href="#">Home</a></li>
					<li class="divider">/</li>
					<li><a href="#" class="active">Dashboard</a></li>
				</ul>
			</div>
			<ul class="main__top__menu">
				<li class="search"><a href="#"> <i
						class="ph-magnifying-glass"></i>
				</a>
					<div class="main__dropdown">
						<form action="#">
							<input type="text" name="" placeholder="Search">
						</form>
						<span>Recent Search</span>
						<ul class="recent-search">
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
							<li><a href="#">
									<h5>Keyword</h5>
									<p>Lorem ipsum dolor sit amet consectetur...</p>
							</a></li>
						</ul>
					</div></li>
				<li class="notification"><a href="#"> <i class="ph-bell"></i>
				</a>
					<div class="main__dropdown">
						<div class="notification__top">
							<h4>Notifications</h4>
							<span>6</span>
						</div>
						<ul class="notification__item">
							<li><a href="#">
									<div class="left">
										<h5>Notification title</h5>
										<p>Lorem ipsum dolor sit amet...</p>
									</div> <span>3 hours</span>
							</a></li>
							<li><a href="#">
									<div class="left">
										<h5>Notification title</h5>
										<p>Lorem ipsum dolor sit amet...</p>
									</div> <span>3 hours</span>
							</a></li>
							<li><a href="#">
									<div class="left">
										<h5>Notification title</h5>
										<p>Lorem ipsum dolor sit amet...</p>
									</div> <span>3 hours</span>
							</a></li>
							<li><a href="#">
									<div class="left">
										<h5>Notification title</h5>
										<p>Lorem ipsum dolor sit amet...</p>
									</div> <span>3 hours</span>
							</a></li>
							<li><a href="#">
									<div class="left">
										<h5>Notification title</h5>
										<p>Lorem ipsum dolor sit amet...</p>
									</div> <span>3 hours</span>
							</a></li>
						</ul>
					</div></li>
				<li class="inbox"><a href="#"> <i
						class="ph-chat-circle-dots"></i>
				</a> <span></span></li>
				<li class="profile"><a href="#"> <img
						src="https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
						alt="">
				</a>
					<div class="main__dropdown">
						<div class="profile__top">
							<img
								src="https://images.unsplash.com/photo-1564564321837-a57b7070ac4f?ixlib=rb-1.2.1&ixid=MnwxMjA3fDB8MHxzZWFyY2h8Mnx8bWFufGVufDB8fDB8fA%3D%3D&auto=format&fit=crop&w=500&q=60"
								alt="">
							<div class="name">
								<h5>John Doe</h5>
								<p>Web Developer</p>
							</div>
						</div>
						<ul class="profile__menu">
							<li><a href="#"><i class="ph-user-circle-fill"></i> Edit
									profile</a></li>
							<li><a href="#"><i class="ph-gear-fill"></i> Settings</a></li>
						</ul>
					</div></li>
			</ul>
		</div>
		<!-- end: MAIN TOP -->

		<!-- start: MAIN BODY -->
		<div class="main__body">
			<ul class="main__body__box-info">
				<li><i class="ph-shopping-bag-fill"></i>
					<h5>$823</h5>
					<p>Sales</p></li>
				<li><i class="ph-wallet-fill"></i>
					<h5>$423</h5>
					<p>Wallet</p></li>
				<li><i class="ph-users-fill"></i>
					<h5>455</h5>
					<p>Members</p></li>
			</ul>
			<div class="main__body__data">
				<div class="col-div-12" style="width: 100%">
					<div class="box-12">
						<div class="content-box">
							<p>
								All User <span>Sell All</span>
							</p>
							<br />
							<table style="width: 100%" class="table">
								<tr>
									<th scope="col">UserName</th>
									<th scope="col">Email</th>
									<th scope="col">FullName</th>
									<th scope="col">IsAdmin</th>
									<th scope="col"></th>
								</tr>
								<tbody>
									<c:forEach var="v" items="${listuser}">
										<tr>
											<td>${v.id}</td>
											<td>${v.email}</td>
											<td>${v.fullname}</td>
											<td>${v.isAdmin ? 'admin' : 'người dùng'}</td>
											<td><a href="editUser?id=${v.id}"
												style="text-decoration: none; font-size: 14px; color: #00a97f"><button
														class="editbutton" name="">edit</button></a> <a
												href="deleteUser?id=${v.id}">
													<button class="deletebutton">Delete</button>
											</a></td>
										</tr>
									</c:forEach>
								</tbody>
							</table>
							`
						</div>
					</div>
				</div>

			</div>
		</div>
		<!-- end: MAIN BODY -->

	</section>
	<!-- end: MAIN -->

	<script src="https://cdn.jsdelivr.net/npm/apexcharts"></script>
	<script src="css/admin.js"></script>
	<script>
	const liItems = document.querySelectorAll('li');
	liItems.forEach(item => {
	  item.addEventListener('mouseover', function() {
	    const title = this.getAttribute('title');
	    if (title) {
	      const tooltip = document.createElement('div');
	      tooltip.textContent = title;
	      tooltip.classList.add('tooltip');
	      document.body.appendChild(tooltip);
	      const rect = this.getBoundingClientRect();
	      const tooltipRect = tooltip.getBoundingClientRect();
	      const top = rect.top - tooltipRect.height - 10;
	      const left = rect.left + (rect.width - tooltipRect.width) / 2;
	      tooltip.style.top = top + 'px';
	      tooltip.style.left = left + 'px';
	    }
	  });
	  item.addEventListener('mouseout', function() {
	    const tooltip = document.querySelector('.tooltip');
	    if (tooltip) {
	      document.body.removeChild(tooltip);
	    }
	  });
	});

	</script>
</body>

</html>