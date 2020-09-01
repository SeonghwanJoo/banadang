package kr.spring.club.service;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import kr.spring.club.dao.ClubMapper;
import kr.spring.club.domain.ClubVO;

@Service("clubService")
public class ClubServiceImpl implements ClubService {
	
	@Resource
	private ClubMapper clubMapper;
	
	@Override
	public List<ClubVO> selectMyClubs(String id) {
		
		return clubMapper.selectMyClubs(id);
	}

	@Override
	public List<ClubVO> selectAllClubs() {
		
		return clubMapper.selectAllClubs();
	}

	@Override
	public List<String> selectMyClubs_num(String id) {
		
		return clubMapper.selectMyClubs_num(id);
	}

}
