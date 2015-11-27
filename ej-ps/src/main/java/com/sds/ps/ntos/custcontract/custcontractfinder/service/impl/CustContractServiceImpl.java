package com.sds.ps.ntos.custcontract.custcontractfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;

import com.sds.ps.domain.CustContract;
import com.sds.ps.ntos.custcontract.custcontractfinder.service.CustContractService;

@Service("ntosCustContractService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class CustContractServiceImpl implements CustContractService {

	
/*	@Inject
	@Named("idGenerationServiceCustContract")
	IIdGenerationService idGenerationService;*/

	@Inject
	@Named("ntosCustContractDao")
	private CustContractDao custcontractDao;

	public void create(CustContract custContract) throws Exception {
		if(custContract == null){
		}
		//custContract.setContNo(idGenerationService.getNextStringId());
		custcontractDao.create(custContract);
	}

	public void remove(String contNo) throws Exception {
		custcontractDao.remove(contNo);
	}

	public void update(CustContract custContract) throws Exception {
		custcontractDao.update(custContract);
	}

	public CustContract get(String contNo) throws Exception {
		System.out.println("=============================serviceImpl==================");
		System.out.println("contNo"+contNo);
		return custcontractDao.get(contNo);
	}
}
