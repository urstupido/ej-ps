package com.sds.ps.hibernate.moviefinder.service.impl;

import java.util.List;

import javax.annotation.PostConstruct;
import javax.inject.Inject;

import org.hibernate.SessionFactory;
import org.springframework.orm.hibernate3.support.HibernateDaoSupport;
import org.springframework.stereotype.Repository;

import com.sds.ps.domain.Genre;

@Repository("hibernateGenreDao")
public class GenreDao extends HibernateDaoSupport {
	@Inject
	private SessionFactory sessionFactory;

	@PostConstruct
	public void initialize() {
		super.setSessionFactory(sessionFactory);
	}

	@SuppressWarnings("unchecked")
	public List<Genre> getList() throws Exception {
		return (List) this.getHibernateTemplate().findByNamedQuery(
				"findGenreList");
	}

}
