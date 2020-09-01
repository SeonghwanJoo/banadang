package kr.spring.club.service;

import java.util.List;

import kr.spring.club.domain.ClubVO;

public interface ClubService {
	public List<ClubVO> selectMyClubs(String id);
	public List<ClubVO> selectAllClubs();
	public List<String> selectMyClubs_num(String id);
}
