package DAO;

import java.util.List;

import javax.persistence.EntityManager;
import javax.persistence.EntityTransaction;
import javax.persistence.TypedQuery;

import model.User;
import model.Video;
import utils.JpaUtils;

public class VideoDAO extends atracDAO<Video>{
	EntityManager em = JpaUtils.getEntityManager();
	EntityTransaction trans = em.getTransaction();

	public List<Video> findAllVideo() {
		TypedQuery<Video> query = em.createNamedQuery("Video.findAll", Video.class);
		return query.getResultList();
	}

	public void insertVideo(Video video) {
		try {
			trans.begin(); // bắt đầu

			em.persist(video); // dùng để lưu

			trans.commit(); // kết thúc
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // quay lại
			throw e;
		} finally {
			em.close();
		}
	}

	// tim theo id

	public Video finbyId(String id) {
		Video video = em.find(Video.class, id);
		return video;
	}

	// Cập nhật thong tin video

	public void update(Video video) {
		try {
			trans.begin(); // bắt đầu
			em.merge(video); // dùng để cập nhật
			trans.commit(); // kết thúc
		} catch (Exception e) {
			e.printStackTrace();
			trans.rollback(); // quay lại
			throw e;
		} 
	}

	public void delete(String id) {
		try {
			trans.begin();
			Video video = em.find(Video.class, id);
			if (video != null) {
				em.remove(video);
			} else {
				System.out.println("Không có Video này");
			}
			trans.commit();
		} catch (Exception e) {
			// TODO: handle exception
		} 
	}
	
	public Video findByHref(String href) {
		String sql = "SELECT v from Video v where v.urlvideo = ?0";
		return super.findOne(Video.class, sql, href);
	}
	
	public List<Video> finALL(int page,int pagesize){
		return super.FinAll(Video.class, true, page, pagesize);
	}

	public Video Count(Video video) {
		return super.count(video);
	}
}
