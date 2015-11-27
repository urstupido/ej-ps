package com.sds.ps.ntos.product.productdistribution.web;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sds.ps.domain.Product;
import com.sds.ps.domain.ProductDistribution;
import com.sds.ps.ntos.product.productdistribution.service.ProductDistributionService;

@Controller("ntosProductDistributionController")
@RequestMapping("/ntosProductDistribution.do")
@SessionAttributes(types = Product.class)
public class ProductDistributionController {

	@Inject
	@Named("ntosProductDistributionService") 
	private ProductDistributionService productDistributionService;

	@RequestMapping(params = "method=update")
	public String update(@Valid @ModelAttribute("productDistributions")List<ProductDistribution> productDistributions, BindingResult results, SessionStatus status) throws Exception {
		
//		System.out.println("######  " + prodDistributionList.size() );
		if (results.hasErrors()) {			
			return "ntosViewProductDistributionFinder";
		}
//		this.productDistributionService.update(productDistribution);
		status.setComplete();
		return "redirect:/ntosProductDistributionFinder.do?method=list";
	}
}
