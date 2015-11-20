package com.sds.ps.ntos.product.productfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.Product;
import com.sds.ps.ntos.product.productfinder.service.ProductFinder;

@Service("ntosProductFinder")
public class ProductFinderImpl implements ProductFinder {

	@Inject
	@Named("ntosProductDao")
	private ProductDao productDao;

	public Page getPagingList(Product product, int pageIndex) throws Exception {
		return this.productDao.getPagingList(product, pageIndex);
	}

	public Page getPagingList(Product product) throws Exception {
		return this.productDao.getPagingList(product);
	}
}
