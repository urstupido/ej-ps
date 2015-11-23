package com.sds.ps.ntos.product.productfinder.web;

import java.util.Collection;

import javax.inject.Inject;
import javax.inject.Named;
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
	private ProductService ProductService;

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
		return "ntosViewProduct";
	}

	/*@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile,
			@Valid Product Product, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		if (results.hasErrors()) {
			return "ntosViewProduct";
		}
		
		System.out.println(results);
		
		if (posterFile != null && !posterFile.getOriginalFilename().equals("")) {
			String pictureName = posterFile.getOriginalFilename();

			String destDir = session.getServletContext().getRealPath(
					"/sample/images/posters/");

			File dirPath = new File(destDir);
			if (!dirPath.exists()) {
				boolean created = dirPath.mkdirs();
				if (!created) {
					throw new Exception(
							"Fail to create a directory for Product image. ["
									+ destDir + "]");
				}
			}
			
			File destination = File
					.createTempFile("file", pictureName, dirPath);

			FileCopyUtils.copy(posterFile.getInputStream(),
					new FileOutputStream(destination));

			Product.setPosterFile("sample/images/posters/"
					+ destination.getName());
		}

		this.ProductService.create(Product);
		status.setComplete();

		return "redirect:/ntosProductFinder.do?method=list";
	}*/

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("prodNo") String prodNo, Model model)
			throws Exception {
		Product Product = this.ProductService.get(prodNo);
		if (Product == null) {
			throw new Exception("Resource not found " + prodNo);
		}
		model.addAttribute(Product);

		return "ntosViewProduct";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Product product, BindingResult results, SessionStatus status) throws Exception {
		System.out.println("=========================================");
		System.out.println(results);
		
		if (results.hasErrors()) {
			return "ntosViewProduct";
		}
		
		System.out.println("=========================================");
		System.out.println(product);
		System.out.println("ㅇㅁㄴ어롬ㄴㅇㄹ");
		this.ProductService.update(product);
		status.setComplete();

		return "redirect:/ntosProductFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("ProductId") String ProductId)
			throws Exception {
		this.ProductService.remove(ProductId);
		return "redirect:/ntosProductFinder.do?method=list";
	}
}
