package com.sds.ps.ntos.product.productfinder.service.impl;
import javax.inject.Inject;
import javax.inject.Named;
import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;
import anyframe.core.idgen.IIdGenerationService;
import com.sds.ps.domain.Product;
import com.sds.ps.ntos.product.productfinder.service.ProductService;

@Service("ntosProductService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class ProductServiceImpl implements ProductService {
	@Inject
	@Named("idGenerationServiceProduct")
	IIdGenerationService idGenerationService;

	@Inject
	@Named("ntosProductDao")
	private ProductDao productDao;

	public void create(Product product) throws Exception {
		product.setProdNo(idGenerationService.getNextStringId());
		productDao.create(product);
	}

	public void remove(String prodNo) throws Exception {
		productDao.remove(prodNo);
	}

	public void update(Product product) throws Exception {
		productDao.update(product);
	}
	public Product get(String prodNo) throws Exception {
		return productDao.get(prodNo);
	}
}