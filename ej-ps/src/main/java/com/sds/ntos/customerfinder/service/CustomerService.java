package com.sds.ntos.customerfinder.service;

import com.sds.ps.domain.Customer;

public interface CustomerService {
	
	Customer get(String cusNo) throws Exception;
	void create(Customer customer) throws Exception;
	void update(Customer customer) throws Exception;
	void remove(String cusNo) throws Exception;
}
