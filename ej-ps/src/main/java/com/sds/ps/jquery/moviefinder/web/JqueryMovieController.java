package com.sds.ps.jquery.moviefinder.web;

import java.io.File;
import java.io.FileOutputStream;

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
import org.springframework.web.multipart.MultipartFile;

import anyframe.common.Page;

import com.sds.ps.domain.Movie;
import com.sds.ps.foundation.moviefinder.service.GenreService;
import com.sds.ps.foundation.moviefinder.service.MovieFinder;
import com.sds.ps.foundation.moviefinder.service.MovieService;

@Controller
public class JqueryMovieController {

	@Inject
	@Named("foundationMovieService")
	private MovieService movieService;
	
	@Inject
	@Named("foundationMovieFinder")
	private MovieFinder movieFinder;

	@Inject
	@Named("foundationGenreService")
	private GenreService genreService;
	
	@RequestMapping("/jqueryMovieCreateView.do")
	public String createView(Model model) throws Exception {
		model.addAttribute("movieAdd", new Movie());
		model.addAttribute("genreList", genreService.getList());
		return "jqueryViewMovie";
	}
	
	@RequestMapping("/jqueryMovieUpdateView.do")
	public String updateView(Model model, @RequestParam("movieId") String movieId, @ModelAttribute("movieAdd") Movie searchCondition) throws Exception {
		Movie movie = movieService.get(movieId);
		model.addAttribute("movieAdd", movie);
		model.addAttribute("genreList", genreService.getList());
		return "jqueryViewMovie";
	}
	
	@RequestMapping("/jqueryMovieCreate.do")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile, Model model,
			@ModelAttribute("movieAdd") @Valid Movie movie, BindingResult results, HttpSession session)
			throws Exception {
		if (results.hasErrors()) {
			model.addAttribute("error", "error");
			return "jsonView";
		}
		
		if (posterFile != null && !posterFile.getOriginalFilename().equals("")) {
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
		}

		this.movieService.create(movie);

		return "redirect:/jqueryMovieList.do";
	}
	
	@RequestMapping("/jqueryMovieUpdate.do")
	public String update( Model model,
			@ModelAttribute("movieAdd") @Valid Movie movie, BindingResult results) throws Exception {
		if (results.hasErrors()) {
			return "jqueryViewMovie";
		}
		
		this.movieService.update(movie);

		return "redirect:/jqueryMovieList.do";
	}
	
	@RequestMapping("/jqueryMovieDelete.do")
	public String remove(@RequestParam("movieId") String movieId)
			throws Exception {
		this.movieService.remove(movieId);
		return "redirect:/jqueryMovieList.do";
	}
	
	@RequestMapping("/jqueryMovieList.do")
	public String listView(Model model){
		model.addAttribute("movie", new Movie());
		return "jqueryListMovie";
	}
	
	@RequestMapping("/jqueryMovieListAjax.do")
	public String listAjax(
			@ModelAttribute("movie") Movie movie, BindingResult result, Model model) throws Exception {

		Page resultPage = movieFinder.getPagingList(movie);

		model.addAttribute("movie", movie);
		model.addAttribute("movies", resultPage.getList());
		model.addAttribute("size", resultPage.getTotalCount());
		model.addAttribute("pagesize", resultPage.getPagesize());
		model.addAttribute("pageunit", resultPage.getPageunit());
		model.addAttribute("resultPage", resultPage);

		return "jsonView";
	}
	
}
