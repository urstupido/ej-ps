package com.sds.ps.ntos.zipcodeFinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import com.sds.ps.domain.Zipcode;
import com.sds.ps.ntos.zipcodeFinder.service.ZipcodeFinder;

import anyframe.common.Page;

@Controller("ntosZipcodeFinderController")
@RequestMapping("/ntosZipcodeFinder.do")
public class ZipcodeFinderController {

	@Inject
	@Named("ntosZipcodeFinder")
	private ZipcodeFinder zipcodeFinder;

	/*@RequestMapping(params = "method=list")
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
	}*/
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Zipcode zipcode, Model model) throws Exception {
		
		Page resultPage = zipcodeFinder.getPagingList(zipcode, pageIndex);

		model.addAttribute("zipcode", zipcode);
		model.addAttribute("zipcodes", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "ntosListZipcode";
	}

	@RequestMapping(params = "method=openWindow")
	public String openWindow(Model model) throws Exception {
		
		model.addAttribute("zipcode", new Zipcode());
		return "ntosListZipcode";
	}

}
