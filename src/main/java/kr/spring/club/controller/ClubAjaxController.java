package kr.spring.club.controller;

import java.io.IOException;
import java.util.ArrayList;
import java.util.HashMap;
import java.util.HashSet;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;


import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;
import kr.spring.match.domain.MatchVO;
import kr.spring.match.service.MatchService;
import kr.spring.member.domain.MemberVO;
import kr.spring.member.service.LoginAPI;

@Controller
public class ClubAjaxController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ClubService clubService;
	
	@Resource
	private MatchService matchService;
	
	@Resource
	private LoginAPI loginAPI;
	
	@RequestMapping("/club/createClub.do")
	@ResponseBody
	public Map<String,String> process(@RequestParam String id,
									  @RequestParam String club_loc,
									  @RequestParam String club_name,
									  @RequestParam String club_detail,
									  @RequestParam MultipartFile upload,
									  @RequestParam String filename,
									  @RequestParam String club_color,
									  @RequestParam String[] club_ages,
									  @RequestParam String club_address,
									  @RequestParam double club_locX,
									  @RequestParam double club_locY,
									  HttpSession session) throws IOException{
		Map<String,String> map=new HashMap<String,String>();
		ClubVO club=new ClubVO();
		//club_address full address에서 시 구까지만 잘라서 DB에 저장
		String address_arr[]=club_address.split(" ");
		String club_addressCut=address_arr[0]+" ";
		club_addressCut+=address_arr[1];
		club.setId(id);
		club.setClub_loc(club_loc);
		club.setClub_name(club_name);
		club.setClub_detail(club_detail);
		club.setFilename(filename);
		club.setUpload(upload);
		club.setClub_color(club_color);
		club.setClub_ages(club_ages);
		club.setClub_address(club_addressCut);
		club.setClub_locX(club_locX);
		club.setClub_locY(club_locY);
		try {
			clubService.insertClub(club);
			List<ClubVO> myClubs = new ArrayList<ClubVO> ();
			List<ClubVO> clubs=(List)session.getAttribute("myClubs");
			if(clubs!=null) {
				myClubs.addAll(clubs);
			}
			myClubs.add(club);
			session.setAttribute("myClubs", myClubs);
			map.put("result", "inserted");
			map.put("club_num", club.getClub_num().toString());
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		return map;
	}
	@RequestMapping("/club/setMyClub.do")
	@ResponseBody
	public Map<String,String> setMyClub(@RequestParam Integer club_num,
										@RequestParam String user_id,
										HttpSession session,
										HttpServletResponse response,
										HttpServletRequest request){
		Map<String,String> map=new HashMap<String,String>();
		ClubVO club=new ClubVO();
		club.setId(user_id);
		club.setClub_num(club_num);
		if(user_id.length()<11) {
			clubService.setLoginCookie(club_num, response, request, true);
		}else {
			clubService.setLoginCookie(club_num, response, request, false);
		}
		ClubVO myClub=clubService.selectMyClubDetails(club);
		try {
			session.setAttribute("myClub", myClub);
			map.put("result","set");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "error");
		}
		
		
		return map;
	}
	@RequestMapping("/club/nextClubs.do")
	@ResponseBody
	public Map<String, Object> nextClubs(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		try {
			List<MatchVO> clubs=clubService.selectClubListWithFilter(match);
			map.put("result", "success");
			map.put("clubs", clubs);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
		
	}
	@RequestMapping("/club/updateLike.do")
	@ResponseBody
	public Map<String, Object> updateLike(MatchVO match){
		
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			logger.info("id_like in updateLike start : "+match.getId_like());
			if(match.getId_like()==null) {
				
				logger.info("id_like in null : "+match.getId_like());
				clubService.insertClubLike(match);
				logger.info("id_like after insert : "+match.getId_like());
				map.put("id_like", match.getId_like());
			}else {
				//update
				if(match.getStatus()==0) {
					
					clubService.deleteClubLike(match);
					map.put("id_like", null);
				}else {
					logger.info("likeUpdate진입");
					clubService.updateClubLike(match);
					map.put("id_like", match.getId_like());
					
				}
			}
			
			
			map.put("result", "success");
			
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		
		return map;
		
	}
	
	
	@RequestMapping("/club/cancelMatchReq.do")
	@ResponseBody
	public Map<String,Object> cancelMatchReq(@RequestParam Integer request_num,
											 @RequestParam Integer acceptance,
											 @RequestParam Integer match_num,
											 @RequestParam Integer club_num,
											 @RequestParam String club_name){
		
		Map<String,Object> map=new HashMap<String,Object>();
		
		try {
			if(acceptance==1 || acceptance==3) {
				clubService.deleteMatchReqForCancel(request_num);
			}else if (acceptance==2) {
				clubService.updateMatchReqForCancel(request_num,match_num);
				HashSet<String> uid_list=clubService.selectClubExecutivesByClubNum(club_num);
				if(!uid_list.isEmpty()) {
					loginAPI.sendMessage(uid_list, club_name+"팀이 경기 신청을 취소하였습니다. 팀 관리에서 확인해보세요!");
				}
			}
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
	}
	
	@RequestMapping("/club/answerForMatch.do")
	@ResponseBody
	public Map<String,String> rejectMatch(ClubVO club,
										  @RequestParam Integer home,
										  @RequestParam String home_name){
		Map<String,String> map=new HashMap<String,String>();
		try {
			clubService.updateAcceptance(club);
			if(club.getAcceptance()==2) {
				//match_request에 해당 매치의 다른팀은 거절(3)처리 한다
				clubService.rejectOthers(club);
				//match의 해당 매치의 away팀을 해당팀으로  처리한다
				clubService.updateAwayforMatch(club);
				MatchVO match=new MatchVO();
				match.setHome(home);
				match.setAway(club.getClub_num());
				HashSet<String> uid_list=matchService.selectMembersForPostedMatch(match);
				if(!uid_list.isEmpty()) {
					loginAPI.sendMessage(uid_list, "경기 매칭("+home_name+" Vs "+club.getClub_name()+")이 완료되었습니다. 참석 투표하러 가볼까요?");
				}
			}
			map.put("result", "updated");
		}catch(Exception e) {
			map.put("result", "error");
			e.printStackTrace();
		}
		
		return map;
	}
	@RequestMapping("/club/manageMember.do")
	@ResponseBody
	public Map<String,Object> manageMember(@RequestParam String id,
										   @RequestParam Integer auth,
										   @RequestParam Integer club_num,
										   Model model,
										   HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		MemberVO member=new MemberVO();
		String user_id=(String)session.getAttribute("user_id");
		member.setId(id);
		member.setClub_auth(auth);
		member.setClub_num(club_num);
		try{
			if(auth==0) {
				//clubjoin에서 해당 아이디 삭제
				clubService.deleteMemberFromClub(member);
				if(user_id.equals(id)) {session.removeAttribute("myClub");}
				map.put("result", "member_deleted");
			}else if(auth>3) {
				//clubjoin에서 권한 업데이트
				clubService.updateMemberAuth(member);
				map.put("result", "member_auth_updated");
			}
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		//클럽 회원 정보 Object에 추가
				//List<MemberVO> members=clubService.selectClubMembers(club_num);
				//해당 클럽의 전체 회원정보를 받아 memberVO list로 받는다
				//memberVO list가 루프를 돌면서 attendatacerate를 set한다
				/*
				 * int ten=0,twent=0,thirt=0,fourt=0,fift=0,sixt=0,sevent=0,others=0;
				 * for(MemberVO mem:members) { if(mem.getAge_range().startsWith("1")){ ten++;
				 * }else if(mem.getAge_range().startsWith("2")) { twent++; }else
				 * if(mem.getAge_range().startsWith("3")) { thirt++; }else
				 * if(mem.getAge_range().startsWith("4")) { fourt++; }else
				 * if(mem.getAge_range().startsWith("5")) { fift++; }else
				 * if(mem.getAge_range().startsWith("6")) { sixt++; }else
				 * if(mem.getAge_range().startsWith("7")) { sevent++; }else{ others++; } }
				 * map.put("ten", ten); map.put("twent", twent); map.put("thirt", thirt);
				 * map.put("fourt", fourt); map.put("fift", fift); map.put("sixt", sixt);
				 * map.put("sevent", sevent); map.put("others", others);
				 */
				//auth정보를 각 line의 data attribute로 넣어서 받는다
				//map으로 관련 정보를 담아서 넘긴다
				//내 운영진 권한이 사라지면?reload가 불가피함
				//프론트에서 운영진 권한 제외하는 아이디와 나의 아이디가 같을 경우에는 reload처리
		return map;
	}
	@RequestMapping("/club/joinClub.do")
	@ResponseBody
	public Map<String,Object> joinClub(ClubVO club,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			
			Integer clubJoin_num=clubService.selectClubJoinForDuplicateByClubVO(club);
			if (clubJoin_num==null) {
				clubService.insertClubMember(club);
			}
			ClubVO myClub=clubService.selectMyClubDetails(club);
			List<ClubVO> myClubs = new ArrayList<ClubVO> ();
			myClubs.add(myClub);
			List<ClubVO> clubs=(List)session.getAttribute("myClubs");
			if(clubs!=null) {
				myClubs.addAll(clubs);
			}
			
			session.setAttribute("myClubs", myClubs);
			session.setAttribute("myClub", myClub);
			map.put("result", "success");
			
			
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		
		return map;
	}
	@RequestMapping("/club/checkNumOfMembers.do")
	@ResponseBody
	public Map<String,Object> checkNumOfMember(@RequestParam Integer club_num,@RequestParam boolean memberDeleted){
		Map<String,Object> map=new HashMap<String,Object>();
			map.put("memberDeleted",memberDeleted);
		try {
			Integer existingNumber=null;
			if(memberDeleted) {
				existingNumber=clubService.selectNumberOfMembers(club_num);
			}else if(!memberDeleted){
				existingNumber=clubService.selectNumberOfManagers(club_num);
			}
			map.put("existingNumber", existingNumber);
		}catch (Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		return map;
	}
	@RequestMapping("/club/deleteClub.do")
	@ResponseBody
	public Map<String,Object> deleteClub(@RequestParam Integer club_num,HttpSession session){
		Map<String,Object> map=new HashMap<String,Object>();
		String user_id=(String)session.getAttribute("user_id");
		try {
			clubService.deleteClubFromClub(club_num);
			List<ClubVO> myClubs=clubService.selectMyClubs(user_id);
            session.setAttribute("myClubs", myClubs);
            
            if(myClubs.size()>0) {
            	ClubVO club=new ClubVO();
                club.setId(user_id);
                club.setClub_num(myClubs.get(0).getClub_num());
            	session.setAttribute("myClub", clubService.selectMyClubDetails(club));
            }
			map.put("result", "success");
		}catch(Exception e){
			e.printStackTrace();
			map.put("result","errors");
		}
		return map;
	}
		
	@RequestMapping("/club/answerForRecruit.do")
	@ResponseBody
	public Map<String, Object> answerForRecruit(MemberVO member){
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			clubService.updateRecruitReq(member);
			map.put("result", "success");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		return map;
	}
	@RequestMapping("/club/answerForClubRecruit.do")
	@ResponseBody
	public Map<String,Object> answerForClubRecruit(MemberVO member){
		Map<String,Object> map=new HashMap<String,Object>();
		try {
			clubService.updateClubRecruitReq(member);
			map.put("result", "success");
			if(member.getClubRecruit_accept()==2) {
				//회원 여부 체크
				Integer clubJoin_num=clubService.selectClubJoinForDuplicate(member);
				if(clubJoin_num==null) {
					clubService.insertClubMemberWithMemberVO(member);
				}
			}
			
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		return map;
	}
	
	@RequestMapping("/club/updateClub.do")
	@ResponseBody
	public Map<String,Object> updateClub(
									  @RequestParam String id,
									  @RequestParam String club_loc,
									  @RequestParam String club_name,
									  @RequestParam String club_detail,
									  @RequestParam(required=false) MultipartFile upload,
									  @RequestParam(required=false) String filename,
									  @RequestParam String club_color,
									  @RequestParam String[] club_ages,
									  @RequestParam String club_address,
									  @RequestParam double club_locX,
									  @RequestParam double club_locY,
									  @RequestParam Integer club_num,
									  HttpSession session) throws IOException{
		Map<String,Object> map=new HashMap<String,Object>();
		ClubVO club=new ClubVO();
		//club_address full address에서 시 구까지만 잘라서 DB에 저장
		String address_arr[]=club_address.split(" ");
		String club_addressCut=address_arr[0]+" ";
		club_addressCut+=address_arr[1];
		club.setId(id);
		club.setClub_num(club_num);
		club.setClub_loc(club_loc);
		club.setClub_name(club_name);
		club.setClub_detail(club_detail);
		if(filename!=null) {
			club.setFilename(filename);
		}
		if(upload!=null) {
			club.setUpload(upload);
		}
		club.setClub_color(club_color);
		club.setClub_ages(club_ages);
		club.setClub_address(club_addressCut);
		club.setClub_locX(club_locX);
		club.setClub_locY(club_locY);
		try {
			clubService.updateClub(club);
			map.put("result", "updated");
			map.put("club_num", club.getClub_num());
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		return map;
										  
	}
}
