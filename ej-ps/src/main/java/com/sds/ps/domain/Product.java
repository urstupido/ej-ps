package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;
import java.util.HashSet;
import java.util.Set;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class Product extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int no;
	
	private Set<Code> codes = new HashSet<Code>(0);
	
	
	@NotNull
	@Size(min = 1, max = 13)
	private String prodNo;


	@NotNull
	@Size(min = 1, max = 60)
	private String prodName;

	@NotNull
	private String prodSellEntrDt;
	
	@NotNull
	private String prodSellEndDt;

//	@NotNull
	@Size(min = 1, max = 3)
	private String maxIvtRto;

//	@NotNull
	@Size(min = 1, max = 1)
	private String delYn;

	@NotNull
	@Size(min = 1, max = 18)
	private String lastChngUsid;

	@NotNull
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date lastChngDt;

	
	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public Set<Code> getCodes() {
		return codes;
	}

	public void setCodes(Set<Code> codes) {
		this.codes = codes;
	}

	public String getProdNo() {
		return prodNo;
	}

	public void setProdNo(String prodNo) {
		this.prodNo = prodNo;
	}

	public String getProdName() {
		return prodName;
	}

	public void setProdName(String prodName) {
		this.prodName = prodName;
	}

	public String getProdSellEntrDt() {
		return prodSellEntrDt;
	}

	public void setProdSellEntrDt(String prodSellEntrDt) {
		this.prodSellEntrDt = prodSellEntrDt;
	}

	public String getProdSellEndDt() {
		return prodSellEndDt;
	}

	public void setProdSellEndDt(String prodSellEndDt) {
		this.prodSellEndDt = prodSellEndDt;
	}

	public String getMaxIvtRto() {
		return maxIvtRto;
	}

	public void setMaxIvtRto(String maxIvtRto) {
		this.maxIvtRto = maxIvtRto;
	}

	public String getDelYn() {
		return delYn;
	}

	public void setDelYn(String delYn) {
		this.delYn = delYn;
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
		builder.append("Product [no=");
		builder.append(no);
		builder.append(", codes=");
		builder.append(codes);
		builder.append(", prodNo=");
		builder.append(prodNo);
		builder.append(", prodName=");
		builder.append(prodName);
		builder.append(", prodSellEntrDt=");
		builder.append(prodSellEntrDt);
		builder.append(", prodSellEndDt=");
		builder.append(prodSellEndDt);
		builder.append(", maxIvtRto=");
		builder.append(maxIvtRto);
		builder.append(", delYn=");
		builder.append(delYn);
		builder.append(", lastChngUsid=");
		builder.append(lastChngUsid);
		builder.append(", lastChngDt=");
		builder.append(lastChngDt);
		builder.append("]");
		return builder.toString();
	}
}
