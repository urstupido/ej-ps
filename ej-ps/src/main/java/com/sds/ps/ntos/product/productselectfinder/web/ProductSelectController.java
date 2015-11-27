package com.sds.ps.ntos.product.productselectfinder.web;

import java.sql.Date;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sds.ps.domain.Contract;
import com.sds.ps.domain.Product;
import com.sds.ps.domain.ProductSelect;
import com.sds.ps.ntos.product.productselectfinder.service.ProductSelectService;

@Controller("ntosProductSelectController")
@RequestMapping("/ntosProductSelect.do")
@SessionAttributes(types = ProductSelect.class)
public class ProductSelectController {

	@Inject
	@Named("ntosProductSelectService") 
	private ProductSelectService productSelectService;

	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		return "ntosAddProductSelect";
	}

	@RequestMapping(params = "method=create")
	public String create(@Valid ProductSelect productSelect, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		productSelect.setLastChngUsid("test");
		productSelect.setLastChngDt(new Date(0));
		/*if(results.hasErrors()){
			for (ObjectError e : results.getAllErrors()) {
				System.out.println(e.toString());
			}
			return "ntosViewCustomer";
		}*/
		
		this.productSelectService.create(productSelect);
		status.setComplete();
		
		return "redirect:/ntosProductSelectFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(String prodNo, String contNo, Model model)
			throws Exception {
		Contract contract = new Contract();
		contract.setContNo(contNo);
		Product product = new Product();
		product.setProdNo(prodNo);
		ProductSelect productSelect = new ProductSelect();
		productSelect.setContract(contract);
		productSelect.setProduct(product);
		
		ProductSelect ProductSelect = this.productSelectService.get(productSelect);
		
		if (ProductSelect == null) {
			throw new Exception("Resource not found");
		}
		model.addAttribute(ProductSelect);

		return "ntosUpdateProductSelect";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid ProductSelect productSelect, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewProduct";
		}
		
		this.productSelectService.update(productSelect);
		status.setComplete();
		
		return "redirect:/ntosProductSelectFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(ProductSelect productSelect)
			throws Exception {
		this.productSelectService.remove(productSelect);
		return "redirect:/ntosProductFinder.do?method=list";
	}
}
