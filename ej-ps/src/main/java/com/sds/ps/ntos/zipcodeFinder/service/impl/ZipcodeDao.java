package com.sds.ps.ntos.zipcodeFinder.service.impl;

import javax.inject.Inject;

import org.springframework.beans.factory.annotation.Value;
import org.springframework.stereotype.Repository;

import com.sds.ps.domain.Zipcode;

import anyframe.common.Page;
import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

@Repository("ntosZipcodeDao")
public class ZipcodeDao extends AbstractDAO {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}
	
	public Page getPagingList(Zipcode zipcode, int pageIndex) throws Exception {
		return this.findListWithPaging("Zipcode", zipcode, pageIndex, pageSize,
				pageUnit);
	}

	public Page getPagingList(Zipcode zipcode)  throws Exception {
		return findListWithPaging("Zipcode", zipcode, zipcode.getCurrentPageNo(),
				zipcode.getRecordCountPerPage());
	}
	
}
