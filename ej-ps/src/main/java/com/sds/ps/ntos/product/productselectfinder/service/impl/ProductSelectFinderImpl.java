package com.sds.ps.ntos.product.productselectfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.Product;
import com.sds.ps.domain.ProductSelect;
import com.sds.ps.ntos.product.productselectfinder.service.ProductSelectFinder;

@Service("ntosProductSelectFinder")
public class ProductSelectFinderImpl implements ProductSelectFinder {
	@Inject
	@Named("ntosProductSelectDao")
	private ProductSelectDao productSelectDao;

	@Override
	public Page getPagingList(ProductSelect productSelect, int pageSize,
			int pageIndex) throws Exception {
		return productSelectDao.getPagingList(productSelect, pageSize, pageIndex);
	}

	@Override
	public Page getPagingList(ProductSelect productSelect) throws Exception {
		// TODO Auto-generated method stub
		return productSelectDao.getPagingList(productSelect);
	}
}
