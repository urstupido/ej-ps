package com.sds.ps.ntos.product.productselectfinder.service;

import com.sds.ps.domain.ProductSelect;

public interface ProductSelectService {

	ProductSelect get(ProductSelect productSelect) throws Exception;

	void create(ProductSelect productSelect) throws Exception;

	void update(ProductSelect productSelect) throws Exception;

	void remove(ProductSelect productSelect) throws Exception;


}
