package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.NotNull;
import javax.validation.constraints.Size;

public class Chargeman extends CommonVo implements Serializable {

	private static final long serialVersionUID = 1L;

	private int no;

	@NotNull
	@Size(min = 1, max = 14)
	private String contNo = "";

	@NotNull
	@Size(min = 1, max = 3)
	private String chmnSeq;

	@NotNull
	@Size(min = 1, max = 60)
	private String chmnNm;

	@NotNull
	@Size(min = 1, max = 60)
	private String chmnDpnm;

	@NotNull
	@Size(min = 1, max = 60)
	private String chmnPsnm;

	@NotNull
	@Size(min = 1, max = 50)
	private String chmnEmail;

	@NotNull
	@Size(min = 1, max = 12)
	private String chmnMnph;

	@NotNull
	@Size(min = 1, max = 13)
	private String chmnRrno;

	@NotNull
	@Size(min = 1, max = 18)
	private String lastChngUsid;

	@NotNull
	// @DateTimeFormat(pattern = "YYYY-MM-DD")
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

	public String getChmnSeq() {
		return chmnSeq;
	}

	public void setChmnSeq(String chmnSeq) {
		this.chmnSeq = chmnSeq;
	}

	public String getChmnNm() {
		return chmnNm;
	}

	public void setChmnNm(String chmnNm) {
		this.chmnNm = chmnNm;
	}

	public String getChmnDpnm() {
		return chmnDpnm;
	}

	public void setChmnDpnm(String chmnDpnm) {
		this.chmnDpnm = chmnDpnm;
	}

	public String getChmnPsnm() {
		return chmnPsnm;
	}

	public void setChmnPsnm(String chmnPsnm) {
		this.chmnPsnm = chmnPsnm;
	}

	public String getChmnEmail() {
		return chmnEmail;
	}

	public void setChmnEmail(String chmnEmail) {
		this.chmnEmail = chmnEmail;
	}

	public String getChmnMnph() {
		return chmnMnph;
	}

	public void setChmnMnph(String chmnMnph) {
		this.chmnMnph = chmnMnph;
	}

	public String getChmnRrno() {
		return chmnRrno;
	}

	public void setChmnRrno(String chmnRrno) {
		this.chmnRrno = chmnRrno;
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
		builder.append("Chargeman [no=");
		builder.append(no);
		builder.append(", contNo=");
		builder.append(contNo);
		builder.append(", chmnSeq=");
		builder.append(chmnSeq);
		builder.append(", chmnNm=");
		builder.append(chmnNm);
		builder.append(", chmnDpnm=");
		builder.append(chmnDpnm);
		builder.append(", chmnPsnm=");
		builder.append(chmnPsnm);
		builder.append(", chmnEmail=");
		builder.append(chmnEmail);
		builder.append(", chmnMnph=");
		builder.append(chmnMnph);
		builder.append(", chmnRrno=");
		builder.append(chmnRrno);
		builder.append(", lastChngUsid=");
		builder.append(lastChngUsid);
		builder.append(", lastChngDt=");
		builder.append(lastChngDt);
		builder.append("]");
		return builder.toString();
	}

}
