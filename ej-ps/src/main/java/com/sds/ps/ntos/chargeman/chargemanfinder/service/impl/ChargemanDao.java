package com.sds.ps.ntos.chargeman.chargemanfinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

import com.sds.ps.domain.Chargeman;
import com.sds.ps.domain.Product;

@Repository("ntosChargemanDao")
public class ChargemanDao extends AbstractDAO {
	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	public void create(Chargeman chargeman) throws Exception {
		create("Chargeman", chargeman);
	}

	public void remove(String contNo) throws Exception {
		Chargeman chargeman = new Chargeman();
		chargeman.setContNo(contNo);
		remove("Chargeman", chargeman);
	}

	public void update(Chargeman chargeman) throws Exception {
		update("Chargeman", chargeman);
	}

	public Chargeman get(String contNo, String chmnSeq) throws Exception {
		Chargeman chargeman = new Chargeman();
		chargeman.setContNo(contNo);
		chargeman.setChmnSeq(chmnSeq);
		System.out.println("=========================DAO"+chargeman.toString());
		return (Chargeman) findByPk("Chargeman", chargeman);
	}

	public Page getPagingList(Chargeman chargeman, int pageSize ,int pageIndex) throws Exception {
		return this.findListWithPaging("Chargeman", chargeman, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(Chargeman chargeman)  throws Exception {
		return findListWithPaging("Chargeman", chargeman, chargeman.getCurrentPageNo(),
				chargeman.getRecordCountPerPage());
	}
}