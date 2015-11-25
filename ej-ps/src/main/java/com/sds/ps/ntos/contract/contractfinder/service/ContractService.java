package com.sds.ps.ntos.contract.contractfinder.service;

import com.sds.ps.domain.Contract;

public interface ContractService {

	Contract get(String contNo) throws Exception;

	void create(Contract contract) throws Exception;

	void update(Contract contract) throws Exception;

	void remove(String contNo) throws Exception;


}
