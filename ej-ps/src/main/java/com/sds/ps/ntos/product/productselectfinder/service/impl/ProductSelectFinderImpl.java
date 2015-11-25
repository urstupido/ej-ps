package com.sds.ps.ntos.product.productselectfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.Product;
import com.sds.ps.ntos.product.productfinder.service.ProductFinder;

@Service("ntosProductSelectFinder")
public class ProductSelectFinderImpl implements ProductFinder {
	@Inject
	@Named("ntosProductSelectDao")
	private ProductSelectDao productDao;

	public Page getPagingList(Product product, int pageSize, int pageIndex)throws Exception {
		return this.productDao.getPagingList(product, pageSize, pageIndex);
	}

	public Page getPagingList(Product product) throws Exception {
		return this.productDao.getPagingList(product);
	}
}
