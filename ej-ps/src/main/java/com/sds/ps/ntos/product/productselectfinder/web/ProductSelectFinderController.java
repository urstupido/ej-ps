package com.sds.ps.ntos.product.productselectfinder.web;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import anyframe.common.Page;

import com.sds.ps.domain.ProductSelect;
import com.sds.ps.ntos.product.productselectfinder.service.ProductSelectFinder;

@Controller("ntosProductSelectFinderController")
@RequestMapping("/ntosProductSelectFinder.do")
public class ProductSelectFinderController {

	@Inject
	@Named("ntosProductSelectFinder")
	private ProductSelectFinder productSelectFinder;
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			ProductSelect productSelect, BindingResult result, Model model) throws Exception {

		Page resultPage = productSelectFinder.getPagingList(productSelect, pageSize, pageIndex);

		model.addAttribute("productSelect", productSelect);
		model.addAttribute("products", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "ntosListProductSelect";
	}
}
