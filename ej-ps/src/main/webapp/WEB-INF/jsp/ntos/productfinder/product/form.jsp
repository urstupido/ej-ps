<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="productDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='productDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">            
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript">
	function createProduct() {
	    document.productForm.action="<c:url value='/ntosProduct.do?method=create'/>";
	    document.productForm.submit();
	}
	
	function updateProduct() {
	    document.productForm.action="<c:url value='/ntosProduct.do?method=update'/>";
	    document.productForm.submit();
	}
	
	function removeProduct(){	
		if(confirmDelete('product')) {
		    document.productForm.action="<c:url value='/ntosProduct.do?method=remove'/>";
		    document.productForm.submit();
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
				 	<c:if test="${empty product.prodNo}">
				 	Add Product Information
				 	<c:set var="readonly" value="false"/>
					</c:if>
			
				    <c:if test="${not empty product.prodNo}">	
					Update Product Information
					<c:set var="readonly" value="true"/>				 
					</c:if>					
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="product" name="productForm" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="product.prod_no" /> &nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="10">
				<form:input path="prodNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="prodNo" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="product.prod_name" /> </td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="10">
				<form:input path="prodName" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodName" cssClass="errors" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_lcls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodLclsC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodLclsC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_mcls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodMclsC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodMclsC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_scls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodSclsC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodSclsC" cssClass="errors" />
			</td> 
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_entr_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodSellEntrDt" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodSellEntrDt" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_end_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="prodSellEndDt" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodSellEndDt" cssClass="errors" />
			</td> 
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_offr_org_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodOffrOrgC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodOffrOrgC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.asts_mng_org_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="astsMngOrgC" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="astsMngOrgC" cssClass="errors" />
			</td> 
		</tr>
		
		<tr>
			<td height="25" colspan="3" ></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="12">최종변경정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.last_chng_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="lastChngDt" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="lastChngDt" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.last_chng_usid" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="lastChngUsid" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="lastChngUsid" cssClass="errors" />
			</td> 
		</tr>
		

		
<%-- 		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.userTc" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<form:select path="genre.genreId">
            	<form:options items="${genreList}" itemValue="genreId" itemLabel="name"/>
          	</form:select>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.rbno" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<c:choose>
				<c:when test="${customer.userTc eq 2}">
				<td class="ct_write01">
				<form:hidden path="rbno" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="rbno" cssClass="errors" />
				<input type="text" value="${fn:substring(customer.rbno,0,6)}" id="rbno1" readonly="readonly"> -
				<input type="text" value="${fn:substring(customer.rbno,6,13)}" id="rbno2" readonly="readonly">
				</td>
				</c:when>
				<c:otherwise>
				<td class="ct_write01">
				<form:hidden path="rbno" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="rbno" cssClass="errors" />
				<input type="text" value="${fn:substring(customer.rbno,0,3)}" id="rbno1" readonly="readonly"> -
				<input type="text" value="${fn:substring(customer.rbno,3,5)}" id="rbno2" readonly="readonly"> -
				<input type="text" value="${fn:substring(customer.rbno,5,10)}" id="rbno3" readonly="readonly">
				</td>
				</c:otherwise>
			</c:choose>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td rowspan="5" class="ct_td">우편물 수령지</td>
			<td width="150" class="ct_td"><spring:message code="customer.psno" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:hidden path="psno" cssClass="ct_input_g" cssErrorClass="text medium error" size="10" maxlength="3" /> <form:errors path="psno" cssClass="errors" />
				<input type="text" value="${fn:substring(customer.psno,0,3)}"> - 
				<input type="text" value="${fn:substring(customer.psno,3,6)}">
				<input type="button" value="우편번호 찾기">
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.addr" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="addr" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="10" />
				<form:errors path="addr" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.dongBlwAddr" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="dongBlwAddr" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="10" />
				<form:errors path="dongBlwAddr" cssClass="errors" />
			</td>
		</tr>
	</table>
	<br><br>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" colspan="7">최종변경정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.lastChngUsid"/></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${customer.lastChngUsid}</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td width="150" class="ct_td"><spring:message code="customer.lastChngDt"/></td>
			<td bgcolor="D6D6D6" width="1"></td><td class="ct_write01">${customer.lastChngDt}
			</td>
		</tr>
	</table> --%>
	<!--begin of button-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty product.prodNo}">
					<a id="createlink" href="javascript:createProduct();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
				</c:if>
				<c:if test="${not empty product.prodNo}">
					<a id="updatelink" href="javascript:updateProduct();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeProduct();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
			</td>
		</tr>
	</table>
</form:form>