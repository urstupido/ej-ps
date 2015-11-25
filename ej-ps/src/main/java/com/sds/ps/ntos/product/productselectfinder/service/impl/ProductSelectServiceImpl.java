package com.sds.ps.ntos.product.productselectfinder.service.impl;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sds.ps.domain.ProductSelect;
import com.sds.ps.ntos.product.productselectfinder.service.ProductSelectService;

@Service("ntosProductSelectService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class ProductSelectServiceImpl implements ProductSelectService {

	@Inject
	@Named("ntosProductSelectDao")
	private ProductSelectDao productSelectDao;


	@Override
	public ProductSelect get(ProductSelect productSelect) throws Exception {
		return productSelectDao.get(productSelect);
	}

	@Override
	public void create(ProductSelect productSelect) throws Exception {
		productSelectDao.create(productSelect);
		
	}

	@Override
	public void update(ProductSelect productSelect) throws Exception {
		productSelectDao.update(productSelect);
	}

	@Override
	public void remove(ProductSelect productSelect) throws Exception {
		productSelectDao.remove(productSelect);
	}
}