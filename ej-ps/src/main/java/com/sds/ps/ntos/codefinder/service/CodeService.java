package com.sds.ps.ntos.codefinder.service;

import java.util.List;

import com.sds.ps.domain.CodeInfo;

public interface CodeService {
	public List<CodeInfo> getList(String codeType) throws Exception;
}
