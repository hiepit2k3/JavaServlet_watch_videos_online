package DAO;

import model.User;

public interface UserinterfacDAO {
	User finByEmail(String email);
	User update(User user);
}
