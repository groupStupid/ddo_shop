package com.team_stupid.service;

import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import com.team_stupid.dao.BoardDAO;
import com.team_stupid.domain.BoardVO;

@Service
public class BoardServicelmpl implements BoardService {
	@Autowired
	private BoardDAO dao;
	
	@Override
	public List<BoardVO> list() throws Exception {
		return dao.list();
	}
	
	@Override
	public BoardVO searchItem(String num) throws Exception {
		return dao.searchItem(num);
	}
	
	@Override
	public void write(Map<String, String> map) throws Exception {
		dao.write(map);
		
	}
}
