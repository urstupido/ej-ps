package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.sun.istack.internal.NotNull;

public class Customer extends CommonVo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String cusNo;
	
	@NotNull
	private char userTc;
	
	@NotNull
	@Size(min=1, max = 50)
	private String rbno = "";

	@NotNull
	@Size(min=1, max = 50)
	private String cnm = "";
	
	@NotNull
	@Size(min=1, max = 50)
	private String psno = "";
	
	@NotNull
	@Size(min=1, max = 150)
	private String addr = "";

	@NotNull
	@Size(min=1, max = 50)
	private String dongBlwAddr = "";
	
	@NotNull
	@Size(min=1, max = 50)
	private String lastChngUsid = "";
	
	@NotNull
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date lastChngDt;


	public String getCusNo() {
		return cusNo;
	}



	public void setCusNo(String cusNo) {
		this.cusNo = cusNo;
	}



	public char getUserTc() {
		return userTc;
	}



	public void setUserTc(char userTc) {
		this.userTc = userTc;
	}



	public String getRbno() {
		return rbno;
	}



	public void setRbno(String rbno) {
		this.rbno = rbno;
	}



	public String getCnm() {
		return cnm;
	}



	public void setCnm(String cnm) {
		this.cnm = cnm;
	}



	public String getPsno() {
		return psno;
	}



	public void setPsno(String psno) {
		this.psno = psno;
	}



	public String getAddr() {
		return addr;
	}



	public void setAddr(String addr) {
		this.addr = addr;
	}



	public String getDongBlwAddr() {
		return dongBlwAddr;
	}



	public void setDongBlwAddr(String dongBlwAddr) {
		this.dongBlwAddr = dongBlwAddr;
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
		return "Customer [cus_no=" + cusNo + ", user_tc=" + userTc
				+ ", pbno=" + rbno + ", cnm=" + cnm + ", psno=" + psno
				+ ", addr=" + addr + ", dong_blw_addr=" + dongBlwAddr
				+ ", last_chng_usid=" + lastChngUsid + ", last_chng_dt="
				+ lastChngDt + "]";
	}
}
