<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title>고객 상세정보</title>
    <meta name="heading" content="고객정보"/>   
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">            
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript">
	function fncCreateMovie() {
	    document.movieForm.action="<c:url value='/foundationMovie.do?method=create'/>";
	    document.movieForm.submit();
	}
	
	function fncUpdateMovie() {
	    document.movieForm.action="<c:url value='/foundationMovie.do?method=update'/>";
	    document.movieForm.submit();
	}
	
	function fncRemoveMovie(){	
		if(confirmDelete('movie')) {
		    document.movieForm.action="<c:url value='/foundationMovie.do?method=remove'/>";
		    document.movieForm.submit();
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
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.no" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="title" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="title" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.cnm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="director" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="director" cssClass="errors" />
			</td>
		</tr>
		<tr>
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
			<td class="ct_write01">
				<form:input path="actors" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="actors" cssClass="errors" />
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
	</table>
	<!--begin of button-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty customer.cusNo}">
					<a id="createlink" href="javascript:fncCreateMovie();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
				</c:if>
				<c:if test="${not empty customer.cusNo}">
					<a id="updatelink" href="javascript:fncUpdateMovie();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:fncRemoveMovie();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
			</td>
		</tr>
	</table>
</form:form>
