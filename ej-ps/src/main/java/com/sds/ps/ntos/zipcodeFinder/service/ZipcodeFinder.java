package com.sds.ps.ntos.zipcodeFinder.service;

import com.sds.ps.domain.Zipcode;

import anyframe.common.Page;

public interface ZipcodeFinder {
	public Page getPagingList(Zipcode zipcode, int pageIndex) throws Exception;
	
}
