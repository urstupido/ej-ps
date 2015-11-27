package com.sds.ps.ntos.product.productfinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.ps.domain.Product;

@Repository("ntosProductDao")
public class ProductDao extends AbstractDAO {
	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Product product) throws Exception {
		create("Product", product);
	}

	public void remove(String prodNo) throws Exception {
		Product product = new Product();
		product.setProdNo(prodNo);
		remove("Product", product);
	}

	public void update(Product product) throws Exception {
		update("Product", product);
	}

	public Product get(String prodNo) throws Exception {
		Product product = new Product();
		product.setProdNo(prodNo);
		return (Product) findByPk("Product", product);
	}

	public Page getPagingList(Product product, int pageSize ,int pageIndex) throws Exception {
		return this.findListWithPaging("Product", product, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(Product product)  throws Exception {
		return findListWithPaging("Product", product, product.getCurrentPageNo(),
				product.getRecordCountPerPage());
	}

}