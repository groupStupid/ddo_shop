package com.team_stupid.dao;

import java.util.List;
import java.util.Map;

import org.apache.ibatis.annotations.Param;

import com.team_stupid.domain.BoardVO;


public interface BoardDAO {

	public List<BoardVO> list() throws Exception;
	public BoardVO searchItem(String num) throws Exception;
	public void write(Map<String, String> map) throws Exception;
}
