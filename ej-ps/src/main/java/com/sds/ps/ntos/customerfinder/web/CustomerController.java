package com.sds.ps.ntos.customerfinder.web;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sds.ntos.customerfinder.service.CustomerService;
import com.sds.ps.domain.Customer;

@Controller("ntosCustomerController")
@RequestMapping("/ntosCustomer.do")
@SessionAttributes(types = Customer.class)
public class CustomerController {

	@Inject
	@Named("ntosCustomerService")
	private CustomerService customerService;
	
	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Customer());
		return "ntosViewCustomer";
	}
	
	@RequestMapping(params = "method=create")
	public String create(@Valid Customer customer, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		if(results.hasErrors()){
			return "ntosViewCustomer";
		}
		
		this.customerService.create(customer);
		status.setComplete();
		
		return "redirect:/ntosCustomerFinder.do?method=list";
	}
	
	@RequestMapping(params = "method=get")
	public String get(@RequestParam("cusNo") String cusNo, Model model) throws Exception {
		Customer customer = this.customerService.get(cusNo);
		if(customer==null){
			throw new Exception("Resource not found " + cusNo);
		}
		
		model.addAttribute(customer);
		return "ntosViewCustomer";
	}
	
	@RequestMapping(params = "method=update")
	public String update(@Valid Customer customer, BindingResult results, SessionStatus status) throws Exception {
		if(results.hasErrors()){
			return "ntosViewCustomer";
		}
		this.customerService.update(customer);
		status.setComplete();
		
		return "redirect:/ntosCustomerFinder.do?method=list";
	}
	
	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("cusNo") String cusNo) throws Exception {
		this.customerService.remove(cusNo);
		return "redirect:/ntosCustomerFinder.do?method=list";
	}
}
