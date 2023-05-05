package Servlet;

import java.io.IOException;
import java.lang.reflect.InvocationTargetException;
import java.sql.Timestamp;
import java.util.ArrayList;
import java.util.Collections;
import java.util.List;
import java.util.Properties;

import javax.mail.Authenticator;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.apache.commons.beanutils.BeanUtils;
import org.hibernate.internal.build.AllowSysOut;

import DAO.ShareDAO;
import DAO.UserDAO;
import DAO.VideoDAO;
import DAO.impl.ShareDAOimpl;
import constant.sessionAthtt;
import model.Favorite;
import model.Share;
import model.User;
import model.Video;
import service.EmailService;
import service.FavoriteService;
import service.UserService;
import service.impl.EmailSevletServiceimpl;
import service.impl.FavoriteServiceimpl;
import service.impl.UserServiceimpl;

/**
 * Servlet implementation class QLVideo
 */
@WebServlet({ "/login", "/QLVideo", "/register", "/Admin", "/addVideo", "/editVideo", "/updateVideo", "/deleteVideo",
		"/listUser", "/editUser", "/deleteUser", "/updateUser", "/detail1", "/logout", "/user/edit-profile",
		"/user/update-profile", "/user/changepassword", "/history", "/share-video", "/forgetpassword",
		"/sharevideoemail" })
public class QLVideo extends HttpServlet {
	private static final long serialVersionUID = 1L;

	private static final int max_video_page = 8;

	private FavoriteService favoriteService = (FavoriteService) new FavoriteServiceimpl();

	private final EmailService emailsevice = new EmailSevletServiceimpl();

	private final UserService userservice = new UserServiceimpl();

	private final ShareDAO shareDAO = new ShareDAOimpl();

	private final VideoDAO VideoDAO = new VideoDAO();

	/**
	 * @see HttpServlet#HttpServlet()
	 */
	public QLVideo() {
		super();
		// TODO Auto-generated constructor stub
	}

	/**
	 * @see HttpServlet#doGet(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */

	protected void doGet(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		response.setContentType("text/html; charset=UTF-8");
		String uri = request.getRequestURI();
		String action = request.getParameter("action");
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		if (uri.contains("login")) {
			request.getRequestDispatcher("/login.jsp").forward(request, response);
		} else if (uri.contains("QLVideo")) {
			try {
				doIndex(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("Admin")) {
			if (currentUser != null && currentUser.getIsAdmin() == Boolean.TRUE) {
				request.getRequestDispatcher("/admin.jsp").forward(request, response);
			} else {
				request.getRequestDispatcher("/index1.jsp").forward(request, response);
			}
		} else if (uri.contains("edit-profile")) {
			request.getRequestDispatcher("/profile.jsp").forward(request, response);
		}

		else if (uri.contains("editVideo")) {
			try {
				EditVideo(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("listUser")) {
			try {
				AllUser(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("deleteVideo")) {
			try {
				DeleteVideo(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				e.getMessage();
			}
		} else if (uri.contains("editUser")) {
			try {
				EditUser(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("deleteUser")) {
			try {
				System.out.println("link: " + uri);
				DeleteUser(request, response);
			} catch (Exception e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
				e.getMessage();
			}
		} else if (uri.contains("detail")) {
			try {
				detailVideo(request, response);
				switch (action) {
				case "like":
					try {
						doLike(request, response);
					} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e1) {
						// TODO Auto-generated catch block
						e1.printStackTrace();
					}
					break;
				case "share" :
					doShareVideo(request, response);
					break;
				}
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("logout")) {
			try {
				Logout(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("changepassword")) {
			try {
				doChangePassword(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("history")) {
			try {
				doHistory(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		}
		try {
			AllUser(request, response);
//			AllVideo(request, response);
		} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
	}

	/**
	 * @see HttpServlet#doPost(HttpServletRequest request, HttpServletResponse
	 *      response)
	 */
	protected void doPost(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		response.setContentType("text/html; charset=UTF-8");
		request.setCharacterEncoding("utf-8");
		response.setCharacterEncoding("utf-8");
		String uri = request.getRequestURI();
		System.out.println("link: " + uri);
		if (uri.contains("login")) {
			System.out.println("Dia chi: " + uri);
			doLogin(request, response);
		} else if (uri.contains("register")) {
			try {
				System.out.println("link: " + uri);
				doRegister(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				e.printStackTrace();
			}
		} else if (uri.contains("addVideo")) {
			try {
				System.out.println("link: " + uri);
				InsertVideo(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				e.printStackTrace();
			}
		} else if (uri.contains("updateVideo")) {
			try {
				System.out.println("link: " + uri);
				UpdateVideo(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("updateUser")) {
			try {
				adminUpdateUser(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("update-profile")) {
			try {
				doUpdateuser(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("changepassword")) {
			try {
				doChangePassword(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} else if (uri.contains("forgetpassword")) {
			try {
				doForgetPassword(request, response);
			} catch (IllegalAccessException | InvocationTargetException | ServletException | IOException e) {
				// TODO Auto-generated catch block
				e.printStackTrace();
			}
		} 
	}

	protected void doLogin(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException {
		// TODO Auto-generated method stub
		String username = request.getParameter("username");
		String password = request.getParameter("password");
		System.out.println("Username: " + username);
		System.out.println("Password: " + password);
		UserDAO dao = new UserDAO();
		User user = dao.findid(username);
		HttpSession sessionUser = request.getSession();

		try {
			if (user != null && user.getIsAdmin() == true) {
				System.out.println("Password Data: " + user.getPassword());
				if (password.equals(user.getPassword())) {
					System.out.println("Password Data: " + user.getPassword());
					System.out.println("Admin hay khong: " + user.getIsAdmin());
					AllVideo(request, response);
					sessionUser.setAttribute(sessionAthtt.CURRENT_USER, user);
					System.out.println("Dang nhap thanh cong voi vai tro Admin");
					response.sendRedirect("Admin");
					
				} else {
					request.setAttribute("errorMessage", "Đăng nhập không thành công!Sai tài khoản hoặc mật khẩu");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}

			} else if (user != null && user.getIsAdmin() == false) {
				if (password.equals(user.getPassword())) {
					System.out.println("Dang nhap thanh cong voi vai tro la nguoi dung");
					request.getSession().setAttribute("loginsuccess", "Đăng nhập thành công!");
					sessionUser.setAttribute(sessionAthtt.CURRENT_USER, user);
					response.sendRedirect("QLVideo");
				} else {
					request.setAttribute("errorMessage", "Đăng nhập không thành công!Sai tài khoản hoặc mật khẩu");
					request.getRequestDispatcher("/login.jsp").forward(request, response);
				}
			} else {
				request.setAttribute("errorMessage", "Đăng nhập không thành công!Sai tài khoản hoặc mật khẩu");
				request.getRequestDispatcher("/login.jsp").forward(request, response);
			}
		} catch (Exception e) {
			// TODO: handle exception
			e.getMessage();
			e.getStackTrace();
		}
	}

	protected void doRegister(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		String username = request.getParameter("id");
		User user = new User();
		UserDAO dao = new UserDAO();
		if (dao.findid(username) != null) {
			response.sendRedirect("register");
			System.out.println("Tai khoan da ton tai");
		} else {
			String password = request.getParameter("password");
			String passwordconfirm = request.getParameter("passwordcomfirm");
			if (password.equals(passwordconfirm)) {
				BeanUtils.populate(user, request.getParameterMap());
				dao.insert(user);
				emailsevice.Email(getServletContext(), user, "welcome");
				System.out.println("Dang ki thanh cong");
				response.sendRedirect("login");
			} else {
				response.sendRedirect("register");
				System.out.println("Mat  khau khong trung khop");
			}
		}
	}

	protected void AllVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		VideoDAO videodao = new VideoDAO();
		List<Video> list = videodao.findAllVideo();
		HttpSession session = request.getSession();
		session.setAttribute("listvideo", list);
	}
	
	/* Thêm video mới */

	protected void InsertVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		String idvideo = request.getParameter("id");
		VideoDAO dao = new VideoDAO();
		if (dao.finbyId(idvideo) != null) {
			System.out.println("Ma Video da ton tai.vui long nhap lai");
			request.getRequestDispatcher("/addVideo.jsp").forward(request, response);
		} else {
			Video video = new Video();
			BeanUtils.populate(video, request.getParameterMap());
			dao.insertVideo(video);
			System.out.println("Them Video thanh cong");
			AllVideo(request, response);
			request.getRequestDispatcher("/addVideo.jsp").forward(request, response);
		}
	}

	/* Sửa thông tin video */
	
	protected void UpdateVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		Video video = new Video();
		BeanUtils.populate(video, request.getParameterMap());

		VideoDAO dao = new VideoDAO();
		dao.update(video);
		String message = "Cập Nhật Thanh Công.";
		request.setAttribute("successMessage", message);
		System.out.println("Cập nhật thành công");
		AllVideo(request, response);
		request.getRequestDispatcher("/admin.jsp").forward(request, response);
	}

	/* thông tin của video hiển thị lên form*/
	
	protected void EditVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		VideoDAO dao = new VideoDAO();
		Video video = dao.finbyId(id);

		HttpSession session = request.getSession();
		session.setAttribute("video", video);
		AllVideo(request, response);
		request.getRequestDispatcher("/editVideo.jsp").forward(request, response);
	}

	/* Xóa video */
	
	protected void DeleteVideo(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		VideoDAO dao = new VideoDAO();
		dao.delete(id);
		System.out.println("Xóa thành công");
		AllVideo(request, response);
		request.getRequestDispatcher("/admin.jsp").forward(request, response);
	}

//	 trang chi tiết khi người dùng xem video 
	protected void detailVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub

		String id = request.getParameter("id");
		System.out.println("Id: " + id);
		HttpSession session = request.getSession();
		VideoDAO dao = new VideoDAO();
		Video video = dao.finbyId(id);
		List<Video> countVideo = dao.findAllVideo();
		Collections.shuffle(countVideo);

		/*
		 * xảo trộn video
		 */
		List<Video> ramdomVdeoList = countVideo.subList(0, 8);
		System.out.println("Video Ramdom: " + ramdomVdeoList);
		request.setAttribute("ramdomVdeoList", ramdomVdeoList);
		System.out.println("Video: " + video);
		request.setAttribute("detailvideo", video);
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		System.out.println("User: " + currentUser.getId());
		if (currentUser != null) {
			Favorite favorite = favoriteService.create(currentUser, video);
			request.setAttribute("flaglikeVideo", favorite.getLikes());
		}
		doView(request, response);
		request.getRequestDispatcher("/detail1.jsp").forward(request, response);
	}

	/* Hàm hiển thị toàn bộ người dùng */
	
	protected void AllUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		UserDAO dao = new UserDAO();
		List<User> user = dao.findAllUser();
		HttpSession session = request.getSession();
		session.setAttribute("listuser", user);
	}
	
	/* hàm hiển thị thông tin lên form chỉnh sửa thông tin */

	protected void EditUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		UserDAO dao = new UserDAO();
		User user = dao.findid(id);
		HttpSession session = request.getSession();
		session.setAttribute("user", user);
		AllVideo(request, response);
		request.getRequestDispatcher("/editUser.jsp").forward(request, response);
	}

	/* Xóa người dùng vói vai trò admin */
	
	protected void DeleteUser(HttpServletRequest request, HttpServletResponse response) throws Exception {
		// TODO Auto-generated method stub
		String id = request.getParameter("id");
		UserDAO dao = new UserDAO();
		dao.delete(id);
		System.out.println("Xóa thành công");
		AllUser(request, response);
		request.getRequestDispatcher("/listUser.jsp").forward(request, response);
	}

	/* chỉnh sửa thông tin của người dùng với vai trò admin */
	
	protected void adminUpdateUser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		User user = new User();
		BeanUtils.populate(user, request.getParameterMap());

		UserDAO dao = new UserDAO();
		dao.update(user);
		String message = "Cập Nhật Thanh Công.";
		request.setAttribute("successMessage", message);
		System.out.println("Cập nhật thành công");
		AllUser(request, response);
		request.getRequestDispatcher("/listUser.jsp").forward(request, response);

	}

	// đăng xuất
	protected void Logout(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		HttpSession session = request.getSession();
		session.removeAttribute(sessionAthtt.CURRENT_USER);
		System.out.println("Dang xuat thanh cong");
		response.sendRedirect("login");
	}
	
	/* Hàm like video */

	protected void doLike(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		String id = request.getParameter("id");
		System.out.println("IdVD: " + id);
		response.setContentType("application/json");
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		boolean result = favoriteService.updateLikeOrUnlike(currentUser, id);
		if (result == true) {
			System.out.println("Chạy hàm");
			response.setStatus(204);
		} else {
			System.out.println("Lỗi 400");
			response.setStatus(400);
		}
	}
	
	/* hàm thay đổi thông tin người dùng */

	protected void doUpdateuser(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		String fullname = request.getParameter("fullname");
		String email = request.getParameter("email");
		System.out.println("full name: " + fullname);
		System.out.println("email: " + email);
		UserDAO dao = new UserDAO();
		if (currentUser != null) {
			currentUser.setEmail(email);
			currentUser.setFullname(fullname);
			dao.update(currentUser);
		}
		request.getRequestDispatcher("/profile.jsp").forward(request, response);
	}

	/* Hàm đổi mật khẩu */
	
	protected void doChangePassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		// TODO Auto-generated method stub
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		System.out.println(currentUser.getPassword());
		String currentPassword = request.getParameter("password");
		String newpassword = request.getParameter("passwordnew");
		String comfirmpassword = request.getParameter("passwordcomfirm");
		System.out.println("Password: " + currentPassword);
		System.out.println("New Password: " + newpassword);
		System.out.println("Comfirm Password : " + comfirmpassword);
		UserDAO dao = new UserDAO();
		if (currentUser != null && currentUser.getPassword().equals(currentPassword)) {
			if (newpassword.equals(comfirmpassword)) {
				currentUser.setPassword(newpassword);
				dao.update(currentUser);
				System.out.println("Đổi mật khẩu thành công");
				request.getRequestDispatcher("/profile.jsp").forward(request, response);
			} else {
				System.out.println("Mật khẩu xác mới không trùng nhau");
			}
		} else {
			System.out.println("Mật khẩu cũ không đúng");
		}
	}

	/* Ham hiển thị lịch sử xem video của người dùng */
	
	protected void doHistory(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		HttpSession session = request.getSession();
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		System.out.println("id: " + currentUser.getId());
		List<Video> listvideo = new ArrayList<>();
		List<Favorite> history = favoriteService.findByUser(currentUser.getId());
		history.forEach(item -> listvideo.add(item.getVideo()));
		request.setAttribute("listhistory", listvideo);
		request.getRequestDispatcher("/history1.jsp").forward(request, response);
	}

	/* hàm share video */
	
	protected void doShareVideo(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		HttpSession session = request.getSession();
		System.out.println("Share video");
		User currentUser = (User) session.getAttribute(sessionAthtt.CURRENT_USER);
		response.setContentType("application/json");
		System.out.println("id: " + currentUser.getId());
		String idvideo = request.getParameter("id");
		String email = request.getParameter("email");
		System.out.println("Email: "+email);
		VideoDAO videodao = new VideoDAO();
		Video video = videodao.finbyId(idvideo);
		Share share = new Share();
		if (currentUser != null && idvideo != null) {
			share.setUser(currentUser);
			share.setVideo(video);
			share.setEmails(email);
			share.setSharedate(new Timestamp(System.currentTimeMillis()));
			shareDAO.create(share);
			emailsevice.Sharevideo(getServletContext(), email, idvideo);
		}
		request.getRequestDispatcher("/detail1.jsp").forward(request, response);
	}

	/* Hàm Quên Mật Khât */
	
	protected void doForgetPassword(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		try {
			System.out.println("Gui email");
			response.setContentType("application/json");

			String email = request.getParameter("email");
			User usernewpassword = userservice.resetPassword(email);

			if (usernewpassword != null) {
				emailsevice.Email(getServletContext(), usernewpassword, "forgetpassword");
				response.sendRedirect("login");
				System.out.println("Gui email thanh cong");
			} else {
//			response.setStatus(400);
				System.out.println("Gui email that bai");
			}
		} catch (Exception e) {
			e.getStackTrace();
		}
	}

	/* hamf hiển thị các page */
	
	protected void doIndex(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		String page = request.getParameter("page");
		List<Video> countVideo = VideoDAO.findAllVideo();
		int maxPage = (int) Math.ceil(countVideo.size() / (double) max_video_page);
		request.setAttribute("MaxPage", maxPage);
		List<Video> video;
		try {
			if (page == null) {
				video = VideoDAO.finALL(1, max_video_page);
			} else {
				video = VideoDAO.finALL(Integer.parseInt(page), max_video_page);
				request.setAttribute("numberpage", Integer.valueOf(page));
			}

			request.setAttribute("videos", video);
			System.out.println("dữ liệu: " + video);
			request.getRequestDispatcher("/index1.jsp").forward(request, response);
			;
		} catch (Exception e) {
			e.getStackTrace();
		}
	}
	
	/* Hàm tăng views */
	
	protected void doView(HttpServletRequest request, HttpServletResponse response)
			throws ServletException, IOException, IllegalAccessException, InvocationTargetException {
		String idvideo = request.getParameter("id");
		Video video = VideoDAO.finbyId(idvideo);
		if(video != null) {
			video.setViews(video.getViews() + 1);
			VideoDAO.update(video);
		}
		
	}
}
