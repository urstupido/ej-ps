package com.sds.ps.ntos.codefinder.service;

import java.util.List;

import com.sds.ps.domain.Code;

public interface CodeService {
	public List<Code> getList(String codeType) throws Exception;
}
