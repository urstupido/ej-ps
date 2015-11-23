<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="customerDetail.title"/></title>
    <meta name="heading" content="<spring:message code='customerDetail.heading'/>"/>   
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">            
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript">
	$(function(){
		$("input:radio[name=bunho]").change(function(){
			if ($(this).val() == 'saup') {
				$("#jumin").attr("hidden","hidden");
				$("#saup").removeAttr("hidden");
			}else{
				$("#saup").attr("hidden","hidden");
				$("#jumin").removeAttr("hidden");
			}
		});
	});
	
	function createCustomer() {
	    if ($("input:radio[name=bunho]:checked").val()=='saup') {
			$('#rbno').val($('#rbno3').val()+$('#rbno4').val()+$('#rbno5').val());
		}else{
			$('#rbno').val($('#rbno1').val()+$('#rbno2').val());
		}
	    $('#psno').val($('#psno1').val()+$('#psno2').val());
	    document.customerForm.action="<c:url value='/ntosCustomer.do?method=create'/>";
	    document.customerForm.submit();
	    
	}
	
	function updateCustomer() {
		$('#psno').val($('#psno1').val()+$('#psno2').val());
	    document.customerForm.action="<c:url value='/ntosCustomer.do?method=update'/>";
	    document.customerForm.submit();
	}
	
	function removeCustomer(){	
		if(confirmDelete('customer')) {
		    document.customerForm.action="<c:url value='/ntosCustomer.do?method=remove'/>";
		    document.customerForm.submit();
		}	    
	}
	
	function findZipCode(){
		window.open("${ctx}/ntosZipcodeFinder.do?method=openWindow", "zipcode", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
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
				 	<c:if test="${empty customer.cusNo}">
				 	Add Customer Information
				 	<c:set var="readonly" value="false"/>
					</c:if>
			
				    <c:if test="${not empty customer.cusNo}">	
					Update Customer Information
					<c:set var="readonly" value="true"/>				 
					</c:if>					
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="customer" name="customerForm" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<c:if test="${not empty customer.cusNo}">
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.no" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="cusNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="cusNo" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		</c:if>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.cnm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="cnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="cnm" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.userTc" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<form:select path="codeInfo.code">
            	<form:options items="${codeList}" itemValue="code" itemLabel="codeName"/>
          	</form:select>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.rbno" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<c:if test="${empty customer.cusNo}">
				<input type="radio" name="bunho" value="saup"> 사업자등록번호
				<input type="radio" name="bunho" value="jumin"> 주민등록번호
				<br>
			</c:if>
			<form:hidden path="rbno" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="rbno" cssClass="errors" />
			<div <c:if test="${fn:length(customer.rbno) != 13}">hidden="hidden"</c:if> id="jumin">
				<input type="text" value="${fn:substring(customer.rbno,0,6)}" id="rbno1" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>> -
				<input type="text" value="${fn:substring(customer.rbno,6,13)}" id="rbno2" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>>
			</div>
			<div <c:if test="${fn:length(customer.rbno) != 10}">hidden="hidden"</c:if> id="saup">
				<input type="text" value="${fn:substring(customer.rbno,0,3)}" id="rbno3" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>> -
				<input type="text" value="${fn:substring(customer.rbno,3,5)}" id="rbno4" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>> -
				<input type="text" value="${fn:substring(customer.rbno,5,10)}" id="rbno5" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>>
			</div>
			</td>
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
				<input type="text" value="${fn:substring(customer.psno,0,3)}" id="psno1"> - 
				<input type="text" value="${fn:substring(customer.psno,3,6)}" id="psno2">
				<input type="button" value="우편번호 찾기" onclick="findZipCode()">
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
	</table>
	<!--begin of button-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty customer.cusNo}">
					<a id="createlink" href="javascript:createCustomer();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
				</c:if>
				<c:if test="${not empty customer.cusNo}">
					<a id="updatelink" href="javascript:updateCustomer();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeCustomer();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
			</td>
		</tr>
	</table>
</form:form>