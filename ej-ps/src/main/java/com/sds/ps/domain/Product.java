package com.sds.ps.domain;

import java.io.Serializable;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Product extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	// @DecimalMax(value = "180")
	// private Long runtime;

	// @NumberFormat(pattern = "#,###")
	// @Digits(integer=4, fraction=0)
	// private Float ticketPrice;

	@NotNull
	@Size(min = 1, max = 13)
	private String prodNo;

	@NotNull
	@Size(min = 1, max = 60)
	private String prodName;

	@NotNull
	@Size(min = 1, max = 8)
	private String prodSellEntrDt;
	@NotNull
	@Size(min = 1, max = 8)
	private String prodSellEndDt;
	@NotNull
	@Size(min = 1, max = 1)
	private String prodLclsC;

	@NotNull
	@Size(min = 1, max = 3)
	private String prodMclsC;
	@NotNull
	@Size(min = 1, max = 4)
	private String prodSclsC;

	@NotNull
	@Size(min = 1, max = 3)
	private int maxIvtRto;

	@NotNull
	@Size(min = 1, max = 4)
	private String prodOffrOrgC;

	@NotNull
	@Size(min = 1, max = 4)
	private String astsMngOrgC;

	@NotNull
	@Size(min = 1, max = 1)
	private String delYn;

	@NotNull
	@Size(min = 1, max = 18)
	private String lastChngUsid;

	@NotNull
	private String lastChngDt;

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

	public String getProdLclsC() {
		return prodLclsC;
	}

	public void setProdLclsC(String prodLclsC) {
		this.prodLclsC = prodLclsC;
	}

	public String getProdMclsC() {
		return prodMclsC;
	}

	public void setProdMclsC(String prodMclsC) {
		this.prodMclsC = prodMclsC;
	}

	public String getProdSclsC() {
		return prodSclsC;
	}

	public void setProdSclsC(String prodSclsC) {
		this.prodSclsC = prodSclsC;
	}

	public int getMaxIvtRto() {
		return maxIvtRto;
	}

	public void setMaxIvtRto(int maxIvtRto) {
		this.maxIvtRto = maxIvtRto;
	}

	public String getProdOffrOrgC() {
		return prodOffrOrgC;
	}

	public void setProdOffrOrgC(String prodOffrOrgC) {
		this.prodOffrOrgC = prodOffrOrgC;
	}

	public String getAstsMngOrgC() {
		return astsMngOrgC;
	}

	public void setAstsMngOrgC(String astsMngOrgC) {
		this.astsMngOrgC = astsMngOrgC;
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

	public String getLastChngDt() {
		return lastChngDt;
	}

	public void setLastChngDt(String lastChngDt) {
		this.lastChngDt = lastChngDt;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Product [prodNo=");
		builder.append(prodNo);
		builder.append(", prodName=");
		builder.append(prodName);
		builder.append(", prodSellEntrDt=");
		builder.append(prodSellEntrDt);
		builder.append(", prodSellEndDt=");
		builder.append(prodSellEndDt);
		builder.append(", prodLclsC=");
		builder.append(prodLclsC);
		builder.append(", prodMclsC=");
		builder.append(prodMclsC);
		builder.append(", prodSclsC=");
		builder.append(prodSclsC);
		builder.append(", maxIvtRto=");
		builder.append(maxIvtRto);
		builder.append(", prodOffrOrgC=");
		builder.append(prodOffrOrgC);
		builder.append(", astsMngOrgC=");
		builder.append(astsMngOrgC);
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
