package com.sds.ps.ntos.custcontract.custcontractfinder.service;

import anyframe.common.Page;

import com.sds.ps.domain.CustContract;

public interface CustContractFinder {
	Page getPagingList(CustContract custContract, int pageSize ,int pageIndex) throws Exception;
	Page getPagingList(CustContract custContract) throws Exception;
}
