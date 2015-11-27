package com.sds.ps.ntos.product.productdistribution.service.impl;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sds.ps.domain.ProductDistribution;
import com.sds.ps.ntos.product.productdistribution.service.ProductDistributionService;

@Service("ntosProductDistributionService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class ProductDistributionServiceImpl implements ProductDistributionService {
	@Inject
	@Named("ntosProductDistributionDao")
	private ProductDistributionDao productDistributionDao;

	public void update(ProductDistribution productDistribution) throws Exception {
		productDistributionDao.update(productDistribution);
	}
}