package com.ccut.service.impl;

import java.util.List;

import javax.annotation.Resource;

import org.springframework.stereotype.Service;

import com.ccut.entity.GoodsType;
import com.ccut.repository.GoodsTypeRepository;
import com.ccut.service.GoodsTypeService;

/**
 * 商品类别Service实现类
 * @author Meng.Yang
 *
 */
@Service("goodsTypeService")
public class GoodsTypeServiceImpl implements GoodsTypeService{

	@Resource
	private GoodsTypeRepository goodsTypeRepository;

	@Override
	public void save(GoodsType goodsType) {
		goodsTypeRepository.save(goodsType);
	}

	@Override
	public void delete(Integer id) {
		goodsTypeRepository.delete(id);
	}

	@Override
	public List<GoodsType> findByParentId(int parentId) {
		return goodsTypeRepository.findByParentId(parentId);
	}

	@Override
	public GoodsType findById(Integer id) {
		return goodsTypeRepository.findOne(id);
	}

}
