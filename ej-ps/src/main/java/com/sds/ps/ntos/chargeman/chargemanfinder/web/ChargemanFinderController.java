package com.sds.ps.ntos.chargeman.chargemanfinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;

import com.sds.ps.domain.Chargeman;
import com.sds.ps.ntos.chargeman.chargemanfinder.service.ChargemanFinder;

@Controller("ntosChargemanFinderController")
@RequestMapping("/ntosChargemanFinder.do")
public class ChargemanFinderController {

	@Inject
	@Named("ntosChargemanFinder")
	private ChargemanFinder chargemanFinder;
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			Chargeman chargeman, BindingResult result, Model model) throws Exception {

		Page resultPage = chargemanFinder.getPagingList(chargeman, pageSize, pageIndex);

		model.addAttribute("chargeman", chargeman);
		model.addAttribute("chargemans", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "ntosListChargeman";
	}
}
