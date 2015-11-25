package com.sds.ps.ntos.chargeman.chargemanfinder.service;

import anyframe.common.Page;

import com.sds.ps.domain.Chargeman;

public interface ChargemanFinder {
	Page getPagingList(Chargeman chargeman, int pageSize ,int pageIndex) throws Exception;
	Page getPagingList(Chargeman chargeman) throws Exception;
}
