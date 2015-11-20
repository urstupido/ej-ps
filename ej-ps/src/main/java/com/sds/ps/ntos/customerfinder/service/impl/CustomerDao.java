package com.sds.ps.ntos.customerfinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.IQueryService;
import anyframe.core.query.AbstractDAO;

import com.sds.ps.domain.Customer;

@Repository("ntosCustomerDao")
public class CustomerDao extends AbstractDAO {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}
	
	public void create(Customer customer) throws Exception {
		create("Customer", customer);
	}
	
	public void remove(String cusNo) throws Exception {
		Customer customer = new Customer();
		customer.setCusNo(cusNo);
		remove("Customer", customer);
	}
	
	public void update(Customer customer) throws Exception {
		update("Customer", customer);
	}
	
	public Customer get(String cusNo) throws Exception {
		Customer customer = new Customer();
		customer.setCusNo(cusNo);
		System.out.println(cusNo);
		return (Customer)findByPk("Customer", customer);
	}

	public Page getPagingList(Customer customer, int pageIndex) throws Exception {
		return this.findListWithPaging("Customer", customer, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(Customer customer)  throws Exception {
		return findListWithPaging("Customer", customer, customer.getCurrentPageNo(),
				customer.getRecordCountPerPage());
	}
}
