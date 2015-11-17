package com.sds.ps.foundation.moviefinder.service;

import java.util.List;

import com.sds.ps.domain.Genre;

public interface GenreService {
	List<Genre> getList() throws Exception;
}
