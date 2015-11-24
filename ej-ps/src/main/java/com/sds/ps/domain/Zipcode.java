package com.sds.ps.domain;

import java.io.Serializable;

public class Zipcode extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private String zip1;
	private String zip2;
	private String sido;
	private String gugun;
	private String dong;
	private String bunji;

	public String getZip1() {
		return zip1;
	}

	public void setZip1(String zip1) {
		this.zip1 = zip1;
	}

	public String getZip2() {
		return zip2;
	}

	public void setZip2(String zip2) {
		this.zip2 = zip2;
	}

	public String getSido() {
		return sido;
	}

	public void setSido(String sido) {
		this.sido = sido;
	}

	public String getDong() {
		return dong;
	}

	public void setDong(String dong) {
		this.dong = dong;
	}

	public String getBunji() {
		return bunji;
	}

	public void setBunji(String bunji) {
		this.bunji = bunji;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Zipcode [zip1=");
		builder.append(zip1);
		builder.append(", zip2=");
		builder.append(zip2);
		builder.append(", sido=");
		builder.append(sido);
		builder.append(", gugun=");
		builder.append(gugun);
		builder.append(", dong=");
		builder.append(dong);
		builder.append(", bunji=");
		builder.append(bunji);
		builder.append("]");
		return builder.toString();
	}

	public String getGugun() {
		return gugun;
	}

	public void setGugun(String gugun) {
		this.gugun = gugun;
	}

}
