package service.impl;

import java.sql.Timestamp;
import java.util.List;

import DAO.FavoriteDAO;
import DAO.VideoDAO;
import DAO.impl.Favoriteimpl;
import model.Favorite;
import model.User;
import model.Video;
import service.FavoriteService;

public class FavoriteServiceimpl implements FavoriteService{

	private FavoriteDAO dao;
	
	public FavoriteServiceimpl() {
		dao = new Favoriteimpl();
		
	}
	
	@Override
	public List<Favorite> findByUser(String username) {
		// TODO Auto-generated method stub
		return dao.findByUser(username);
	}

	@Override
	public List<Favorite> findByUserAndLiked(String username) {
		// TODO Auto-generated method stub
		return dao.findByUserAndLiked(username);
	}

	@Override
	public Favorite findByUseridAndVideoid(String userid, String videoid) {
		// TODO Auto-generated method stub
		return dao.findByUseridAndVideoid(userid, videoid);
	}

	@Override
	public Favorite create(User userid, Video videoid) {
		Favorite existFavorite  = findByUseridAndVideoid(userid.getId(),videoid.getId());
		if(existFavorite == null) {
			existFavorite = new Favorite();
			existFavorite.setUser(userid);
			existFavorite.setVideo(videoid);
			existFavorite.setViewdate(new Timestamp(System.currentTimeMillis()));
			existFavorite.setLikes(Boolean.FALSE);
			dao.create(existFavorite);
			return existFavorite;
		}
		return existFavorite;
	}

	@Override
	public Boolean updateLikeOrUnlike(User userID, String VideoId) {
		VideoDAO Videodao = new VideoDAO();
		Video video = Videodao.finbyId(VideoId);
		Favorite existFavorite = findByUseridAndVideoid(userID.getId(), video.getId());
		System.out.println("nguoi dung: " +existFavorite.getLikes());
		if(existFavorite.getLikes() == Boolean.FALSE) {
			existFavorite.setLikes(Boolean.TRUE);
			existFavorite.setLikeDate(new  Timestamp(System.currentTimeMillis()));
			System.out.println("Like");
		} else {
			existFavorite.setLikes(Boolean.FALSE);
			existFavorite.setLikeDate(null);
			System.out.println("NotLike");
		}
		Favorite updateFavorite = dao.update(existFavorite);
		return updateFavorite != null ? true : false; 
	}

}
