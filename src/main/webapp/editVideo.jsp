<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">

<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<!-- ICON -->
<script src="https://unpkg.com/phosphor-icons"></script>
<!-- MY CSS -->
<link rel="stylesheet" href="css/admin.css">

<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
	
<style >
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

</style>
<title>Edit Video</title>
</head>

<body>

	<!-- start: SIDEBAR -->
	<section id="sidebar">
		<a href="#" class="brand"> <i class="ph-flame-fill"></i>
		</a>

		<ul class="sidebar__menu">
			<li title="Danh Sách Video"><a href="admin.jsp"><i class="ph-house-fill"></i></a>
			</li>

			<li title="Add Video"><a href="addVideo.jsp"><i class="ph-clipboard-fill"></i></a></li>
			<li title="Edit Video"><a href="editVideo.jsp"><i class="ph-file-fill"></i></a></li>
			<li title="Danh Sách User"><a href="listUser.jsp"><i class="ph-user-circle-fill"></i></a></li>
			<li class="divider"></li>
			<li><a href="#"><i class="ph-gear-fill"></i></a></li>
			<li title="Đăng Xuất"><a href="#" class="logout"><i class="ph-sign-out-fill"></i></a>
			</li>
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
			<div class="main__body__data" style="width: 100%">
				<form style="width: 100%" action="updateVideo" method="post">
					<div class="form-group">
						<label for="ma-video">Mã Video:</label> <input type="text"
							class="form-control" id="ma-video" name="id" value="${video.id}">
					</div>
					<div class="form-group">
						<label for="tieu-de">Tiêu Đề Video:</label> <input type="text"
							class="form-control" id="tieu-de" name="title" value="${video.title}">
					</div>
					<div class="form-group">
						<label for="mo-ta">Mô Tả Video:</label>
						<textarea class="form-control" id="mo-ta" name="descriptions" rows="3">${video.descriptions}</textarea>
					</div>
					<div class="form-group">
						<label for="anh-thu-nho">Link Ảnh Thu Nhỏ:</label> <input
							type="text" class="form-control" id="anh-thu-nho"
							name="poster" value="${video.poster}">
					</div>
					<div class="form-group">
						<label for="link-video">Link Video:</label> <input type="text"
							class="form-control" id="link-video" name="urlvideo" value="${video.urlvideo}">
					</div>
					<button type="submit" class="btn btn-primary" formaction="updateVideo">Cập Nhật</button>
				</form>

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