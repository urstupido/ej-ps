package com.sds.ps.ntos.chargeman.chargemanfinder.service;

import com.sds.ps.domain.Chargeman;

public interface ChargemanService {

	Chargeman get(String contNo, String chmnSeq) throws Exception;

	void create(Chargeman chargeman) throws Exception;

	void update(Chargeman chargeman) throws Exception;

	void remove(String contNo) throws Exception;


}
