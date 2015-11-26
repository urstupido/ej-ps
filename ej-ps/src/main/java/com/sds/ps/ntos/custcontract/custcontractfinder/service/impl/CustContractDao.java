package com.sds.ps.ntos.custcontract.custcontractfinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.ps.domain.CustContract;

@Repository("ntosCustContractDao")
public class CustContractDao extends AbstractDAO {
	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(CustContract custContract) throws Exception {
		create("CustContract", custContract);
	}

	public void remove(String contNo) throws Exception {
		CustContract custContract = new CustContract();
		custContract.setContNo(contNo);
		remove("CustContract", custContract);
	}

	public void update(CustContract custContract) throws Exception {
		update("CustContract", custContract);
	}

	public CustContract get(String contNo) throws Exception {
		CustContract custContract = new CustContract();
		custContract.setContNo(contNo);
		return (CustContract) findByPk("CustContract", custContract);
	}

	public Page getPagingList(CustContract custContract, int pageSize ,int pageIndex) throws Exception {
		return this.findListWithPaging("CustContract", custContract, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(CustContract custContract)  throws Exception {
		return findListWithPaging("CustContract", custContract, custContract.getCurrentPageNo(),
				custContract.getRecordCountPerPage());
	}
}
