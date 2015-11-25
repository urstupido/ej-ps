package com.sds.ps.ntos.contract.contractfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;

import com.sds.ps.domain.Contract;
import com.sds.ps.ntos.contract.contractfinder.service.ContractService;

@Service("ntosContractService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class ContractServiceImpl implements ContractService {

	@Inject
	@Named("idGenerationServiceContract")
	IIdGenerationService idGenerationService;

	@Inject
	@Named("ntosContractDao")
	private ContractDao contractDao;

	public void create(Contract contract) throws Exception {
		if(contract == null){
			
		}
		
		contract.setContNo(idGenerationService.getNextStringId());
		contractDao.create(contract);
	}

	public void remove(String contNo) throws Exception {
		contractDao.remove(contNo);
	}

	public void update(Contract contract) throws Exception {
		contractDao.update(contract);
	}

	public Contract get(String contNo) throws Exception {
		return contractDao.get(contNo);
	}
}
