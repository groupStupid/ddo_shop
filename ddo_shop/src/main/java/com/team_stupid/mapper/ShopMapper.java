package com.team_stupid.mapper;

import java.util.List;

import org.apache.ibatis.annotations.Param;
import org.springframework.stereotype.Service;

import com.team_stupid.domain.ShopEventVO;
import com.team_stupid.domain.ShopInfoVO;

@Service
public interface ShopMapper {
	List<ShopInfoVO> getShopListByCategory(@Param("category") int category);
	ShopInfoVO getShopInfoDetail(@Param("serialNum")String serialNum);

	List<ShopInfoVO> getShopInfoBySearchKeyword(@Param("keyword")String keyword);
	
	ShopEventVO getShopEvent(@Param("serialNum")String serialNum);
}
