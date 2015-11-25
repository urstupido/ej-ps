package com.sds.ps.ntos.contract.contractfinder.service;

import anyframe.common.Page;

import com.sds.ps.domain.Contract;

public interface ContractFinder {
	Page getPagingList(Contract contract, int pageSize ,int pageIndex) throws Exception;
	Page getPagingList(Contract contract) throws Exception;
}
