package com.sds.ps.ntos.custcontract.custcontractfinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;

import com.sds.ps.domain.CustContract;
import com.sds.ps.ntos.custcontract.custcontractfinder.service.CustContractFinder;

@Controller("ntosCustContractFinderController")
@RequestMapping("/ntosCustContractFinder.do")
public class CustContractFinderController {

	@Inject
	@Named("ntosCustContractFinder")
	private CustContractFinder custContractFinder;
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			CustContract custContract, BindingResult result, Model model) throws Exception {

		Page resultPage = custContractFinder.getPagingList(custContract, pageSize, pageIndex);

		model.addAttribute("custContract", custContract);
		model.addAttribute("custContracts", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		
		
		return "ntosListCustContract";
	}
}
