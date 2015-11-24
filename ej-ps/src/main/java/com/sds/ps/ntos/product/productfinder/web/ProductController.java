package com.sds.ps.ntos.product.productfinder.web;

import java.sql.Date;
import java.util.Collection;

import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;

import com.sds.ps.domain.Code;
import com.sds.ps.domain.Product;
import com.sds.ps.ntos.codefinder.service.CodeService;
import com.sds.ps.ntos.product.productfinder.service.ProductService;

@Controller("ntosProductController")
@RequestMapping("/ntosProduct.do")
@SessionAttributes(types = Product.class)
public class ProductController {

	@Inject
	@Named("ntosProductService") 
	private ProductService productService;

	@Inject
	@Named("ntosCodeService")
	private CodeService codeService;
	
	@ModelAttribute("codeList")
	public Collection<Code> populateGenreList() throws Exception {
		return this.codeService.getList("PROD_LCLS_C");
	}
	
	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Product());
		return "ntosAddProduct";
	}

	@RequestMapping(params = "method=create")
	public String create(@Valid Product product, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		product.setLastChngUsid("test");
		product.setLastChngDt(new Date(0));
		/*if(results.hasErrors()){
			for (ObjectError e : results.getAllErrors()) {
				System.out.println(e.toString());
			}
			return "ntosViewCustomer";
		}*/
		
		this.productService.create(product);
		status.setComplete();
		
		return "redirect:/ntosProductFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("prodNo") String prodNo, Model model)
			throws Exception {
		Product Product = this.productService.get(prodNo);
		if (Product == null) {
			throw new Exception("Resource not found " + prodNo);
		}
		model.addAttribute(Product);

		return "ntosViewProduct";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Product product, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewProduct";
		}
		this.productService.update(product);
		status.setComplete();
		return "redirect:/ntosProductFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("ProductId") String ProductId)
			throws Exception {
		this.productService.remove(ProductId);
		return "redirect:/ntosProductFinder.do?method=list";
	}
}
