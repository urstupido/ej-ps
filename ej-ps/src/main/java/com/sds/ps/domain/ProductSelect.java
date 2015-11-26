package com.sds.ps.domain;

import java.io.Serializable;
import java.util.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class ProductSelect extends CommonVo implements Serializable {
	private static final long serialVersionUID = 1L;
	
	private Contract contract;
	private Product product;
	
	@NotNull
	@Size(min = 8, max = 8)
	private String prodSlctDate;
	
	@NotNull
	@Size(min = 8, max = 8)
	private String prodRelsDate;
	
	@NotNull
	@Size(min = 1, max = 14)
	private String lastChngUsid;
	
	@NotNull
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date lastChngDt;

	public String getProdSlctDate() {
		return prodSlctDate;
	}

	public void setProdSlctDate(String prodSlctDate) {
		this.prodSlctDate = prodSlctDate;
	}

	public String getProdRelsDate() {
		return prodRelsDate;
	}

	public void setProdRelsDate(String prodRelsDate) {
		this.prodRelsDate = prodRelsDate;
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

	public Contract getContract() {
		return contract;
	}

	public void setContract(Contract contract) {
		this.contract = contract;
	}

	public Product getProduct() {
		return product;
	}

	public void setProduct(Product product) {
		this.product = product;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("ProductSelect [contract=");
		builder.append(contract);
		builder.append(", product=");
		builder.append(product);
		builder.append(", prodSlctDate=");
		builder.append(prodSlctDate);
		builder.append(", prodRelsDate=");
		builder.append(prodRelsDate);
		builder.append(", lastChngUsid=");
		builder.append(lastChngUsid);
		builder.append(", lastChngDt=");
		builder.append(lastChngDt);
		builder.append("]");
		return builder.toString();
	}
	
}
