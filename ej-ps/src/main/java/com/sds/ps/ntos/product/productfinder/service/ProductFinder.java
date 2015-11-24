package com.sds.ps.ntos.product.productfinder.service;

import anyframe.common.Page;

import com.sds.ps.domain.Product;

public interface ProductFinder {
	Page getPagingList(Product product, int pageSize ,int pageIndex) throws Exception;
	Page getPagingList(Product product) throws Exception;
}
