package com.team_stupid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.EmotionsVO;
import com.team_stupid.domain.ShopInfoVO;

@Service
public interface EmotionsMapper {
	List<EmotionsVO> getListMyEmotions(@Param("eventNum") int eventNum, @Param("userid") String userid);
	
	int addEmotion(@Param("eventNum") int eventNum, @Param("commNum") int commNum, @Param("userid") String userid);
	
	void removeEmotion(@Param("eventNum") int eventNum, @Param("commNum") int commNum, @Param("userid") String userid);
}
