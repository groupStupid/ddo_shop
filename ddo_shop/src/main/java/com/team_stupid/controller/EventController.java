package com.team_stupid.controller;

import java.util.List;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;

import com.team_stupid.domain.CommentVO;
import com.team_stupid.mapper.CommentMapper;


@Controller
public class EventController {
	
	@Autowired
	private CommentMapper commentMapper;
	
	@RequestMapping("/comment**")
	public String EventDetail(HttpServletRequest req) throws Exception{
		HttpSession ses = req.getSession();
		int eventNum = Integer.parseInt(req.getParameter("event"));
		
		List<CommentVO> commentList = commentMapper.getCommentList(eventNum);
		ses.setAttribute("commentList", commentList);
		
		return "comment/comment";
	}

	
	
	@ResponseBody
	@RequestMapping(value = "/comment/addComment.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String AddComment(@RequestBody Map<String, String> map ) {
		int commEventNum = Integer.parseInt(map.get("commEventNum"));
		int commNum = commentMapper.getNextCommNum(); // groupnum 도 같은 수 사용
		String commNick = map.get("commNick");
		String commComment = map.get("commComment");
		int commClass = Integer.parseInt(map.get("commClass"));
		int commGroupNum = Integer.parseInt(map.get("commGroupNum"));
		if (commGroupNum == -1) commGroupNum = commNum;
		int commOrder = commentMapper.getNextCommOrder(commClass, commGroupNum);
		char commIsClickedEmo = '0';
		// 1 = commClass , 0 = commEmotions . '0' = commIsClickedEmo
		try {
			commentMapper.addComment(commEventNum, commNum, commNick, commComment, commClass, commOrder, commGroupNum, 0, commIsClickedEmo);
			return "success";
		} catch(Exception e) {
			System.out.println("addComment error!!");
			e.printStackTrace();
			return "fail";
		}
	}

	
	@ResponseBody
	@RequestMapping(value = "/comment/updateComment.do", produces = "application/json; charset=UTF-8", method = RequestMethod.POST)
	public String UpdateComment(@RequestBody Map<String, String> map ) {
		String newComment = map.get("newComment");
		int commNum = Integer.parseInt(map.get("commentNum"));
		try {
			commentMapper.updateComment(newComment, commNum);
			return "success";
		} catch(Exception e) {
			System.out.println("updateComment error!!");
			e.printStackTrace();
			return "fail";
		}
	}
	
	
	@ResponseBody
	@RequestMapping(value = "/comment/deleteComment.do", produces = "application/text; charset=UTF-8", method = RequestMethod.POST)
	public String DeleteComment(String commNumAndGroupNum ) {
		try {
			String[] paramArr = commNumAndGroupNum.split("/");
			int commNum = Integer.parseInt(paramArr[0]);
			int commGroupNum = Integer.parseInt(paramArr[1]);
			int commClass = commentMapper.getCommClass(commNum);
			int flag = commentMapper.getMaxOrderInGroup(commGroupNum);
			System.out.println(commClass + " : " + flag);
			if (commClass == 2) {
				commentMapper.deleteComment(commNum);
				if (commentMapper.getMaxOrderInGroup(commGroupNum) == 1)
					commentMapper.deleteCommentByGN(commGroupNum);
				return "success";
			} else if (commentMapper.getMaxOrderInGroup(commGroupNum) == 1) {
				commentMapper.deleteComment(commNum);
				return "success";
			} else {
				commentMapper.updateComment("!!!삭제된 댓글입니다.!!!", commNum);
				return "success";
			}
		} catch(Exception e) {
			System.out.println("updateComment error!!");
			e.printStackTrace();
			return "fail";
		}
	}
}
