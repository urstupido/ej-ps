package com.sds.ps.ntos.product.productselectfinder.service;

import anyframe.common.Page;

import com.sds.ps.domain.ProductSelect;

public interface ProductSelectFinder {
	Page getPagingList(ProductSelect productSelect, int pageSize ,int pageIndex) throws Exception;
	Page getPagingList(ProductSelect productSelect) throws Exception;
}
