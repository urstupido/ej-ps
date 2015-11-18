package com.sds.ps.domain;

import java.io.Serializable;

import javax.validation.constraints.DecimalMax;
import javax.validation.constraints.Digits;
import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.NumberFormat;

public class Product extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	private String movieId;

	@NotNull
	@Size(min = 1, max = 50)
	private String title = "";
	
	@NotNull
	@Size(min = 1, max = 50)
	private String director;
	
	private Genre genre;

	@NotNull
	@Size(min = 5, max = 100)
	private String actors;

	@DecimalMax(value = "180")
	private Long runtime;
		
	private String releaseDate;
	
	@NumberFormat(pattern = "#,###")
	@Digits(integer=4, fraction=0)
	private Float ticketPrice;

	private String posterFile;

	private String nowPlaying = "Y";

	public String getMovieId() {
		return movieId;
	}

	public void setMovieId(String movieId) {
		this.movieId = movieId;
	}

	public String getTitle() {
		return title;
	}

	public void setTitle(String title) {
		this.title = title;
	}

	public String getDirector() {
		return director;
	}

	public void setDirector(String director) {
		this.director = director;
	}

	public Genre getGenre() {
		return genre;
	}

	public void setGenre(Genre genre) {
		this.genre = genre;
	}

	public String getReleaseDate() {
		return releaseDate;
	}

	public void setReleaseDate(String releaseDate) {
		this.releaseDate = releaseDate;
	}

	public Float getTicketPrice() {
		return ticketPrice;
	}

	public void setTicketPrice(Float ticketPrice) {
		this.ticketPrice = ticketPrice;
	}

	public String getActors() {
		return actors;
	}

	public void setActors(String actors) {
		this.actors = actors;
	}

	public Long getRuntime() {
		return runtime;
	}

	public void setRuntime(Long runtime) {
		this.runtime = runtime;
	}

	public String getNowPlaying() {
		return nowPlaying;
	}

	public void setNowPlaying(String nowPlaying) {
		this.nowPlaying = nowPlaying;
	}

	public String getPosterFile() {
		return posterFile;
	}

	public void setPosterFile(String posterFile) {
		this.posterFile = posterFile;
	}
	
	@Override
	public String toString() {
		String genreId = "";
		if (genre != null) {
			genreId = genre.getGenreId();
		}
		return "[actors=" + actors + ", director=" + director + ", movieId="
				+ movieId + ", nowPlaying=" + nowPlaying + ", \nposterFile="
				+ posterFile + ", releaseDate=" + releaseDate + ", runtime="
				+ runtime + ", ticketPrice=" + ticketPrice + ", \ntitle="
				+ title + ", genreId=" + genreId + "]";
	}	
}
