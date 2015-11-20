<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="customerDetail.title"/></title>
    <meta name="heading" content="<spring:message code='customerDetail.heading'/>"/>   
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">            
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript">
	function createCustomer() {
	    document.customerForm.action="<c:url value='/ntosCustomer.do?method=create'/>";
	    document.customerForm.submit();
	}
	
	function updateCustomer() {
	    document.customerForm.action="<c:url value='/ntosCustomer.do?method=update'/>";
	    document.customerForm.submit();
	}
	
	function removeCustomer(){	
		if(confirmDelete('customer')) {
		    document.customerForm.action="<c:url value='/ntosCustomer.do?method=remove'/>";
		    document.customerForm.submit();
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
<form:form modelAttribute="customer" name="customerForm" method="post" enctype="multipart/form-data">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<c:if test="${not empty customer.cusNo}">
			<form:hidden path="cusNo" />
		</c:if>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.no" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="cusNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="cusNo" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.cnm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="cnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="cnm" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.userTc" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<%-- <form:select path="genre.genreId">
            	<form:options items="${genreList}" itemValue="genreId" itemLabel="name"/>
          	</form:select> --%>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.rbno" /></td>
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
		<%-- <tr>
			<td width="150" class="ct_td"><spring:message code="movie.runtime" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="runtime" cssClass="ct_input_g" cssErrorClass="text medium error" size="10" maxlength="3" /> min. <form:errors path="runtime" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.releaseDate" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="releaseDate" id="releaseDate" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="10" />
				<c:if test="${empty movie.movieId}">
					<anyframe:validate id="releaseDate" type="Date" value="currentDate"/>
				</c:if>
				<c:if test="${not empty movie.movieId}">
					<anyframe:validate id="releaseDate" type="Date"/>
				</c:if>
				<form:errors path="releaseDate" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.ticketPrice" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input id="ticketPrice" path="ticketPrice" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="5" /> <form:errors path="ticketPrice" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.nowPlaying" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">Is this movie now playing ? <form:checkbox path="nowPlaying" value="Y" /><input type="hidden" name="!nowPlaying" value="N" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>	
		<tr>
			<td width="150" class="ct_td">
			<spring:message code="movie.posterFile"/></td><td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">		
				<c:if test="${not empty movie.posterFile}">
					<img src="<c:url value='${movie.posterFile}'/>" alt="<spring:message code='movie.posterFile'/>" border="0" />
					<form:hidden path="posterFile"/>
				</c:if>
				<c:if test="${empty movie.posterFile}">
					<input type="file" name="realPosterFile" class="ct_input_g" style="width:309px; height:19px" maxLength="100" >
				</c:if>							        
			</td>
		</tr> --%>
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