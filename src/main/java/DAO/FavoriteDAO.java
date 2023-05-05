package DAO;

import java.util.List;

import model.Favorite;

public interface FavoriteDAO  {
	List<Favorite> findByUser(String username);
	List<Favorite> findByUserAndLiked(String username);
	Favorite findByUseridAndVideoid(String userid,String videoid);
	Favorite create(Favorite entity);
	Favorite update(Favorite entity);
}
