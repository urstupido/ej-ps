package com.sds.ps.common.web.servlet.view;

import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import net.sf.json.spring.web.servlet.view.JsonView;


public class ConfiguableJsonView extends JsonView {
	private String encoding = "UTF-8";
	private String contentType = "application/json";
	@Override
	protected void writeJSON(@SuppressWarnings("rawtypes") Map model, HttpServletRequest request,
			HttpServletResponse response) throws Exception {
		response.setCharacterEncoding(encoding);
		response.setContentType(contentType);
		super.writeJSON(model, request, response);
	}

	public void setEncoding(String encoding) {
		this.encoding = encoding;
	}

	public void setContentType(String contentType) {
		this.contentType = contentType;
	}


}
