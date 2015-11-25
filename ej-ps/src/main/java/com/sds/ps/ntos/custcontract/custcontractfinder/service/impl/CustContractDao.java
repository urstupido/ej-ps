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

	public void create(CustContract custcontract) throws Exception {
		create("CustContract", custcontract);
	}

	public void remove(String contNo) throws Exception {
		CustContract custcontract = new CustContract();
		custcontract.setContNo(contNo);
		remove("CustContract", custcontract);
	}

	public void update(CustContract custcontract) throws Exception {
		update("CustContract", custcontract);
	}

	public CustContract get(String contNo) throws Exception {
		CustContract custcontract = new CustContract();
		custcontract.setContNo(contNo);
		return (CustContract) findByPk("CustContract", custcontract);
	}

	public Page getPagingList(CustContract custcontract, int pageSize ,int pageIndex) throws Exception {
		return this.findListWithPaging("CustContract", custcontract, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(CustContract custcontract)  throws Exception {
		return findListWithPaging("CustContract", custcontract, custcontract.getCurrentPageNo(),
				custcontract.getRecordCountPerPage());
	}
}
