package service.impl;

import javax.servlet.ServletContext;

import model.User;
import service.EmailService;
import utils.SendEmail;

public class EmailSevletServiceimpl implements EmailService {

	private static final String EMAIL_WEBCOME = "Chào Mừng Bạn Đến Với Trang Web Của Chúng Tôi!";
	private static final String EMAIL_FORGETPASSWORD = "Lấy lại mật khẩu";
	private static final String EMAIL_SHAREVIDEO = "Chia sẻ video";
	@Override
	public void Email(ServletContext context, User recipient, String type) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		
		try {
			String content = null;
			String subject = null;
			switch (type) {
			case "welcome": {
				subject  = EMAIL_WEBCOME;
				content = "Xin Chào "+recipient.getFullname() + "bạn đã đăng đăng kí thành công tài khoản trên nền tảng của chúng tôi ";
				break;
			}
			case "forgetpassword": {
				subject = EMAIL_FORGETPASSWORD;
				content = "Xin chào "+ recipient.getId() + " mật khẩu mới của bạn là: "+recipient.getPassword();
				break;
			}
			
			
			default:
				subject = "Online Entertainment";
				content = "Maybe this email is wrong,don't care about it";
			}
			SendEmail.sendEmail(host, port, user, pass, recipient.getEmail(), subject, content);
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

	@Override
	public void Sharevideo(ServletContext context, String email, String link) {
		String host = context.getInitParameter("host");
		String port = context.getInitParameter("port");
		String user = context.getInitParameter("user");
		String pass = context.getInitParameter("pass");
		try {
			String subject = EMAIL_SHAREVIDEO;
			String content = "Xin chào,\r\n"
					+ "\r\n"
					+ "Chúng tôi xin gửi email này từ VideoHot để chia sẻ một video mới nhất với bạn. Đây là một video tuyệt vời về tất cả các chủ đề mà chúng tôi tin rằng bạn sẽ thích.\r\n"
					+ "\r\n"
					+ "Bạn có thể xem video bằng cách nhấp vào đường dẫn dưới đây:"+ link +" .Video sẽ đưa bạn đến một trang xem video trên trang web của chúng tôi, nơi bạn có thể xem và tương tác với nó. Nếu bạn muốn chia sẻ video này với bạn bè hoặc gia đình, bạn có thể sử dụng tính năng chia sẻ trên YouTube để gửi video đến họ.\r\n"
					+ "\r\n"
					+ "Chúng tôi hy vọng rằng bạn sẽ thích video này và nếu bạn có bất kỳ câu hỏi hoặc ý kiến ​​nào, xin vui lòng để lại cho chúng tôi biết. Chúng tôi luôn mong muốn được nghe ý kiến ​​của người dùng để cải thiện trải nghiệm của họ trên VideoHot.\r\n"
					+ "\r\n"
					+ "Cảm ơn bạn đã dành thời gian để đọc email này và chúc bạn có một ngày tuyệt vời!\r\n"
					+ "\r\n"
					+ "Trân trọng,\r\n"
					+ "VideoHot Team";
			
			SendEmail.sendEmail(host, port, user, pass, email, subject, content);
		} catch (Exception e) {
			// TODO: handle exception
		}
	}
}
