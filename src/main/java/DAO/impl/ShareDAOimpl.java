package DAO.impl;

import DAO.ShareDAO;
import DAO.atracDAO;
import model.Share;

public class ShareDAOimpl extends atracDAO<Share> implements ShareDAO{
	@Override
	public Share create(Share share) {
		return super.create(share);
	}

	@Override
	public Share findByID(String id) {
		String sql = "SELECT f FROM Favorite f WHERE f.user.id = ?0";
		return super.findOne(Share.class, sql, id);
	}
}
