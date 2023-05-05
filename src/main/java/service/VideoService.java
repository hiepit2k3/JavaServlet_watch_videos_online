package service;

import java.util.List;

import model.Video;

public interface VideoService {
	Video findByHref(String href);
	List<Video> finALL(int page,int pagesize);
}
