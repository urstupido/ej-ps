package com.sds.ps.ntos.customerfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.Customer;
import com.sds.ps.domain.Movie;

@Service("ntosCustomFinder")
public class CustomerFinderImpl {

	@Inject
	@Named("ntosCustomDao")
	private CustomerDao customerDao;
	
	public Page getPagingList(Customer customer, int pageIndex) throws Exception {
		return this.customerDao.getPagingList(customer, pageIndex);
	}
	
}
