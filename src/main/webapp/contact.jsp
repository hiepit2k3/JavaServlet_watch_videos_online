<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Video Catalog</title>
<link rel="stylesheet" href="fontawesome/css/all.min.css">
<!-- https://fontawesome.com/ -->
<link
	href="https://fonts.googleapis.com/css2?family=Source+Sans+Pro&display=swap"
	rel="stylesheet">
<!-- https://fonts.google.com/ -->
<link rel="stylesheet" href="css/bootstrap.min.css">
<link rel="stylesheet" href="css/thu.css">
</head>


<body>
	<div class="tm-page-wrap mx-auto">
		<div class="position-relative">
			<div class="container-fluid">
				<nav class="navbar navbar-expand-lg navbar-light bg-light">
					<button class="navbar-toggler" type="button" data-toggle="collapse"
						data-target="#navbarSupportedContent"
						aria-controls="navbarSupportedContent" aria-expanded="false"
						aria-label="Toggle navigation">
						<span class="navbar-toggler-icon"></span>
					</button>

					<div class="collapse navbar-collapse" id="#navbarSupportedContent">
						<ul class="navbar-nav mr-auto">
							<li class="nav-item"><a class="nav-link" href="index.html">Home
									<span class="sr-only">(current)</span>
							</a></li>
							<li class="nav-item ml-3"><a class="nav-link"
								href="contact.html">Liên Hệ</a></li>

							<li class="nav-item ml-3"><a class="nav-link"
								href="layout/about.html">Hỗ Trợ</a></li>
						</ul>
						<form class="form-inline my-2 my-lg-0">
							<input class="form-control mr-sm-2" type="search"
								placeholder="Search" aria-label="Search">
							<button class="btn btn-outline-success my-2 my-sm-0"
								type="submit">Search</button>
						</form>

						<ul class="navbar-nav ml-auto">
							<li class="nav-item dropdown"><a
								class="nav-link dropdown-toggle" href="#"
								id="navbarDropdownMenuLink" role="button" data-toggle="dropdown"
								aria-haspopup="true" aria-expanded="false"> <img
									src="path/to/user/image.jpg" class="rounded-circle"
									alt="User Image" width="30" height="30">
							</a>
								<div class="dropdown-menu dropdown-menu-right"
									aria-labelledby="navbarDropdownMenuLink">
									<a class="dropdown-item" href="#">Profile</a> <a
										class="dropdown-item" href="#">Settings</a>
									<div class="dropdown-divider"></div>
									<a class="dropdown-item" href="#">Log Out</a>
								</div></li>
						</ul>
					</div>

				</nav>
			</div>
			<div class="tm-welcome-container tm-fixed-header tm-fixed-header-3">
			</div>

			<div id="tm-fixed-header-bg"></div>
			<!-- Header image -->
		</div>

		<!-- Page content -->
		<main>
			<div class="container-fluid px-0">
				<div class="mx-auto tm-content-container">
					<div class="row mt-3 mb-5 pb-3">
						<div class="col-12">
							<div class="mx-auto tm-about-text-container px-3">
								<h2 class="tm-page-title mb-4 tm-text-primary">Contact our
									team</h2>
								<p class="mb-4">
									Integer sit amet odio id libero tincidunt dignissim in eget
									arcu. Aliquam tristique ut magna sit amet tincidunt. Sed tempor
									tellus nulla, molestie luctus lectus tincidunt id. You are <u>not
										allowed</u> to re-distribute the template ZIP file on any template
									collection website.
								</p>
								<p class="mb-4">
									Video Catalog is a free website template for your business.
									This is 100% free Bootstrap v4.4.1 layout. You can modify and
									adapt this template for your CMS websites. You can use it for
									commercial or non-commercial work. If you wish to suport <a
										rel="nofollow" target="_parent" href="https://templatemo.com"
										class="tm-text-primary">TemplateMo</a>, please contact us.
								</p>
							</div>
						</div>
					</div>
					<div class="mx-auto pb-3 tm-about-text-container px-3">
						<div class="row">
							<div class="col-lg-6 mb-5">
								<form id="contact-form" action="" method="POST"
									class="tm-contact-form">
									<div class="form-group">
										<input type="text" name="name" class="form-control rounded-0"
											placeholder="Name" required="" />
									</div>
									<div class="form-group">
										<input type="email" name="email"
											class="form-control rounded-0" placeholder="Email"
											required="" />
									</div>
									<div class="form-group">
										<select class="form-control" id="contact-select"
											name="inquiry">
											<option value="-">Subject</option>
											<option value="sales">Sales &amp; Marketing</option>
											<option value="creative">Creative Design</option>
											<option value="uiux">UI / UX</option>
										</select>
									</div>
									<div class="form-group">
										<textarea rows="8" name="message"
											class="form-control rounded-0" placeholder="Message"
											required=""></textarea>
									</div>

									<div class="form-group mb-0">
										<button type="submit"
											class="btn btn-primary rounded-0 d-block ml-auto mr-0 tm-btn-animate tm-btn-submit tm-icon-submit">
											<span>Submit</span>
										</button>
									</div>
								</form>
							</div>
							<div class="col-lg-6">
								<div class="mapouter mb-60">
									<div class="gmap_canvas">
										<iframe width="100%" height="520" id="gmap_canvas"
											src="https://maps.google.com/maps?q=Av.+L%C3%BAcio+Costa,+Rio+de+Janeiro+-+RJ,+Brazil&t=&z=13&ie=UTF8&iwloc=&output=embed"
											frameborder="0" scrolling="no" marginheight="0"
											marginwidth="0"></iframe>
									</div>
								</div>
							</div>
						</div>
					</div>
				</div>

				<div class="parallax-window parallax-window-2"
					data-parallax="scroll" data-image-src="img/contact-2.jpg"></div>

				<div class="mx-auto tm-content-container mt-4 px-3 mb-3">
					<div class="row">
						<div class="col-12">
							<h2 class="tm-page-title mb-5 tm-text-primary">Testimonials</h2>
						</div>
					</div>
					<div class="row">
						<div class="col-lg-6 mb-5 pt-3">
							<div class="media tm-testimonial">
								<img class="mr-4 rounded-circle img-fluid"
									src="img/testimonial-1.jpg" alt="Generic placeholder image">
								<p class="media-body pt-3 tm-testimonial-text">Vestibulum
									non lectus id lacus aliquet porttitor in non nulla. Aenean urna
									diam, finibys id lorem nec, feugiat convallis dolor. Integer
									aliquam, eros eget rutrum iaculis.</p>
							</div>
						</div>
						<div class="col-lg-6 mb-5 pt-3">
							<div class="media tm-testimonial">
								<img class="mr-4 rounded-circle img-fluid"
									src="img/testimonial-2.jpg" alt="Generic placeholder image">
								<p class="media-body pt-3 tm-testimonial-text">Maecenas et
									libero in eros laoreet finibus sed vitae diam. Etiam
									consetetur, nunc sed pretium elementum, diam erat fringilla
									tortor, placerat condimentum.</p>
							</div>
						</div>
						<div class="col-lg-6 mb-5 pt-3">
							<div class="media tm-testimonial">
								<img class="mr-4 rounded-circle img-fluid"
									src="img/testimonial-3.png" alt="Generic placeholder image">
								<p class="media-body pt-3 tm-testimonial-text">Aliquam
									tristique ut magna sit amet tincidunt. Sed tempor tellus nulla,
									molestie luctus lectus tincidunt id. Cras duismod leo a urna
									placerat, vel blandit turpis fermentum.</p>
							</div>
						</div>
						<div class="col-lg-6 mb-5 pt-3">
							<div class="media tm-testimonial">
								<img class="mr-4 rounded-circle img-fluid"
									src="img/testimonial-4.png" alt="Generic placeholder image">
								<p class="media-body pt-3 tm-testimonial-text">Nulla
									suscipit posuere lectus ut venenatis. Proin sed orci eget
									tellus euismod vulputate eu eu arcu. Etiam a bibendum lorem.
									Cura</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<div class="container-fluid tm-content-container mx-auto pt-4">
			<!-- Subscribe form and footer links -->
			<div class="row mt-5 pt-3">
				<div class="col-xl-6 col-lg-12 mb-4">
					<div class="tm-bg-gray p-5 h-100">
						<h3 class="tm-text-primary mb-3">Bạn có muốn nhận các bản cập
							nhật mới nhất của chúng tôi không?</h3>
						<p class="mb-5">Vui lòng đăng ký bản tin của chúng tôi để biết
							các video mới sắp tới và thông tin mới nhất về công việc của
							chúng tôi. Cảm ơn bạn.</p>
						<form action="" method="GET" class="tm-subscribe-form">
							<input type="text" name="email" placeholder="Your Email..."
								required>
							<button type="submit"
								class="btn rounded-0 btn-primary tm-btn-small">Subscribe</button>
						</form>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
					<div class="p-5 tm-bg-gray">
						<h3 class="tm-text-primary mb-4">Liên Kết Nhanh</h3>
						<ul class="list-unstyled tm-footer-links">
							<li><a href="#">Viđeo Thịnh Hành</a></li>
							<li><a href="#">Top 1 trending</a></li>
							<li><a href="#">Sự Kiện</a></li>
							<li><a href="#">Trẻ Em</a></li>
							<li><a href="#">Thư Viện</a></li>
						</ul>
					</div>
				</div>
				<div class="col-xl-3 col-lg-6 col-md-6 col-sm-6 col-12 mb-4">
					<div class="p-5 tm-bg-gray h-100">
						<h3 class="tm-text-primary mb-4">Our Pages</h3>
						<ul class="list-unstyled tm-footer-links">
							<li><a href="#">All Video</a></li>
							<li><a href="#">Nhạc</a></li>
							<li><a href="#">Hỗ Trợ</a></li>
							<li><a href="#">Liên Hệ</a></li>

						</ul>
					</div>
				</div>
			</div>
			<!-- row -->

			<footer class="row pt-5">
				<div class="col-12">
					<a href="https://templatemo.com" rel="nofollow" target="_parent">Hiep</a>
					</p>
				</div>
			</footer>
		</div>
	</div>

	<script src="js/jquery-3.4.1.min.js"></script>
	<script src="js/bootstrap.min.js"></script>
	<script src="js/parallax.min.js"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"
		integrity="sha384-9/reFTGAW83EW2RDu2S0VKaIzap3H66lZH81PoYlFhbGU+6BZp6G7niu735Sk7lN"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.min.js"
		integrity="sha384-+sLIOodYLS7CIrQpBjl+C7nPvqq+FbNUBDunl/OZv93DB7Ln/533i8e/mZXLi/P+"
		crossorigin="anonymous"></script>
</body>
</html>