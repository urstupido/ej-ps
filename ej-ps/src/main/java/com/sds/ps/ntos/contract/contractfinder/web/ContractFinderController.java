package com.sds.ps.ntos.contract.contractfinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;

import com.sds.ps.domain.Contract;
import com.sds.ps.ntos.contract.contractfinder.service.ContractFinder;

@Controller("ntosContractFinderController")
@RequestMapping("/ntosContractFinder.do")
public class ContractFinderController {

	@Inject
	@Named("ntosContractFinder")
	private ContractFinder contractFinder;
	
	@RequestMapping(params="method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			Contract contract, BindingResult result, Model model) throws Exception {

		Page resultPage = contractFinder.getPagingList(contract, pageSize, pageIndex);
		
		model.addAttribute("contract", contract);
		model.addAttribute("contracts", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);

		System.out.println(resultPage.getList());
		
		return "ntosListContract";
	}
	
	@RequestMapping(params="method=popup")
	public String popupList(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			Contract contract, BindingResult result, Model model) throws Exception {

		Page resultPage = contractFinder.getPagingList(contract, pageSize, pageIndex);

		model.addAttribute("contract", contract);
		model.addAttribute("contracts", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "ntosContractPopup";
	}
}
