package com.team_stupid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.MenuInfoVO;
import com.team_stupid.domain.ShopInfoVO;

@Service
public interface MenuMapper {
	List<MenuInfoVO> getMenuInfo(@Param("shopSerialNum") String shopSerialNum);
}
