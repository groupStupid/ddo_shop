package com.team_stupid.mapper;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.BoardVO;

@Service
public interface BoardMapper {
	List<BoardVO> list();
	BoardVO searchItem(@Param("num") String num);
	int getCount();
	void write(@Param("data") Map<String, String> data);
	void deleteboard(@Param("event_num") int event_num);
}
