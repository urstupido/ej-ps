package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductDistribution extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int no;

	@NotNull
	@Size(min = 1, max = 14)
	private String contNo;
	
	@NotNull
	@Size(min = 1, max = 13)
	private String prodNo;
	
	@NotNull
	@Size(min = 1, max = 3)
	private String seq;
	
	@NotNull
	@Size(min = 1, max = 30)
	private String prodName;
	
	@NotNull
	@Size(min = 1, max =3)
	private String maxIvtRto;
	
	@NotNull
	@Size(min = 1, max = 3)
	private String dstrRto;
	
	@NotNull
	@Size(min = 1, max = 8)
	private String dstrRtoRegDt;
	
	@NotNull
	@Size(min = 1, max = 20)
	private String lastChngUsid;
	
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date lastChngDt;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public String getContNo() {
		return contNo;
	}

	public void setContNo(String contNo) {
		this.contNo = contNo;
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public String getSeq() {
		return seq;
	}

	public void setSeq(String seq) {
		this.seq = seq;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getMaxIvtRto() {
		return maxIvtRto;
	}

	public void setMaxIvtRto(String maxIvtRto) {
		this.maxIvtRto = maxIvtRto;
	}

	public String getDstrRto() {
		return dstrRto;
	}

	public void setDstrRto(String dstrRto) {
		this.dstrRto = dstrRto;
	}

	public String getDstrRtoRegDt() {
		return dstrRtoRegDt;
	}

	public void setDstrRtoRegDt(String dstrRtoRegDt) {
		this.dstrRtoRegDt = dstrRtoRegDt;
	}

	public String getLastChngUsid() {
		return lastChngUsid;
	}

	public void setLastChngUsid(String lastChngUsid) {
		this.lastChngUsid = lastChngUsid;
	}

	public Date getLastChngDt() {
		return lastChngDt;
	}

	public void setLastChngDt(Date lastChngDt) {
		this.lastChngDt = lastChngDt;
	}

	public static long getSerialversionuid() {
		return serialVersionUID;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductDistribution [no=");
		builder.append(no);
		builder.append(", contNo=");
		builder.append(contNo);
		builder.append(", prodNo=");
		builder.append(prodNo);
		builder.append(", seq=");
		builder.append(seq);
		builder.append(", prodName=");
		builder.append(prodName);
		builder.append(", maxIvtRto=");
		builder.append(maxIvtRto);
		builder.append(", dstrRto=");
		builder.append(dstrRto);
		builder.append(", dstrRtoRegDt=");
		builder.append(dstrRtoRegDt);
		builder.append(", lastChngUsid=");
		builder.append(lastChngUsid);
		builder.append(", lastChngDt=");
		builder.append(lastChngDt);
		builder.append("]");
		return builder.toString();
	}

	
}
