package com.sds.ps.ntos.product.productfinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;

import com.sds.ps.domain.Product;
import com.sds.ps.ntos.product.productfinder.service.ProductFinder;

@Controller("ntosProductFinderController")
@RequestMapping("/ntosProductFinder.do")
public class ProductFinderController {

	@Inject
	@Named("ntosProductFinder")
	private ProductFinder productFinder;
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			Product product, BindingResult result, Model model) throws Exception {

		Page resultPage = productFinder.getPagingList(product, pageSize, pageIndex);

		model.addAttribute("product", product);
		model.addAttribute("products", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "ntosListProduct";
	}
	
	@RequestMapping(params="method=popup")
	public String popupList(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			Product product, BindingResult result, Model model) throws Exception {
		
		Page resultPage = productFinder.getPagingList(product, pageSize, pageIndex);

		model.addAttribute("product", product);
		model.addAttribute("products", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		model.addAttribute("windowName", "popup");
		
		return "ntosProductPopup";
	}
}
