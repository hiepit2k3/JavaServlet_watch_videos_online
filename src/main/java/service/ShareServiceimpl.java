package service;

import DAO.ShareDAO;
import DAO.atracDAO;
import DAO.impl.ShareDAOimpl;
import model.Share;

public class ShareServiceimpl extends atracDAO<Share> implements ShareService{

	ShareDAO dao = new ShareDAOimpl();
	
	@Override
	public Share create(String iduser, String videoid) {
		// TODO Auto-generated method stub
		return dao.create(null);
	}

}
