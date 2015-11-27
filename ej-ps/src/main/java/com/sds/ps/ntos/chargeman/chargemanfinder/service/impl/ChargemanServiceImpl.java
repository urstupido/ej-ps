package com.sds.ps.ntos.chargeman.chargemanfinder.service.impl;
import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;

import com.sds.ps.domain.Chargeman;
import com.sds.ps.ntos.chargeman.chargemanfinder.service.ChargemanService;

@Service("ntosChargemanService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class ChargemanServiceImpl implements ChargemanService {
//	@Inject
//	@Named("idGenerationServiceChargeman")
//	IIdGenerationService idGenerationService;

	@Inject
	@Named("ntosChargemanDao")
	private ChargemanDao chargemanDao;

	public void create(Chargeman chargeman) throws Exception {
//		chargeman.setChmnSeq(idGenerationService.getNextStringId());
		chargemanDao.create(chargeman);
	}

	public void remove(String contNo) throws Exception {
		chargemanDao.remove(contNo);
	}

	public void update(Chargeman chargeman) throws Exception {
		chargemanDao.update(chargeman);
	}
	public Chargeman get(String contNo, String chmnSeq) throws Exception {
		return chargemanDao.get(contNo, chmnSeq);
	}
}