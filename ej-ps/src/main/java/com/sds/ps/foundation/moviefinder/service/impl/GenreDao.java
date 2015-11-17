package com.sds.ps.foundation.moviefinder.service.impl;

import java.util.List;

import javax.inject.Inject;

import org.springframework.stereotype.Repository;

import anyframe.core.query.AbstractDAO;
import anyframe.core.query.IQueryService;
import com.sds.ps.domain.Genre;

@Repository("foundationGenreDao")
public class GenreDao extends AbstractDAO {

	@Inject
	public void setQueryService(IQueryService queryService) {
		super.setQueryService(queryService);
	}

	@SuppressWarnings("unchecked")
	public List<Genre> getList() throws Exception {
		return (List<Genre>) this.findList("Genre", new Object[] {});
	}

}
