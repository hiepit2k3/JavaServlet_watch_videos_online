package service;

import javax.servlet.ServletContext;

import model.User;

public interface EmailService {

	void Email(ServletContext context,User recipient,String type);
	
	void Sharevideo(ServletContext context,String email,String link);
}
