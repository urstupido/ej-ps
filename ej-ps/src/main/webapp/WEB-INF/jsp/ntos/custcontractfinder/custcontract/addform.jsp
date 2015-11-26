<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="custcontractDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='custcontractDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<%-- <script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script> --%>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<script type="text/javascript">

		
		function createCustContract() {
	    	document.custcontractForm.action="<c:url value='/ntosCustContract.do?method=create'/>";
	    	document.custcontractForm.submit();
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
				 	Add CustContract Information
				 	<c:set var="readonly" value="false"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="custContract" name="custcontractForm" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="1"> <spring:message code="custcontract.cont_no" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="contNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="contNo" cssClass="errors" />
			</td>
			<td width="150" class="ct_td" colspan="1"> <spring:message code="custcontract.cus_no" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="cusNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="cusNo" cssClass="errors" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		
        <tr>
		 	<td width="150" class="ct_td" colspan="1"><spring:message code="custcontract.inco_stac_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="11">
				<form:select path="incoStacC" id="incoStacC" cssClass="ct_input_g" cssStyle="width:150px;">
					<form:option value="" label="재직상태코드를 선택하세요"/>				
					<form:options items="${incoCodeList}" itemValue="code" itemLabel="codeName"/>
				</form:select>
				<form:errors path="incoStacC" cssClass="errors" />
			</td> 
		 	
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="1"><spring:message code="custcontract.entr_date" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
			    <input type="text" id="entrDate" name="entrDate" value="날짜를 선택하세요" onclick="fnPopUpCalendar(entrDate,entrDate,'yyyymmdd')" class='text_box1'>
			</td> 
		 	<td width="150" class="ct_td" colspan="1"><spring:message code="custcontract.retr_date" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<input type="text" id="retrDate" name="retrDate" value="날짜를 선택하세요" onclick="fnPopUpCalendar(retrDate,retrDate,'yyyymmdd')" class='text_box1'>

			</td>
		</tr>
		
		
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<a id="createlink" href="javascript:createCustContract();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
				<script type="text/javascript">
				    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
				</script>
			</td>
		</tr>
	</table>
</form:form>