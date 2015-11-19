package com.sds.ps.domain;

import java.io.Serializable;
import java.sql.Date;

import javax.validation.constraints.Size;

import org.springframework.format.annotation.DateTimeFormat;

import com.sun.istack.internal.NotNull;

public class Customer extends CommonVo implements Serializable{
	
	private static final long serialVersionUID = 1L;
	
	private String cus_no;
	
	@NotNull
	private char user_tc;
	
	@NotNull
	@Size(min=1, max = 50)
	private String pbno = "";

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
	private String dong_blw_addr = "";
	
	@NotNull
	@Size(min=1, max = 50)
	private String last_chng_usid = "";
	
	@NotNull
	@DateTimeFormat(pattern = "YYYY-MM-DD")
	private Date last_chng_dt;

	public String getCus_no() {
		return cus_no;
	}

	public void setCus_no(String cus_no) {
		this.cus_no = cus_no;
	}

	public char getUser_tc() {
		return user_tc;
	}

	public void setUser_tc(char user_tc) {
		this.user_tc = user_tc;
	}

	public String getPbno() {
		return pbno;
	}

	public void setPbno(String pbno) {
		this.pbno = pbno;
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

	public String getDong_blw_addr() {
		return dong_blw_addr;
	}

	public void setDong_blw_addr(String dong_blw_addr) {
		this.dong_blw_addr = dong_blw_addr;
	}

	public String getLast_chng_usid() {
		return last_chng_usid;
	}

	public void setLast_chng_usid(String last_chng_usid) {
		this.last_chng_usid = last_chng_usid;
	}

	public Date getLast_chng_dt() {
		return last_chng_dt;
	}

	public void setLast_chng_dt(Date last_chng_dt) {
		this.last_chng_dt = last_chng_dt;
	}

	@Override
	public String toString() {
		return "Customer [cus_no=" + cus_no + ", user_tc=" + user_tc
				+ ", pbno=" + pbno + ", cnm=" + cnm + ", psno=" + psno
				+ ", addr=" + addr + ", dong_blw_addr=" + dong_blw_addr
				+ ", last_chng_usid=" + last_chng_usid + ", last_chng_dt="
				+ last_chng_dt + "]";
	}
}
