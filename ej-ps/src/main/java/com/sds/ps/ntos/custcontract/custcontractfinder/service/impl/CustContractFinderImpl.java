package com.sds.ps.ntos.custcontract.custcontractfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.CustContract;
import com.sds.ps.ntos.custcontract.custcontractfinder.service.CustContractFinder;

@Service("ntosCustContractFinder")
public class CustContractFinderImpl implements CustContractFinder {
	@Inject
	@Named("ntosCustContractDao")
	private CustContractDao custcontractDao;

	@Override
	public Page getPagingList(CustContract custContract, int pageSize, int pageIndex)throws Exception {
		return this.custcontractDao.getPagingList(custContract, pageSize, pageIndex);
	}

	@Override
	public Page getPagingList(CustContract custContract) throws Exception {
		return this.custcontractDao.getPagingList(custContract);
	}

}
