package com.sds.ps.ntos.contract.contractfinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.ps.domain.Contract;

@Repository("ntosContractDao")
public class ContractDao extends AbstractDAO {
	
	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Contract contract) throws Exception {
		create("Contract", contract);
	}

	public void remove(String contNo) throws Exception {
		Contract contract = new Contract();
		contract.setContNo(contNo);
		remove("Contract", contract);
	}

	public void update(Contract contract) throws Exception {
		update("Contract", contract);
	}

	public Contract get(String contNo) throws Exception {
		Contract contract = new Contract();
		contract.setContNo(contNo);
		return (Contract) findByPk("Contract", contract);
	}

	public Page getPagingList(Contract contract, int pageSize ,int pageIndex) throws Exception {
		Page page =this.findListWithPaging("Contract", contract, pageIndex, pageSize,
				pageUnit); 
		System.out.println("************************");
		return page;
	}

	public Page getPagingList(Contract contract)  throws Exception {
		Page page = findListWithPaging("Contract", contract, contract.getCurrentPageNo(),
				contract.getRecordCountPerPage());
		return page;
	}
}
