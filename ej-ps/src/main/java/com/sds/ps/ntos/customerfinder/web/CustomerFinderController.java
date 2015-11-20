package com.sds.ps.ntos.customerfinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;

import com.sds.ntos.customerfinder.service.CustomerFinder;
import com.sds.ps.domain.Customer;

@Controller("ntosCustomerFinderController")
@RequestMapping("/ntosCustomerFinder.do")
public class CustomerFinderController {

	@Inject
	@Named("ntosCustomerFinder")
	private CustomerFinder customerFinder;
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			Customer customer, BindingResult result, Model model) throws Exception {
		Page resultPage = customerFinder.getPagingList(customer, pageIndex);
		
		model.addAttribute("customer", customer);
		model.addAttribute("customers", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());		
		model.addAttribute("resultPage", resultPage);
		
		return "customerListView";
	}
}
