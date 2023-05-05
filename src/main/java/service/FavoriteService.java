package service;

import java.util.List;

import model.Favorite;
import model.User;
import model.Video;

public interface FavoriteService {
	List<Favorite> findByUser(String username);
	List<Favorite> findByUserAndLiked(String username);
	Favorite findByUseridAndVideoid(String userid,String videoid);
	Favorite create(User userid,Video videoid);
	Boolean updateLikeOrUnlike(User userID ,String VideoId);
}
	