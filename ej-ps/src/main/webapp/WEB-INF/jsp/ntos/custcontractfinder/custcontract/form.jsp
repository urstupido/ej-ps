<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="custcontractDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='custcontractDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">                
	<script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<script type="text/javascript">
		function updateCustContract() {
		    document.custcontractForm.action="<c:url value='/ntosCustContract.do?method=update'/>";
		    document.custcontractForm.submit();
		}
		
		function removeCustContract(){	
			if(confirmDelete('custcontract')) {
			    document.custcontractForm.action="<c:url value='/ntosCustContract.do?method=remove'/>";
			    document.custcontractForm.submit();
			}	    
		}
		function goBack() {
		    window.history.back();
		}
	</script>
</head>



<div class="list_header">
		<div class="left">UPDATE custCONTRACT INFORMATION </div>
		<div class="center"></div>
		<div class="right">
			<c:if test="${not empty contract.contNo}">
				<script type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'updatelink',
							event : 'onclick'
						}));
				</script>		
				<button id="updatelink" class="add_button" onclick="goBack()">&lt;&nbsp;BACK</button>
				<button class="add_button" onclick='updateCustContract()'>UPDATE</button>
				<button class="add_button" onclick='removeCustContract()'>DELETE</button>
			</c:if>
		</div>
	</div>

<table class="table table-condensed">
		<tr>
			<td align="left">
			</td>
			<td align="right">
			</td>
		</tr>
</table>	


<form:form modelAttribute="custContract" name="custcontractForm" method="post">
	<div class="table_view">
	<table class="table table-bordered">
		<%-- <c:if test="${not empty product.prodNo}"> --%>
		<tr>
			<td width="150" bgcolor="#f3f3f3" colspan="1"><spring:message code="custcontract.cont_no" />&nbsp;*</td>
			<td class="ct_write01" colspan="6">
				<form:input path="contNo" cssClass="ct_input_g" cssStyle="width:300px" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="contNo" cssClass="errors" />
			</td>
			<td width="150" bgcolor="#f3f3f3" colspan="1"><spring:message code="custcontract.cus_no" />&nbsp;*</td>
			<td class="ct_write01" colspan="6">
				<form:input path="cusNo" cssClass="ct_input_g" cssStyle="width:300px" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="cusNo" cssClass="errors" />
			</td>
		</tr>

		<%-- </c:if> --%>
		
		<tr>
		 	<td width="150" bgcolor="#f3f3f3" colspan="1"><spring:message code="custcontract.inco_stac_c" /> *</td>

			<td class="ct_write01" colspan="11">
				<form:select path="incoStacC" id="incoStacC" cssClass="ct_input_list" cssStyle="width:300px;">
					<form:option value="" label="재직상태코드를 선택하세요"/>				
					<form:options items="${incoCodeList}" itemValue="code" itemLabel="codeName"/>
				</form:select>
				<form:errors path="incoStacC" cssClass="errors" />
			</td> 
		 	
		</tr>
		
		<tr><!-- value="${product.prodSellEndDt}" -->
		 	<td width="150" bgcolor="#f3f3f3" colspan="1"><spring:message code="custcontract.entr_date" /> *</td>
			<td class="ct_write01" colspan="6">
			    <input type="text" id="entrDate" class="ct_input_g_cal" style="width:300px" name="entrDate" value="${custContract.entrDate}" onclick="fnPopUpCalendar(entrDate,entrDate,'yyyymmdd')" class='text_box1'>
			</td> 
		 	<td width="150" bgcolor="#f3f3f3" colspan="1"><spring:message code="custcontract.retr_date" /> *</td>
			<td class="ct_write01" colspan="6">
				<input type="text" id="retrDate" class="ct_input_g_cal" style="width:300px"  name="retrDate" value="${custContract.retrDate}" onclick="fnPopUpCalendar(retrDate,retrDate,'yyyymmdd')" class='text_box1'>

			</td>
		</tr>
		

		
<%-- 	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
					<a id="createlink" href="javascript:createCustContract();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
					<a id="updatelink" href="javascript:updateCustContract();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeCustContract();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
			</td>
		</tr>
	</table> --%>
	</table>
	</div>
</form:form>