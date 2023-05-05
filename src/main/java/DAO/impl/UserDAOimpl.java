package DAO.impl;

import DAO.UserinterfacDAO;
import DAO.atracDAO;
import model.User;

public class UserDAOimpl extends atracDAO<User> implements UserinterfacDAO {

	@Override
	public User finByEmail(String email) {
		String sql = "Select  u from User u where u.email = ?0";
		return super.findOne(User.class, sql, email);
	}

	@Override
	public User update(User user) {
		// TODO Auto-generated method stub
		return super.updatea(user);
	}

}
