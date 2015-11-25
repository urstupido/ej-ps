package com.sds.ps.ntos.chargeman.chargemanfinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;

import com.sds.ps.domain.Chargeman;
import com.sds.ps.ntos.chargeman.chargemanfinder.service.ChargemanFinder;

@Service("ntosChargemanFinder")
public class ChargemanFinderImpl implements ChargemanFinder {
	@Inject
	@Named("ntosChargemanDao")
	private ChargemanDao chargemanDao;

	public Page getPagingList(Chargeman chargeman, int pageSize, int pageIndex)throws Exception {
		return this.chargemanDao.getPagingList(chargeman, pageSize, pageIndex);
	}

	public Page getPagingList(Chargeman chargeman) throws Exception {
		return this.chargemanDao.getPagingList(chargeman);
	}
}
