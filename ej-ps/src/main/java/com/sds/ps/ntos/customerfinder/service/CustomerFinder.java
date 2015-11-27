package com.sds.ps.ntos.customerfinder.service;

import com.sds.ps.domain.Customer;

import anyframe.common.Page;

public interface CustomerFinder {
	Page getPagingList(Customer customer, int pageIndex) throws Exception;

	Page getPagingList(Customer customer) throws Exception;
}
