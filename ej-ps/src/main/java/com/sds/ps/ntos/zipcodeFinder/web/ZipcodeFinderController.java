package com.sds.ps.ntos.zipcodeFinder.web;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;


@Controller("ntosZipcodeFinderController")
@RequestMapping("/ntosZipcodeFinder.do")
public class ZipcodeFinderController {
	@RequestMapping(params = "method=openWindow")
	public String openWindow() throws Exception {
		return "ntosListZipcode";
	}
	
	@RequestMapping(params = "method=List")
	public String list() throws Exception {
		
		return "ntosListZipcode";
	}
}
