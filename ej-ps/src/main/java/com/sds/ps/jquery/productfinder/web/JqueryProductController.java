package com.sds.ps.jquery.productfinder.web;

import java.io.File;
import java.io.FileOutputStream;

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
import org.springframework.web.multipart.MultipartFile;

import anyframe.common.Page;

import com.sds.ps.domain.Product;
import com.sds.ps.ntos.product.productfinder.service.ProductFinder;
import com.sds.ps.ntos.product.productfinder.service.ProductService;

@Controller
public class JqueryProductController {

	@Inject
	@Named("ntosProductService") 
	private ProductService productService;
	
	@Inject
	@Named("ntosProductFinder") 
	private ProductFinder productFinder;

	/*@Inject
	@Named("foundationGenreService")
	private GenreService genreService;
	
	@RequestMapping("/jqueryMovieCreateView.do")
	public String createView(Model model) throws Exception {
		model.addAttribute("movieAdd", new Movie());
		model.addAttribute("genreList", genreService.getList());
		return "jqueryViewMovie";
	}
	
	@RequestMapping("/jqueryMovieUpdateView.do")
	public String updateView(Model model, @RequestParam("prod_no") String prod_no, @ModelAttribute("movieAdd") Movie searchCondition) throws Exception {
		Movie movie = movieService.get(prod_no);
		model.addAttribute("movieAdd", movie);
		model.addAttribute("genreList", genreService.getList());
		return "jqueryViewMovie";
	}*/
	
	@RequestMapping("/jqueryProductCreate.do")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile, Model model,
			@ModelAttribute("productAdd") @Valid Product product, BindingResult results, HttpSession session)
			throws Exception {
		if (results.hasErrors()) {
			model.addAttribute("error", "error");
			return "jsonView";
		}
		
		/*if (posterFile != null && !posterFile.getOriginalFilename().equals("")) {
			String pictureName = posterFile.getOriginalFilename();

			String destDir = session.getServletContext().getRealPath(
					"/sample/images/posters/");

			File dirPath = new File(destDir);
			if (!dirPath.exists()) {
				boolean created = dirPath.mkdirs();
				if (!created) {
					throw new Exception(
							"Fail to create a directory for movie image. ["
									+ destDir + "]");
				}
			}
			
			File destination = File
					.createTempFile("file", pictureName, dirPath);

			FileCopyUtils.copy(posterFile.getInputStream(),
					new FileOutputStream(destination));

			movie.setPosterFile("sample/images/posters/"
					+ destination.getName());
		}*/

		this.productService.create(product);

		return "redirect:/jqueryProductList.do";
	}
	
	@RequestMapping("/jqueryProductUpdate.do")
	public String update( Model model,
			@ModelAttribute("productAdd") @Valid Product product, BindingResult results) throws Exception {
		if (results.hasErrors()) {
			return "jqueryViewProduct";
		}
		
		this.productService.update(product);

		return "redirect:/jqueryProductList.do";
	}
	
	@RequestMapping("/jqueryProductDelete.do")
	public String remove(@RequestParam("prod_no") String prod_no)
			throws Exception {
		this.productService.remove(prod_no);
		return "redirect:/jqueryProductList.do";
	}
	
	@RequestMapping("/jqueryProductList.do")
	public String listView(Model model){
		model.addAttribute("product", new Product());
		return "jqueryListProduct";
	}
	
	@RequestMapping("/jqueryProductListAjax.do")
	public String listAjax(
			@ModelAttribute("product") Product product, BindingResult result, Model model) throws Exception {

		Page resultPage = productFinder.getPagingList(product);

		model.addAttribute("product", product);
		model.addAttribute("products", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);

		return "jsonView";
	}
	
}
