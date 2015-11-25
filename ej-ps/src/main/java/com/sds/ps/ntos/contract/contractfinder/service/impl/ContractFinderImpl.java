package com.sds.ps.ntos.contract.contractfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.Contract;
import com.sds.ps.ntos.contract.contractfinder.service.ContractFinder;

@Service("ntosContractFinder")
public class ContractFinderImpl implements ContractFinder {
	@Inject
	@Named("ntosContractDao")
	private ContractDao contractDao;

	public Page getPagingList(Contract contract, int pageSize, int pageIndex)throws Exception {
		System.out.println("리스트 받아와랏" + contract.toString());
		return this.contractDao.getPagingList(contract, pageSize, pageIndex);
	}

	public Page getPagingList(Contract contract) throws Exception {
		return this.contractDao.getPagingList(contract);
	}
}
