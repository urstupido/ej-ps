package com.sds.ps.ntos.codefinder.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.sds.ps.domain.Code;
import com.sds.ps.ntos.codefinder.service.CodeService;

@Service("ntosCodeService")
public class CodeServiceImpl implements CodeService {
	
	@Inject
	@Named("codeDao")
	private CodeDao codeDao;
	
	public List<Code> getList(String codeType) throws Exception {
		return codeDao.getList(codeType);
	}

	
}
