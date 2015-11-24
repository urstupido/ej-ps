package com.sds.ps.ntos.zipcodeFinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.sds.ps.domain.Zipcode;
import com.sds.ps.ntos.zipcodeFinder.service.ZipcodeFinder;

import anyframe.common.Page;

@Service("ntosZipcodeFinder")
public class ZipcodeFinderImpl implements ZipcodeFinder{
	
	@Inject
	@Named("ntosZipcodeDao")
	private ZipcodeDao zipcodeDao;
	
	public Page getPagingList(Zipcode zipcode, int pageIndex) throws Exception {
		return zipcodeDao.getPagingList(zipcode, pageIndex);
	}
	
	public Page getPagingList(Zipcode zipcode) throws Exception {
		return this.zipcodeDao.getPagingList(zipcode);
	}

}
