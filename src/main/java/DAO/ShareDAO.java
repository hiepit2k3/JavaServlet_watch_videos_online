package DAO;

import model.Share;

public interface ShareDAO {
	Share create(Share share);
	Share findByID(String id);
}
