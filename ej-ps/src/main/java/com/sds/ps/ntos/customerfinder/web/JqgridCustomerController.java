package com.sds.ps.ntos.customerfinder.web;

import java.util.HashMap;
import java.util.Map;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.sds.ps.domain.CodeInfo;
import com.sds.ps.domain.Customer;
import com.sds.ps.ntos.codefinder.service.CodeService;
import com.sds.ps.ntos.customerfinder.service.CustomerFinder;
import com.sds.ps.ntos.customerfinder.service.CustomerService;

import anyframe.common.Page;

@Controller
public class JqgridCustomerController {
	
	@Inject
	@Named("ntosCustomerFinder")
	private CustomerFinder customerFinder;
	
	@Inject
	@Named("ntosCustomerService")
	private CustomerService customerService;
	
	@Inject
	@Named("ntosCodeService")
	private CodeService codeService;
	
	@RequestMapping("/jqgridCustomerFirst.do")
	public String listView(Model model){
		model.addAttribute("customer", new Customer());
		return "jqgridListCustomer";
	}
	
	@ResponseBody
	@RequestMapping("/jqgridCustomerList.do")
	public Map<String, Object> listAjax(
			@ModelAttribute("customer") Customer customer, BindingResult result, Model model) throws Exception {
		if (customer.getCodeInfo() == null) {
			CodeInfo code = new CodeInfo();
			code.setCode("");
			customer.setCodeInfo(code);
		}
		
		Page resultPage = customerFinder.getPagingList(customer);
		
		Map<String, Object> map = new HashMap<>();
		map.put("customer", customer);
		map.put("customers", resultPage.getList());
		map.put("size", resultPage.getTotalCount());
		map.put("pagesize", resultPage.getPagesize());
		map.put("pageunit", resultPage.getPageunit());		
		map.put("resultPage", resultPage);

		return map;
	}
	
}
