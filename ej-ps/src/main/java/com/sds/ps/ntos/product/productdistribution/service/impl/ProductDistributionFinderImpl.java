package com.sds.ps.ntos.product.productdistribution.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.ProductDistribution;
import com.sds.ps.ntos.product.productdistribution.service.ProductDistributionFinder;

@Service("ntosProductDistributionFinder")
public class ProductDistributionFinderImpl implements ProductDistributionFinder {
	@Inject
	@Named("ntosProductDistributionDao")
	private ProductDistributionDao productDistributionDao;

	public Page getPagingList(ProductDistribution productDistribution, int pageSize, int pageIndex)throws Exception {
		return this.productDistributionDao.getPagingList(productDistribution, pageSize, pageIndex);
	}

	public Page getPagingList(ProductDistribution productDistribution) throws Exception {
		return this.productDistributionDao.getPagingList(productDistribution);
	}
}
