package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

public class CustContract extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int no;

	private CodeInfo codeInfo; //

	// 받아오는 고객번호
	@NotNull
	@Size(min = 1, max = 14)
	private String cusNo = "";

	// 고객명
	@NotNull
	@Size(min = 1, max = 50)
	private String cusNameNo = "";

	// 받아오는 계약번호
	@NotNull
	@Size(min = 1, max = 14)
	private String contNo = "";

	@NotNull
	@Size(min = 1, max = 8)
	private String entrDate = "";

	@NotNull
	@Size(min = 1, max = 2)
	private String incoStacC = "";

	@NotNull
	@Size(min = 1, max = 8)
	private String retrDate = "";

	@NotNull
	@Size(min = 1, max = 14)
	private String lastChngUsid = "";

	@NotNull
	// @DateTimeFormat(pattern = "YYYY-MM-DD")
	// 주석처리??
	private Date lastChngDt;

	public int getNo() {
		return no;
	}

	public void setNo(int no) {
		this.no = no;
	}

	public CodeInfo getCodeInfo() {
		return codeInfo;
	}

	public void setCodeInfo(CodeInfo codeInfo) {
		this.codeInfo = codeInfo;
	}

	public String getCusNo() {
		return cusNo;
	}

	public void setCusNo(String cusNo) {
		this.cusNo = cusNo;
	}

	public String getCusNameNo() {
		return cusNameNo;
	}

	public void setCusNameNo(String cusNameNo) {
		this.cusNameNo = cusNameNo;
	}

	public String getContNo() {
		return contNo;
	}

	public void setContNo(String contNo) {
		this.contNo = contNo;
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
		StringBuilder builder = new StringBuilder();
		builder.append("CustContract [no=");
		builder.append(no);
		builder.append(", codeInfo=");
		builder.append(codeInfo);
		builder.append(", cusNo=");
		builder.append(cusNo);
		builder.append(", cusNameNo=");
		builder.append(cusNameNo);
		builder.append(", contNo=");
		builder.append(contNo);
		builder.append(", entrDate=");
		builder.append(entrDate);
		builder.append(", incoStacC=");
		builder.append(incoStacC);
		builder.append(", retrDate=");
		builder.append(retrDate);
		builder.append(", lastChngUsid=");
		builder.append(lastChngUsid);
		builder.append(", lastChngDt=");
		builder.append(lastChngDt);
		builder.append("]");
		return builder.toString();
	}

}
