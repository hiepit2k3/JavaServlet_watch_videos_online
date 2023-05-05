<%@ page language="java" contentType="text/html; charset=utf-8"
	pageEncoding="utf-8"%>
<%@taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<!DOCTYPE html>
<html>
<head>
<meta charset='utf-8'>
<meta http-equiv='X-UA-Compatible' content='IE=edge'>
<link rel="icon" type="image/png" sizes="16x16" href="https://www.youtube.com/s/desktop/2fc4f2e2/img/favicon_32x32.png">
<title>InDex</title>
<meta name='viewport' content='width=device-width, initial-scale=1'>
<link rel='stylesheet' media='screen' href='css/layoutindex.css'>
<!-- css  -->
<link rel="stylesheet"
	href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/css/bootstrap.min.css"
	integrity="sha384-xOolHFLEh07PJGoPkLv1IbcEPTNtaed2xpHsD9ESMhqIYd0nLMwNLD69Npy4HI+N"
	crossorigin="anonymous">
<!-- icon  -->
<link rel="stylesheet"
	href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/5.15.3/css/all.min.css"
	crossorigin="anonymous" referrerpolicy="no-referrer" />

</head>

<body style="background-color: #1f1e1e">

	<!-- form thông báo đăng nhập -->


	<div class="container-fluid" style="background-color: #1f1e1e">
		<nav class="navbar navbar-expand-lg" >
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
	<div class="featured-content shadow-top"
		style="background: linear-gradient(to bottom, rgba(230, 62, 62, 0), #151515), url('img/5.jpg');">
		<h3 class="featured-title">Phim Siêu Anh Hùng.</h3>
		<p class="featured-desc">Siêu anh hùng là một nhân vật hư cấu được
			tạo ra trong truyện tranh, phim ảnh, trò chơi điện tử và các tác phẩm
			giải trí khác. Họ thường được mô tả là những người có siêu năng lực,
			khả năng đặc biệt vượt trội hơn người bình thường và sử dụng sức mạnh
			của mình để bảo vệ thế giới khỏi các mối đe dọa. Siêu anh hùng đã trở
			thành một phần của văn hóa đại chúng và thu hút sự quan tâm của nhiều
			người trên khắp thế giới.</p>
		<button class="featured-button">Xem</button>
	</div>

	<!-- các thẻ lọc  -->

	<div class="button-group" style="padding-top: 10px">
		<ul>
			<li class="button active"><a href="#">Tất cả video</a></li>
			<li class="button"><a href="#">Âm nhạc</a></li>
			<li class="button"><a href="#">Video ngắn</a></li>
			<li class="button"><a href="#">Trẻ em</a></li>
		</ul>
	</div>



	<div class="container">
		<div class="row" style="padding-top: 50px;">
			<c:forEach var="u" items="${videos}">
				<div class="col-sm-3" style="padding-top: 50px;">
					<a href="detail1?action=watch&id=${u.id}" class="a">
						<div class="card">
							<img src="${u.poster}" class="card-img-top" alt="...">
							<div class="card-body">
								<p class="card-text">${u.title}</p>
							</div>
						</div>
					</a>
				</div>
			</c:forEach>
		</div>
	</div>

	<!-- Html phan trang -->

	<div style="display: flex; justify-content: center; margin-top: 20px;">
		<nav aria-label="Page navigation example">
			<ul class="pagination">
				<c:if test="${numberpage == 1}">
					<li class="page-item disabled"><a class="page-link" href="#"
						aria-label="Previous"> <span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:if test="${numberpage > 1}">
					<li class="page-item"><a class="page-link"
						href="QLVideo?page=${numberpage - 1 }" aria-label="Previous">
							<span aria-hidden="true">&laquo;</span>
					</a></li>
				</c:if>
				<c:forEach varStatus="i" begin="1" end="${MaxPage}">
					<li class="page-item ${numberpage == i.index ? 'active' : ''}"><a
						class="page-link" href="QLVideo?page=${i.index}">${i.index}</a></li>
				</c:forEach>

				<c:if test="${numberpage == MaxPage}">
					<li class="page-item disabled"><a class="page-link" href=""
						aria-label="Next"> <span aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
				<c:if test="${numberpage < MaxPage}">
					<li class="page-item"><a class="page-link"
						href="QLVideo?page=${numberpage + 1 }" aria-label="Next"> <span
							aria-hidden="true">&raquo;</span>
					</a></li>
				</c:if>
			</ul>
		</nav>
	</div>


	<script
		src="https://cdn.jsdelivr.net/npm/jquery@3.5.1/dist/jquery.slim.min.js"
		integrity="sha384-DfXdz2htPH0lsSSs5nCTpuj/zy4C+OGpamoFVy38MVBnE+IbbVYUew+OrCXaRkfj"
		crossorigin="anonymous"></script>
	<script
		src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.2/dist/js/bootstrap.bundle.min.js"
		integrity="sha384-Fy6S3B9q64WdZWQUiU+q4/2Lc9npb8tCaSX9FK7E8HnRr0Jz8D6OP9dO5Vg3Q9ct"
		crossorigin="anonymous"></script>

	<script>
        // Get the dropdown menu
        var dropdownMenu = document.getElementById("user-dropdown");

        // Function to show the dropdown menu
        function showDropdown() {
            dropdownMenu.classList.add("show");
        }

        // Function to hide the dropdown menu
        function hideDropdown() {
            dropdownMenu.classList.remove("show");
        }

        // Lấy tất cả các nút trong nhóm
        const buttons = document.querySelectorAll('.button');

        // Lặp qua từng nút và thêm sự kiện click
        buttons.forEach((button) => {
            button.addEventListener('click', () => {
                // Đặt lại màu nền của tất cả các nút về màu ban đầu
                buttons.forEach((button) => {
                    button.classList.remove('active');
                });

                // Đặt màu nền của nút được click thành màu mới
                button.classList.add('active');
            });
        });
    </script>
</body>

</html>