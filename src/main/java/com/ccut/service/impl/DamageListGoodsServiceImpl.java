package com.ccut.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ccut.entity.DamageListGoods;
import com.ccut.repository.DamageListGoodsRepository;
import com.ccut.service.DamageListGoodsService;

/**
 * 报损单商品Service实现类
 * @author Meng.Yang
 *
 */
@Service("damageListGoodsService")
public class DamageListGoodsServiceImpl implements DamageListGoodsService{

	@Resource
	private DamageListGoodsRepository damageListGoodsRepository;

	@Override
	public List<DamageListGoods> listByDamageListId(Integer damageListId) {
		return damageListGoodsRepository.listByDamageListId(damageListId);
	}



}
