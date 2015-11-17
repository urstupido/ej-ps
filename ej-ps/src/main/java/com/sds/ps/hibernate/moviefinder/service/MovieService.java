package com.sds.ps.hibernate.moviefinder.service;

import com.sds.ps.domain.Movie;

public interface MovieService {

	Movie get(String movieId) throws Exception;

	void create(Movie movie) throws Exception;

	void update(Movie movie) throws Exception;

	void remove(String movieId) throws Exception;

}
