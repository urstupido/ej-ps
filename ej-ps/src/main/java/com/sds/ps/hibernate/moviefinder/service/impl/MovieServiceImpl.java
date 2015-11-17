package com.sds.ps.hibernate.moviefinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;
import org.springframework.transaction.annotation.Propagation;
import org.springframework.transaction.annotation.Transactional;

import anyframe.core.idgen.IIdGenerationService;
import com.sds.ps.domain.Movie;
import com.sds.ps.hibernate.moviefinder.service.MovieService;

@Service("hibernateMovieService")
@Transactional(rollbackFor = { Exception.class }, propagation = Propagation.REQUIRED)
public class MovieServiceImpl implements MovieService {

	@Inject
	@Named("idGenerationServiceMovie")
	IIdGenerationService idGenerationService;

	@Inject
	@Named("hibernateMovieDao")
	private MovieDao movieDao;

	public void create(Movie movie) throws Exception {
		movie.setMovieId(idGenerationService.getNextStringId());
		movieDao.create(movie);
	}

	public void remove(String movieId) throws Exception {
		movieDao.remove(movieId);
	}

	public void update(Movie movie) throws Exception {
		movieDao.update(movie);
	}

	public Movie get(String movieId) throws Exception {
		return movieDao.get(movieId);
	}
}
