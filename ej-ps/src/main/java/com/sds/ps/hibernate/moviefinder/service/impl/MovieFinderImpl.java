package com.sds.ps.hibernate.moviefinder.service.impl;

import javax.inject.Inject;
import javax.inject.Named;

import org.springframework.stereotype.Service;

import anyframe.common.Page;
import com.sds.ps.domain.Movie;
import com.sds.ps.hibernate.moviefinder.service.MovieFinder;

@Service("hibernateMovieFinder")
public class MovieFinderImpl implements MovieFinder {

	@Inject
	@Named("hibernateMovieDao")
	private MovieDao movieDao;

	public Page getPagingList(Movie movie, int pageIndex) throws Exception {
		return this.movieDao.getPagingList(movie, pageIndex);
	}
}
