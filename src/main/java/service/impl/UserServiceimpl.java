package service.impl;

import DAO.UserinterfacDAO;
import DAO.atracDAO;
import DAO.impl.UserDAOimpl;
import model.User;
import service.UserService;

public class UserServiceimpl extends atracDAO<User> implements UserService {

	private UserinterfacDAO dao;

	public UserServiceimpl() {
		dao = new UserDAOimpl();
	}

	@Override
	public User findbyEmail(String email) {
		return dao.finByEmail(email);
	}

	@Override
	public User update(User user) {
		return dao.update(user);
	}

	@Override
	public User resetPassword(String email) {
		User user = findbyEmail(email);
		if(user != null) {
			String newpassword = String.valueOf((int)(Math.random()* ((9999 - 1000) + 1)) + 1000);
			user.setPassword(newpassword);
			dao.update(user);
		}
		return user;
	}

}
