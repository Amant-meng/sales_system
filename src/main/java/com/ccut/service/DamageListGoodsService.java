package com.ccut.service;

import java.util.List;

import com.ccut.entity.DamageListGoods;

/**
 * 报损单商品Service接口
 * @author Meng.Yang
 *
 */
public interface DamageListGoodsService {

	/**
	 * 根据报损单id查询所有报损单商品
	 * @param damageListId
	 * @return
	 */
	public List<DamageListGoods> listByDamageListId(Integer damageListId);


}
