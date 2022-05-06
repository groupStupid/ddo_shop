package com.team_stupid.mapper;

import java.util.List;
import java.util.Map;
import java.util.Optional;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.BoardVO;
import com.team_stupid.security.CustomUserDetails;

@Service
public interface CustomerMapper {
	Optional<CustomUserDetails> loadUserByUsername(@Param("id") String id);

	int register( @Param("userid") String userid, 
			@Param("username") String username, 
			@Param("password") String password,
			@Param("email") String email, 
			@Param("nickname") String nickname, 
			@Param("address") String address, 
			@Param("phone") String phone,
			@Param("category") char category
			);

	int selectUserIdDistinct(@Param("id") String id);

	String selectUserIdForFoundid(@Param("username") String username, @Param("email") String email);

	int selectUserPw(@Param("username") String username, @Param("userid") String userid, @Param("email") String email);

	void updateTempUserPw(@Param("userid") String userid, @Param("tempPw") String tempPw);
	
//	String search_image(@Param("recycle_title") String recycle_title);
	
	void deleteboard(@Param("event_num") int board_num);
	List<BoardVO> list();

	BoardVO searchItem(@Param("num") String num);
	int getCount();

	void write(@Param("data") Map<String, String> data);
}
