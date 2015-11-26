package com.sds.ps.ntos.product.productdistribution.service;

import anyframe.common.Page;

import com.sds.ps.domain.ProductDistribution;

public interface ProductDistributionFinder {
	Page getPagingList(ProductDistribution productDistribution, int pageSize ,int pageIndex) throws Exception;
	Page getPagingList(ProductDistribution productDistribution) throws Exception;
	
}
