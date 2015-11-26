<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="custcontractDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='custcontractDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<script type="text/javascript">

		
		function createCustContract() {
	    	document.custcontractForm.action="<c:url value='/ntosCustContract.do?method=create'/>";
	    	document.custcontractForm.submit();
		}
		
        function selectProdC(obj) {
			
			
			if(obj.id=="prodLclsC"){
				document.getElementById("prodMclsC")[0].selected = true;
				document.getElementById("prodSclsC")[0].selected = true;
				
				for (var i = 1; i < document.getElementById("prodMclsC").length; i++) {
					document.getElementById("prodMclsC")[i].hidden = "hidden";
										
					if(obj.value == document.getElementById("prodMclsC")[i].value.substring(0,1)){
						document.getElementById("prodMclsC")[i].removeAttribute("hidden");
					} 
				}
				
				for (var i = 1; i < document.getElementById("prodSclsC").length; i++) {
					document.getElementById("prodSclsC")[i].hidden = "hidden";
				}
				
			} else if(obj.id=="prodMclsC"){
				document.getElementById("prodSclsC")[0].selected = true;
				
				for (var i = 1; i < document.getElementById("prodSclsC").length; i++) {
					document.getElementById("prodSclsC")[i].hidden = "hidden";
					
					if(obj.value == document.getElementById("prodSclsC")[i].value.substring(0,3)){
						document.getElementById("prodSclsC")[i].removeAttribute("hidden");
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
				 	Add CustContract Information
				 	<c:set var="readonly" value="false"/>
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="custcontract" name="custcontractForm" method="post">
	
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
			<td width="150" class="ct_td" colspan="1"> <spring:message code="custcontract.cont_no" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="cusNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="cusNo" cssClass="errors" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<!-- 여기서부터 -->
        <tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_offr_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="incoStacC" id="incoStacC" cssClass="ct_input_g" cssStyle="width:150px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="재직상태코드를 선택하세요"/>				
					<form:options items="${orgCodeList}" itemValue="code" itemLabel="codeName"/>
				</form:select>
				<form:errors path="incoStacC" cssClass="errors" />
			</td> 
		 	
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_entr_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			    <input type="text" id="prodSellEntrDt" name="prodSellEntrDt" value="날짜를 선택하세요" onclick="fnPopUpCalendar(prodSellEntrDt,prodSellEntrDt,'yyyymmdd')" class='text_box1'>
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_end_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<input type="text" id="prodSellEndDt" name="prodSellEndDt" value="날짜를 선택하세요" onclick="fnPopUpCalendar(prodSellEndDt,prodSellEndDt,'yyyymmdd')" class='text_box1'>

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