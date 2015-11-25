package com.sds.ps.ntos.custcontract.custcontractfinder.service;

import com.sds.ps.domain.CustContract;

public interface CustContractService {

	CustContract get(String contNo) throws Exception;

	void create(CustContract custContract) throws Exception;

	void update(CustContract custContract) throws Exception;

	void remove(String contNo) throws Exception;


}
