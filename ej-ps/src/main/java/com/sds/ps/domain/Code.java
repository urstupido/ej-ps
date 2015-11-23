package com.sds.ps.domain;

import java.io.Serializable;
import java.util.HashSet;
import java.util.Set;

public class Code implements Serializable {

	private static final long serialVersionUID = 1L;

	private String codeType;
	private String code = "";
	private String codeName;
	private Set<Customer> customers = new HashSet<Customer>(0);

	public String getCodeType() {
		return codeType;
	}

	public void setCodeType(String codeType) {
		this.codeType = codeType;
	}

	public String getCode() {
		return code;
	}

	public void setCode(String code) {
		this.code = code;
	}

	public String getCodeName() {
		return codeName;
	}

	public void setCodeName(String codeName) {
		this.codeName = codeName;
	}

	@Override
	public String toString() {
		return "Code [codeType=" + codeType + ", code=" + code + ", codeName="
				+ codeName + "]";
	}

	public Set<Customer> getCustomers() {
		return customers;
	}

	public void setCustomers(Set<Customer> customers) {
		this.customers = customers;
	}

}
