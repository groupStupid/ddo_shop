package com.team_stupid.mapper;

import java.util.List;

import org.springframework.stereotype.Service;

import com.team_stupid.domain.ShopInfoVO;

@Service
public interface ShopMapper {
	List<ShopInfoVO> getShopInfoList();
}
