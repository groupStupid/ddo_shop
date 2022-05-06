package com.team_stupid.service;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.BoardVO;

@Service
public interface BoardService {

	public List<BoardVO> list() throws Exception;
	public BoardVO searchItem(String num) throws Exception;
	public void write(Map<String, String> map) throws Exception;
}
