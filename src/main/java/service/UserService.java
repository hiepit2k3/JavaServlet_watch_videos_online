package service;

import model.User;

public interface UserService {
	User findbyEmail(String email);
	User update(User user);
	User resetPassword(String email);
	
}
