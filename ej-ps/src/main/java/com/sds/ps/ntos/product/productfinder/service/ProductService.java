package com.sds.ps.ntos.product.productfinder.service;

import com.sds.ps.domain.Product;

public interface ProductService {

	Product get(String prodNo) throws Exception;

	void create(Product product) throws Exception;

	void update(Product product) throws Exception;

	void remove(String prodNo) throws Exception;


}
