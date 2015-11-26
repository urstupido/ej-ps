package com.sds.ps.ntos.product.productselectfinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.ps.domain.ProductSelect;

@Repository("ntosProductSelectDao")
public class ProductSelectDao extends AbstractDAO {
	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(ProductSelect productSelect) throws Exception {
		create("ProductSelect", productSelect);
	}

	public void remove(ProductSelect productSelect) throws Exception {
		remove("ProductSelect", productSelect);
	}

	public void update(ProductSelect productSelect) throws Exception {
		update("ProductSelect", productSelect);
	}

	public ProductSelect get(ProductSelect productSelect) throws Exception {
		return (ProductSelect) findByPk("ProductSelect", productSelect);
	}

	public Page getPagingList(ProductSelect productSelect, int pageSize ,int pageIndex) throws Exception {
		return this.findListWithPaging("ProductSelect", productSelect, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(ProductSelect productSelect)  throws Exception {
		return findListWithPaging("ProductSelect", productSelect, productSelect.getCurrentPageNo(),
				productSelect.getRecordCountPerPage());
	}
}