package DAO.impl;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import DAO.FavoriteDAO;
import DAO.atracDAO;
import model.Favorite;
import utils.JpaUtils;

public class Favoriteimpl extends atracDAO<Favorite> implements FavoriteDAO {
	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	@Override
	public List<Favorite> findByUser(String username) {
		String sql = "SELECT f FROM Favorite f WHERE f.user.id = ?0 ORDER BY f.viewdate DESC";
		return super.findMany(Favorite.class, sql, username);
	}

	@Override
	public List<Favorite> findByUserAndLiked(String username) {
		String sql = "SELECT f FROM Favorite f Where f.user.id = ?  and f.isLikes = 1"
				+ " and f.video.active = 1 ORDER BY  f.dateView desc";
		return super.findMany(Favorite.class, sql, username);
	}

	@Override
	public Favorite update(Favorite entity) {
		// TODO Auto-generated method stub
		return super.updatea(entity);
	}

	@Override
	public Favorite findByUseridAndVideoid(String userid, String videoid) {
		String sql = "SELECT f FROM Favorite f WHERE f.user.id = ?0 AND f.video.id = ?1";
		return super.findOne(Favorite.class, sql, userid, videoid);
	}

	@Override
	public Favorite create(Favorite entity) {
		return super.create(entity);
	}

}
