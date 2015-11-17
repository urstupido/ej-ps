package com.sds.ps.hibernate.moviefinder.service.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.annotation.Resource;
import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.springframework.beans.factory.annotation.Value;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import anyframe.common.Page;
import anyframe.core.hibernate.IDynamicHibernateService;
import com.sds.ps.domain.Movie;

@Repository("hibernateMovieDao")
public class MovieDao extends HibernateDaoSupport {
	@Value("#{contextProperties['pageSize'] ?: 10}")
	int pageSize;

	@Value("#{contextProperties['pageUnit'] ?: 10}")
	int pageUnit;

	@Resource
	IDynamicHibernateService dynamicHibernateService;

	@Inject
	public void setHibernateDaoSessionFactory(SessionFactory sessionFactory) {
		super.setSessionFactory(sessionFactory);
	}

	public void create(Movie movie) throws Exception {
		super.getHibernateTemplate().save(movie);
	}

	public void remove(String movieId) throws Exception {
		super.getHibernateTemplate().delete(this.get(movieId));
	}

	public void update(Movie movie) throws Exception {
		super.getHibernateTemplate().update(movie);
	}

	public Movie get(String movieId) throws Exception {
		return super.getHibernateTemplate().get(Movie.class, movieId);
	}

	@SuppressWarnings("unchecked")
	public Page getPagingList(Movie movie, int pageIndex) throws Exception {
		Object[] args = null;

		if (!"".equals(movie.getTitle())) {
			args = new Object[2];
			args[0] = new Object[] { "nowPlaying", movie.getNowPlaying() };
			args[1] = new Object[] { "title", "%" + movie.getTitle() + "%" };
		} else {
			args = new Object[1];
			args[0] = new Object[] { "nowPlaying", movie.getNowPlaying() };
		}

		List resultList = dynamicHibernateService.findList("findMovieList",
				args, pageIndex, pageSize);
		Long totalSize = (Long) dynamicHibernateService.find("countMovieList",
				args);

		// When domain object is exposed through web service,
		// LazyInitialisationException occurs.
		// To solve this problem, it converts domain object to dto by using
		// Gilead
		// List<Movie> movieList=(List<Movie>)beanManager.clone(resultList);

		Page resultPage = new Page(resultList, pageIndex, totalSize.intValue(),
				pageUnit, pageSize);
		return resultPage;
	}
}
