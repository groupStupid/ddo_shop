package com.team_stupid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.CommentVO;

@Service
public interface CommentMapper {
	List<CommentVO> getCommentList(@Param("eventNum") int eventNum);
	int getNextCommNum();
	int getNextCommOrder(@Param("commClass") int commClass, @Param("commGroupNum") int commGroupNum);
	int getCommClass(@Param("commNum") int commNum);
	int addComment(
			@Param("commEventNum") int commEventNum,
			@Param("commNum") int commNum,
			@Param("commNick") String commNick,
			@Param("commComment") String commComment,
			@Param("commClass") int commClass,
			@Param("commOrder") int commOrder,
			@Param("commGroupNum") int commGroupNum,
			@Param("commEmotions") int commEmotions,
			@Param("commIsClickedEmo") char commIsClickedEmo
	);
	int updateComment(@Param("newComment") String newComment, @Param("commNum") int commNum);
	void deleteComment(@Param("commNum")int commNum);
	void deleteCommentByGN(@Param("commGroupNum")int commGroupNum);
	int getMaxOrderInGroup(@Param("commGroupNum")int commGroupNum);
}
