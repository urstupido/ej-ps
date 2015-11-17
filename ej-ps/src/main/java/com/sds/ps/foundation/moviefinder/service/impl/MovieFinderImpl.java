package com.sds.ps.foundation.moviefinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;
import com.sds.ps.domain.Movie;
import com.sds.ps.foundation.moviefinder.service.MovieFinder;

@Service("foundationMovieFinder")
public class MovieFinderImpl implements MovieFinder {

	@Inject
	@Named("foundationMovieDao")
	private MovieDao movieDao;

	public Page getPagingList(Movie movie, int pageIndex) throws Exception {
		return this.movieDao.getPagingList(movie, pageIndex);
	}

	public Page getPagingList(Movie movie) throws Exception {
		return this.movieDao.getPagingList(movie);
	}
}
