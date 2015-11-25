package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class CustContract extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;
	
	
	//받아오는 고객번호
	@NotNull 
	@Size(min=1, max = 14)
    private String cusNo = "";
	
	//받아오는 계약번호
	@NotNull
	@Size(min=1, max = 14)
	private String contractNO = "" ;
	
	@NotNull
	@Size(min=1, max = 8)
	private String entrDate = "";

	@NotNull
	@Size(min=1, max = 2)
	private String incoStacC = "";
	
	@NotNull
	@Size(min=1, max = 8)
	private String retrDate = "";
	
	@NotNull
	@Size(min=1, max = 14)
	private String lastChngUsid = "";
	
	@NotNull
	@DateTimeFormat(pattern = "YYYY-MM-DD") //주석처리??
	private Date lastChngDt;

	
	public String getCusNo() {
		return cusNo;
	}

	public void setCusNo(String cusNo) {
		this.cusNo = cusNo;
	}

	public String getContractNO() {
		return contractNO;
	}

	public void setContractNO(String contractNO) {
		this.contractNO = contractNO;
	}

	public String getEntrDate() {
		return entrDate;
	}

	public void setEntrDate(String entrDate) {
		this.entrDate = entrDate;
	}

	public String getIncoStacC() {
		return incoStacC;
	}

	public void setIncoStacC(String incoStacC) {
		this.incoStacC = incoStacC;
	}

	public String getRetrDate() {
		return retrDate;
	}

	public void setRetrDate(String retrDate) {
		this.retrDate = retrDate;
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
		return "CustContract [cusNo=" + cusNo + ", contractNO=" + contractNO
				+ ", entrDate=" + entrDate + ", incoStacC=" + incoStacC
				+ ", retrDate=" + retrDate + ", lastChngUsid=" + lastChngUsid
				+ ", lastChngDt=" + lastChngDt + "]";
	}

	
	
	
	

}
