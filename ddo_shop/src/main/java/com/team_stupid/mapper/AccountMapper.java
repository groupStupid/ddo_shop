package com.team_stupid.mapper;

import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.security.CustomUserDetails;

@Service
public interface AccountMapper {
	Optional<CustomUserDetails> loadUserByUsername(@Param("id") String id);

	int register( @Param("userid") String userid, 
			@Param("password") String password,
			@Param("email") String email,
			@Param("nickname") String nickname,
			@Param("category") char category
			);

	int selectUserIdDistinct(@Param("id") String id);
	
	int selectNicknameDistinct(@Param("nickname") String nickname);

	String FoundUserId(@Param("email") String email);

	int selectUserPw( @Param("userid") String userid, @Param("email") String email);

	void updateTempUserPw(@Param("userid") String userid, @Param("tempPw") String tempPw);
	
	String getNicknameById(@Param("userid") String userid);
	
	int getEmailCount(@Param("email") String email);
	
//	String search_image(@Param("recycle_title") String recycle_title);
	
//	void deleteboard(@Param("event_num") int event_num);
//	List<BoardVO> list();
//
//	BoardVO searchItem(@Param("num") String num);
//	int getCount();
//
//	void write(@Param("data") Map<String, String> data);
}
