package com.sds.ps.ntos.zipcodeFinder.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
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

	@RequestMapping(params = "method=list")
	public @ResponseBody Map<String, Object> list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Zipcode zipcode) throws Exception {

		Page resultPage = zipcodeFinder.getPagingList(zipcode, pageIndex);
		Map<String, Object> map = new HashMap<String, Object>();
		map.put("customer", zipcode);
		map.put("customers", resultPage.getList());
		map.put("size", resultPage.getTotalCount());
		map.put("pagesize", resultPage.getPagesize());
		map.put("pageunit", resultPage.getPageunit());
		map.put("resultPage", resultPage);

		return map;
	}

	@RequestMapping(params = "method=openWindow")
	public String openWindow() throws Exception {
		return "ntosListZipcode";
	}

}
