package com.sds.ps.foundation.moviefinder.service;

import anyframe.common.Page;
import com.sds.ps.domain.Movie;

public interface MovieFinder {
	Page getPagingList(Movie movie, int pageIndex) throws Exception;
	
	Page getPagingList(Movie movie) throws Exception;
}
