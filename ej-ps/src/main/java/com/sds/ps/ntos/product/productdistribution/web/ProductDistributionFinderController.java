package com.sds.ps.ntos.product.productdistribution.web;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.support.SessionStatus;

import anyframe.common.Page;

import com.sds.ps.domain.Product;
import com.sds.ps.domain.ProductDistribution;
import com.sds.ps.ntos.product.productdistribution.service.ProductDistributionFinder;

@Controller("ntosProductDistributionFinderController")
@RequestMapping("/ntosProductDistributionFinder.do")
public class ProductDistributionFinderController {

	@Inject
	@Named("ntosProductDistributionFinder")
	private ProductDistributionFinder productDistributionFinder;
	
	@RequestMapping(params = "method=list")
	public String list(
			@RequestParam(value = "pageIndex", defaultValue = "1") int pageIndex,
			@RequestParam(value = "pageSize", defaultValue = "10") int pageSize,
			ProductDistribution productDistribution, BindingResult result, Model model) throws Exception {

		Page resultPage = productDistributionFinder.getPagingList(productDistribution, pageSize, pageIndex);

		model.addAttribute("productDistribution", productDistribution);
		model.addAttribute("productDistributions", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);
		
		return "ntosListProductDistribution";
	}
}
