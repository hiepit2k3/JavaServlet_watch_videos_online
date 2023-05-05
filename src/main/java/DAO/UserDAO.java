package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.User;
import model.Video;
import utils.JpaUtils;

public class UserDAO {
	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	// tim kiem User
	public User findid(String id) {
		User user = em.find(User.class, id);
		return user;
	}
	
	public void insert(User user) {
		try {
			trans.begin(); // bắt đầu

			em.persist(user); // dùng để lưu

			trans.commit(); // kết thúc
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // quay lại
			throw e;
		} finally {
			em.close();
		}
	}
	
	public List<User> findAllUser() {
		EntityManager em = JpaUtils.getEntityManager();
		TypedQuery<User> query = em.createNamedQuery("User.findAll", User.class);
		return query.getResultList();
	}
	
	public void update(User user) {
		try {
			trans.begin(); // bắt đầu
			em.merge(user); // dùng để cập nhật
			trans.commit(); // kết thúc
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // quay lại
			throw e;
		} finally {
			em.close();
		}
	}
	
	// xóa nguoi dung.
	
	public void delete(String id) {
		try {
			trans.begin();
			User user = em.find(User.class, id);
			if (user != null) {
				em.remove(user);
			} else {
				System.out.println("Không có Video này");
			}
			trans.commit();
		} catch (Exception e) {
			// TODO: handle exception
		} finally {
			em.close();
		}
	}

}
