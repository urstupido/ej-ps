<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="productDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='productDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<script type="text/javascript">
		function createProduct() {
	    	document.productForm.action="<c:url value='/ntosProduct.do?method=create'/>";
	    	document.productForm.submit();
		}
		
		function selectProdC(obj) {
			if(obj.id=="prodLclsC"){
				document.getElementById("prodMclsC")[0].selected = true;
				document.getElementById("prodSclsC")[0].selected = true;
				
				for (var i = 0; i < document.getElementById("prodMclsC").length; i++) {
					if(obj.value != document.getElementById("prodMclsC")[i].value.substring(0,1)){
						document.getElementById("prodMclsC")[i].style.visibility = "hidden";
					} else {
						document.getElementById("prodMclsC")[i].removeAttribute("style");
					}
				}
				
			} else if(obj.id=="prodMclsC"){
				document.getElementById("prodSclsC")[0].selected = true;
				
				for (var i = 0; i < document.getElementById("prodSclsC").length; i++) {
					if(obj.value != document.getElementById("prodSclsC")[i].value.substring(0,3)){
						document.getElementById("prodSclsC")[i].style.visibility = "hidden";
					} else {
						document.getElementById("prodSclsC")[i].removeAttribute("style");
					}
				}
			}
		}
	</script>
</head>
<!--************************** begin of contents *****************************-->

<!--begin of title-->
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="<c:url value='/sample/images/ct_ttl_img02.gif'/>" width="100%" style="padding-left: 10px;">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">
				 	Add Product Information
				 	<c:set var="readonly" value="false"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="product" name="productForm" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="product.prod_name" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="10">
				<form:input path="prodName" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodName" cssClass="errors" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_lcls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodLclsC" id="prodLclsC" cssClass="ct_input_g" cssStyle="width:120px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="분류를 선택하세요"/>
					<c:forEach items="${codeList}" var="codeInfo" varStatus="status">
					<c:if test="${codeInfo.codeType eq 'PROD_LCLS_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}"/>
					</c:if>
				</c:forEach>
				</form:select>
				<form:errors path="prodLclsC" cssClass="errors" />
				
				
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_mcls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodMclsC" id="prodMclsC" cssClass="ct_input_g" cssStyle="width:120px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="분류를 선택하세요"/>
					<c:forEach items="${codeList}" var="codeInfo" varStatus="status">
					<c:if test="${codeInfo.codeType eq 'PROD_MCLS_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}"/>
					</c:if>
				</c:forEach>
				</form:select>
				<form:errors path="prodMclsC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_scls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodSclsC" id="prodSclsC" cssClass="ct_input_g" cssStyle="width:120px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="분류를 선택하세요"/>				
					<c:forEach items="${codeList}" var="codeInfo" varStatus="status">
					<c:if test="${codeInfo.codeType eq 'PROD_SCLS_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}"/>
					</c:if>
				</c:forEach>
				</form:select>
				<form:errors path="prodSclsC" cssClass="errors" />
			</td> 
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_entr_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			    <input type="date" id="prodSellEntrDt" name="prodSellEntrDt"/>
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_end_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<input type="date" id="prodSellEndDt" name="prodSellEndDt"/>
			</td> 
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_offr_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodOffrOrgC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodOffrOrgC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.asts_mng_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="astsMngOrgC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="astsMngOrgC" cssClass="errors" />
			</td> 
		</tr>
		
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<a id="createlink" href="javascript:createProduct();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
				<script type="text/javascript">
				    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
				</script>
			</td>
		</tr>
	</table>
</form:form>