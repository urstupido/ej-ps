package com.sds.ps.ntos.product.productdistribution.web;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpServletRequest;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
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
	public String update(
			@RequestParam(value = "contNo") List<String> contNo,
			@RequestParam(value = "prodNo") List<String> prodNo,
			@RequestParam(value = "dstrRto") List<String> dstrRto,
			@RequestParam(value = "seq") List<String> seq,
			@RequestParam(value = "dstrRtoRegDt") List<String> dstrRtoRegDt,
			HttpServletRequest request, SessionStatus status) throws Exception {

		
		for (int i = 0; i < dstrRto.size(); i++) {
			ProductDistribution productDistribution = new ProductDistribution();
			productDistribution.setContNo(contNo.get(i));
			productDistribution.setProdNo(prodNo.get(i));
			productDistribution.setDstrRto(dstrRto.get(i));
			productDistribution.setSeq(seq.get(i));
			productDistribution.setDstrRtoRegDt(dstrRtoRegDt.get(i));
			this.productDistributionService.update(productDistribution);
		}

		status.setComplete();
		return "redirect:/ntosProductDistributionFinder.do?method=list";
	}
}