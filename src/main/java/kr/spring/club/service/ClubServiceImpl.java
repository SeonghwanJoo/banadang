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
	public List<Integer> selectMyClubs_num(String id) {
		
		return clubMapper.selectMyClubs_num(id);
	}

	@Override
	public void insertClub(ClubVO club) {
		
		clubMapper.insertClub(club);
		clubMapper.joinClubWhenCreated(club);
		
	}

	@Override
	public ClubVO selectClubDetailWithClub_num(Integer club_num) {
		
		return clubMapper.selectClubDetailWithClub_num(club_num);
	}

	@Override
	public List<ClubVO> selectAwayDetailsForRequestedMatch(Integer club_num) {
		return clubMapper.selectAwayDetailsForRequestedMatch(club_num);
	}

	@Override
	public List<ClubVO> selectHomeDetailsForRequestedMatch(Integer club_num) {
		return clubMapper.selectHomeDetailsForRequestedMatch(club_num);
	}

	@Override
	public void insertClubMember(ClubVO club) {
		
		clubMapper.insertClubMember(club);
	}

	@Override
	public Integer selectClubAuth(ClubVO club) {
		return clubMapper.selectClubAuth(club);
	}

}
