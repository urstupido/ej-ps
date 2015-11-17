package com.sds.ps.hibernate.moviefinder.service.impl;

import java.util.List;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import com.sds.ps.domain.Genre;
import com.sds.ps.hibernate.moviefinder.service.GenreService;

@Service("hibernateGenreService")
public class GenreServiceImpl implements GenreService {

	@Inject
	@Named("hibernateGenreDao")
	private GenreDao genreDao;

	public List<Genre> getList() throws Exception {
		return genreDao.getList();
	}

}
