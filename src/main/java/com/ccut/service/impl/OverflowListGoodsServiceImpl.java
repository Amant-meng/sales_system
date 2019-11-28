package com.ccut.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ccut.entity.OverflowListGoods;
import com.ccut.repository.OverflowListGoodsRepository;
import com.ccut.service.OverflowListGoodsService;

/**
 * 报溢单商品Service实现类
 * @author Meng.Yang
 *
 */
@Service("overflowListGoodsService")
public class OverflowListGoodsServiceImpl implements OverflowListGoodsService{

	@Resource
	private OverflowListGoodsRepository overflowListGoodsRepository;

	@Override
	public List<OverflowListGoods> listByOverflowListId(Integer overflowListId) {
		return overflowListGoodsRepository.listByOverflowListId(overflowListId);
	}



}
