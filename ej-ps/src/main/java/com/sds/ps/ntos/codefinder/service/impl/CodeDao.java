package com.sds.ps.ntos.codefinder.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import com.sds.ps.domain.CodeInfo;

import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;

@Repository("codeDao")
public class CodeDao extends AbstractDAO {

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	@SuppressWarnings("unchecked")
	public List<CodeInfo> getList(String codeType) throws Exception {
		CodeInfo code = new CodeInfo();
		code.setCodeType(codeType);
		return (List<CodeInfo>) this.findList("CodeInfo", code);
	}

}