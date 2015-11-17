package com.sds.ps.hibernate.moviefinder.web;

import java.io.File;
import java.io.FileOutputStream;
import java.util.Collection;

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
import org.springframework.web.bind.support.SessionStatus;
import org.springframework.web.multipart.MultipartFile;

import com.sds.ps.domain.Genre;
import com.sds.ps.domain.Movie;
import com.sds.ps.hibernate.moviefinder.service.GenreService;
import com.sds.ps.hibernate.moviefinder.service.MovieService;

@Controller("hibernateMovieController")
@RequestMapping("/hibernateMovie.do")
public class MovieController {

	@Inject
	@Named("hibernateMovieService")
	private MovieService movieService;

	@Inject
	@Named("hibernateGenreService")
	private GenreService genreService;

	@ModelAttribute("genreList")
	public Collection<Genre> populateGenreList() throws Exception {
		return this.genreService.getList();
	}

	@RequestMapping(params = "method=createView")
	public String createView(Model model) throws Exception {
		model.addAttribute(new Movie());
		return "hibernateViewMovie";
	}

	@RequestMapping(params = "method=create")
	public String create(
			@RequestParam(value = "realPosterFile", required = false) MultipartFile posterFile,
			@Valid Movie movie, BindingResult results, SessionStatus status, HttpSession session)
			throws Exception {
		
		if (results.hasErrors()) {
			return "foundationViewMovie";
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
							"Fail to create a directory for movie poster. ["
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
		status.setComplete();

		return "redirect:/hibernateMovieFinder.do?method=list";
	}

	@RequestMapping(params = "method=get")
	public String get(@RequestParam("movieId") String movieId, Model model)
			throws Exception {
		Movie movie = this.movieService.get(movieId);
		if (movie == null) {
			throw new Exception("Resource not found " + movieId);
		}
		model.addAttribute(movie);

		return "hibernateViewMovie";
	}

	@RequestMapping(params = "method=update")
	public String update(@Valid Movie movie, BindingResult results, 
			SessionStatus status) throws Exception {
		
		if (results.hasErrors()) {
			return "foundationViewMovie";
		}
		
		this.movieService.update(movie);
		status.setComplete();

		return "redirect:/hibernateMovieFinder.do?method=list";
	}

	@RequestMapping(params = "method=remove")
	public String remove(@RequestParam("movieId") String movieId)
			throws Exception {
		this.movieService.remove(movieId);
		return "redirect:/hibernateMovieFinder.do?method=list";
	}
}
