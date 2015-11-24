package com.sds.ps.ntos.zipcodeFinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.ps.domain.Zipcode;
import com.sds.ps.ntos.zipcodeFinder.service.ZipcodeFinder;

import anyframe.common.Page;


@Controller("ntosZipcodeFinderController")
@RequestMapping("/ntosZipcodeFinder.do")
public class ZipcodeFinderController {
	
	@Inject
	@Named("ntosZipcodeFinder")
	private ZipcodeFinder zipcodeFinder;
	
	@ResponseBody
	@RequestMapping(params = "method=list")
	public Page list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Zipcode zipcode) throws Exception {
		
		Page resultPage = zipcodeFinder.getPagingList(zipcode, pageIndex);
		return resultPage;
	}
	
	@RequestMapping(params = "method=openWindow")
	public String openWindow() throws Exception {
		return "ntosListZipcode";
	}
	
}
