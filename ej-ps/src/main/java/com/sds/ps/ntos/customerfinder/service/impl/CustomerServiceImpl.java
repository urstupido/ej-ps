package com.sds.ps.ntos.customerfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import com.sds.ntos.customerfinder.service.CustomerService;
import com.sds.ps.domain.Customer;

import anyframe.core.idgen.IIdGenerationService;

@Service("ntosCustomerService")
@Transactional(rollbackFor = {Exception.class}, propagation = Propagation.REQUIRED )
public class CustomerServiceImpl implements CustomerService{
	
	@Inject
	@Named("idGenerationServiceCustomer")
	IIdGenerationService idGenerationService;
	
	@Inject
	@Named("ntosCustomerDao")
	private CustomerDao customerDao;
	
	public void create(Customer customer) throws Exception {
		customer.setCusNo(idGenerationService.getNextStringId());
		if (customer.getPictureFile() != null) {
			customer.setPictureFile(customer.getPictureFile()+customer.getCusNo()+".png");
		}
		customerDao.create(customer);
	}
	
	public void remove(String cusNo) throws Exception {
		customerDao.remove(cusNo);
	}

	public Customer get(String cusNo) throws Exception {
		return customerDao.get(cusNo);
	}

	public void update(Customer customer) throws Exception {
		customerDao.update(customer);
	}
}
