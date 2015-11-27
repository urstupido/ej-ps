<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="productDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='productDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<script type="text/javascript">
		function updateProductSelect() {
		    document.productSelectForm.action="<c:url value='/ntosProductSelect.do?method=update'/>";
		    document.productSelectForm.submit();
		}
		
		function removeProductSelect(){	
			if(confirmDelete('product select')) {
			    document.productSelectForm.action="<c:url value='/ntosProductSelect.do?method=remove'/>";
			    document.productSelectForm.submit();
			}	    
		}
		
		function goBack(){
			window.history.back();
		}
	</script>
</head>
<!--begin of title-->
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="<c:url value='/sample/images/ct_ttl_img02.gif'/>" width="100%" style="padding-left: 10px;">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">
					Update ProductSelect Information
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<form:form modelAttribute="productSelect" name="productSelectForm" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td"><spring:message code="productSelect.contNo" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="contract.contNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="contract.contNo" cssClass="errors" />
			</td>
			
			<td width="150" class="ct_td"><spring:message code="productSelect.customerName" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				${productSelect.contract.contNameNo}
			</td>
			
		</tr>
		<tr>
			<td height="1" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="150" class="ct_td" > <spring:message code="productSelect.prodNo" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="product.prodNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="product.prodNo" cssClass="errors" />
			</td>
			
			<td width="150" class="ct_td" ><spring:message code="productSelect.prodName" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				${productSelect.product.prodName}
			</td>
		</tr>
		<tr>
			<td height="1" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" ><spring:message code="productSelect.prodSelectDate" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="date" cssClass="ct_input_g" size="40" maxlength="50" value="${productSelect.prodSlctDate}" readonly="true">				
			</td> 
		 	<td width="150" class="ct_td" ><spring:message code="productSelect.prodEndDate" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="date" cssClass="ct_input_g" size="40" maxlength="50" value="${productSelect.prodRelsDate}" readonly="true">
			</td> 
		</tr>
		
	 	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
					<a href="javascript:goBack();"><img src="<c:url value='/sample/images/btn_back.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeProductSelect();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
			</td>
		</tr>
	</table>
	
</form:form>