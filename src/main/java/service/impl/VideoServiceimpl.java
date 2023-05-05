package service.impl;

import java.util.List;

import DAO.VideoDAO;
import model.Video;
import service.VideoService;

public class VideoServiceimpl implements VideoService{

	VideoDAO dao;
	
	public VideoServiceimpl() {
		dao = new VideoDAO();
	}
	
	@Override
	public Video findByHref(String href) {
		// TODO Auto-generated method stub
		return dao.findByHref(href);
	}

	@Override
	public List<Video> finALL(int page, int pagesize) {
		// TODO Auto-generated method stub
		return dao.finALL(page, pagesize);
	}

}
