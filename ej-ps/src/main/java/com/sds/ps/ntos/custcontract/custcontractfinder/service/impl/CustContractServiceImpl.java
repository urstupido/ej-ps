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

//	@Inject
//	@Named("idGenerationServiceCustContract")
//	IIdGenerationService idGenerationService;

	@Inject
	@Named("ntosCustContractDao")
	private CustContractDao custcontractDao;

	public void create(CustContract custcontract) throws Exception {
//		if(custcontract == null){
//		}
//		custcontract.setContNo(idGenerationService.getNextStringId());
//		custcontractDao.create(custcontract);
	}

	public void remove(String contNo) throws Exception {
		custcontractDao.remove(contNo);
	}

	public void update(CustContract custcontract) throws Exception {
		custcontractDao.update(custcontract);
	}

	public CustContract get(String contNo) throws Exception {
		return custcontractDao.get(contNo);
	}
}
