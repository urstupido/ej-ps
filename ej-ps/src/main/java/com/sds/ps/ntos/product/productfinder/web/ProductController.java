package com.sds.ps.ntos.product.productfinder.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Collection;

import com.sds.ps.ntos.product.productfinder.service.ProductService;
import javax.inject.Inject;
import javax.inject.Named;
import javax.servlet.http.HttpSession;
import javax.validation.Valid;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.validation.BindingResult;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.SessionAttributes;
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.sds.ps.domain.Product;

@Controller("ntosProductController")
@RequestMapping("/ntosProduct.do")
@SessionAttributes(types = Product.class)
public class ProductController {
	
	

	@Inject
	@Named("ntosProductService") 
	private ProductService ProductService;

	/*@Inject
	@Named("ntosGenreService")
	private GenreService genreService;

	@ModelAttribute("genreList")
	public Collection<Genre> populateGenreList() throws Exception {
		return this.genreService.getList();
	}*/

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
	public String get(@RequestParam("productNo") String productNo, Model model)
			throws Exception {
		Product Product = this.ProductService.get(productNo);
		if (Product == null) {
			throw new Exception("Resource not found " + productNo);
		}
		model.addAttribute(Product);

		return "ntosViewProduct";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Product Product, BindingResult results, SessionStatus status) throws Exception {
		if (results.hasErrors()) {
			return "ntosViewProduct";
		}
		
		this.ProductService.update(Product);
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