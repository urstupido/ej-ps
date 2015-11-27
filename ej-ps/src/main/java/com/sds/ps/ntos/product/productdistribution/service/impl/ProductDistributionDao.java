package com.sds.ps.ntos.product.productdistribution.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.ps.domain.ProductDistribution;

@Repository("ntosProductDistributionDao")
public class ProductDistributionDao extends AbstractDAO {
	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void update(ProductDistribution productDistribution) throws Exception {
		create("ProductDistribution", productDistribution);
		update("ProductDistribution", productDistribution);
	}

	public Page getPagingList(ProductDistribution productDistribution, int pageSize ,int pageIndex) throws Exception {
		return this.findListWithPaging("ProductDistribution", productDistribution, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(ProductDistribution productDistribution)  throws Exception {
		return findListWithPaging("ProductDistribution", productDistribution, productDistribution.getCurrentPageNo(),
				productDistribution.getRecordCountPerPage());
	}
}