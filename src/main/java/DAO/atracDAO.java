package DAO;

import java.util.List;

import javax.management.RuntimeErrorException;
import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.Favorite;
import model.User;
import utils.JpaUtils;

public class atracDAO<t> {
	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	public List<t> findMany(Class<t> fa, String sql, Object... params) {

		TypedQuery<t> query = em.createQuery(sql, fa);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<t> resultList = query.getResultList();

		return resultList;

	}

	public t findOne(Class<t> fa, String sql, Object... params) {

		TypedQuery<t> query = em.createQuery(sql, fa);
		for (int i = 0; i < params.length; i++) {
			query.setParameter(i, params[i]);
		}
		List<t> result = query.getResultList();
		if (result.isEmpty()) {
			return null;
		}
		return result.get(0);
	}

	public t create(t entity) {
		try {
			trans.begin(); // bắt đầu

			em.persist(entity); // dùng để lưu

			trans.commit(); // kết thúc
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // quay lại
			throw e;
		}

	}

	public t updatea(t entity) {
		try {
			trans.begin(); // bắt đầu
			em.merge(entity); // dùng để cập nhật
			System.out.println("Đã Cập Nhật");
			trans.commit(); // kết thúc
			return entity;
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // quay lại
			throw e;
		} 

	}
	
	public List<t> FinAll(Class<t> clazz,boolean exitIsActive , int page ,int pageSize){
		String entityName = clazz.getSimpleName();
		StringBuilder sql = new StringBuilder();
		sql.append("SELECT o from ").append(entityName).append(" o");
		TypedQuery<t> query = em.createQuery(sql.toString(),clazz);
		query.setFirstResult((page - 1) * pageSize);
		query.setMaxResults(pageSize);
		return query.getResultList();
	}
	
	public t count(t entity) {
		TypedQuery<t> query = (TypedQuery<t>) em.createQuery("SELECT COUNT(v) FROM Video v");
		return (t) query;
	}
}
