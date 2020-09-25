package kr.spring.club.controller;

import java.io.IOException;
import java.util.Arrays;
import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.annotation.Resource;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.multipart.MultipartFile;

import kr.spring.club.domain.ClubVO;
import kr.spring.club.service.ClubService;

@Controller
public class ClubAjaxController {
	
	Logger logger = LoggerFactory.getLogger(this.getClass());
	
	@Resource
	private ClubService clubService;
	
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
			map.put("result", "inserted");
			map.put("club_num", club.getClub_num().toString());
			logger.info("club_num after club created : "+ club.getClub_num());
			session.setAttribute("myClub",club);
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "errors");
		}
		logger.info("map result : "+map.get("result"));
		return map;
	}
	@RequestMapping("/club/setMyClub.do")
	@ResponseBody
	public Map<String,String> setMyClub(@RequestParam Integer club_num,HttpSession session){
		Map<String,String> map=new HashMap<String,String>();
		ClubVO myClub=clubService.selectClubDetailWithClub_num(club_num);
		try {
			session.setAttribute("myClub", myClub);
			map.put("result","set");
		}catch(Exception e) {
			e.printStackTrace();
			map.put("result", "error");
		}
		
		
		return map;
	}
	@RequestMapping("/club/answerForMatch.do")
	@ResponseBody
	public Map<String,String> rejectMatch(@RequestParam Integer request_num,
										  @RequestParam Integer acceptance,
										  @RequestParam Integer match_num,
										  @RequestParam Integer club_num){
		Map<String,String> map=new HashMap<String,String>();
		ClubVO club=new ClubVO();
		club.setRequest_num(request_num);
		club.setAcceptance(acceptance);
		club.setMatch_num(match_num);
		club.setClub_num(club_num);
		try {
			clubService.updateAcceptance(club);
			if(acceptance==2) {
				//match_request에 해당 매치의 다른팀은 거절(3)처리 한다
				clubService.rejectOthers(club);
				//match의 해당 매치의 away팀을 해당팀으로  처리한다
				clubService.updateAwayforMatch(club);
			}
			map.put("result", "updated");
		}catch(Exception e) {
			map.put("result", "error");
			e.printStackTrace();
		}
		
		return map;
	}
}
