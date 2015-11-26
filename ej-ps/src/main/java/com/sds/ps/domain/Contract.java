package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Size;

public class Contract extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	@Size(min = 1, max = 14)
	private String contNo = "";

	private int no;

	private CodeInfo codeInfo;

	@Size(min = 1, max = 60)
	private String contNameNo = "";

	@Size(min = 1, max = 10)
	private String planCode = "";

	@Size(min = 1, max = 10)
	private String contProc = "";

	@Size(min = 1, max = 14)
	private String cusNo = "";
	
	@Size(min = 1, max = 14)
	private String cusName = "";

	@Size(min = 1, max = 1)
	private String planKindC = "";

	@Size(min = 1, max = 8)
	private String planEntrDate = "";

	@Size(min = 1, max = 3)
	private String contProcStatC = "";

	@Size(min = 1, max = 8)
	private String planEndDate = "";

	@Size(min = 1, max = 3)
	private String rsndAccBnkC = "";

	@Size(min = 1, max = 23)
	private String rsndAccNo = "";

	@Size(min = 1, max = 60)
	private String rsndAccDepoNm = "";

	@Size(min = 1, max = 14)
	private String lastChngUsid = "";

	// @DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date lastChngDt;

	public String getContNo() {
		return contNo;
	}

	public void setContNo(String contNo) {
		this.contNo = contNo;
	}

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

	public String getCusName() {
		return cusName;
	}

	public void setCusName(String cusName) {
		this.cusName = cusName;
	}
	
	public String getPlanKindC() {
		return planKindC;
	}

	public void setPlanKindC(String planKindC) {
		this.planKindC = planKindC;
	}

	public String getPlanEntrDate() {
		return planEntrDate;
	}

	public void setPlanEntrDate(String planEntrDate) {
		this.planEntrDate = planEntrDate;
	}

	public String getContProcStatC() {
		return contProcStatC;
	}

	public void setContProcStatC(String contProcStatC) {
		this.contProcStatC = contProcStatC;
	}

	public String getPlanEndDate() {
		return planEndDate;
	}

	public void setPlanEndDate(String planEndDate) {
		this.planEndDate = planEndDate;
	}

	public String getRsndAccBnkC() {
		return rsndAccBnkC;
	}

	public void setRsndAccBnkC(String rsndAccBnkC) {
		this.rsndAccBnkC = rsndAccBnkC;
	}

	public String getRsndAccNo() {
		return rsndAccNo;
	}

	public void setRsndAccNo(String rsndAccNo) {
		this.rsndAccNo = rsndAccNo;
	}

	public String getRsndAccDepoNm() {
		return rsndAccDepoNm;
	}

	public void setRsndAccDepoNm(String rsndAccDepoNm) {
		this.rsndAccDepoNm = rsndAccDepoNm;
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

	public String getContNameNo() {
		return contNameNo;
	}

	public void setContNameNo(String contNameNo) {
		this.contNameNo = contNameNo;
	}

	public String getPlanCode() {
		return planCode;
	}

	public void setPlanCode(String planCode) {
		this.planCode = planCode;
	}

	public String getContProc() {
		return contProc;
	}

	public void setContProc(String contProc) {
		this.contProc = contProc;
	}

	@Override
	public String toString() {
		StringBuilder builder = new StringBuilder();
		builder.append("Contract [contNo=");
		builder.append(contNo);
		builder.append(", no=");
		builder.append(no);
		builder.append(", codeInfo=");
		builder.append(codeInfo);
		builder.append(", contNameNo=");
		builder.append(contNameNo);
		builder.append(", planCode=");
		builder.append(planCode);
		builder.append(", contProc=");
		builder.append(contProc);
		builder.append(", cusNo=");
		builder.append(cusNo);
		builder.append(", planKindC=");
		builder.append(planKindC);
		builder.append(", planEntrDate=");
		builder.append(planEntrDate);
		builder.append(", contProcStatC=");
		builder.append(contProcStatC);
		builder.append(", planEndDate=");
		builder.append(planEndDate);
		builder.append(", rsndAccBnkC=");
		builder.append(rsndAccBnkC);
		builder.append(", rsndAccNo=");
		builder.append(rsndAccNo);
		builder.append(", rsndAccDepoNm=");
		builder.append(rsndAccDepoNm);
		builder.append(", lastChngUsid=");
		builder.append(lastChngUsid);
		builder.append(", lastChngDt=");
		builder.append(lastChngDt);
		builder.append("]");
		return builder.toString();
	}

	
	



}
