package com.sds.ps.ntos.customerfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ntos.customerfinder.service.CustomerFinder;
import com.sds.ps.domain.Customer;

@Service("ntosCustomerFinder")
public class CustomerFinderImpl implements CustomerFinder {

	@Inject
	@Named("ntosCustomerDao")
	private CustomerDao customerDao;
	
	public Page getPagingList(Customer customer, int pageIndex) throws Exception {
		return this.customerDao.getPagingList(customer, pageIndex);
	}
	
	public Page getPagingList(Customer customer) throws Exception {
		return this.customerDao.getPagingList(customer);
	}
}
