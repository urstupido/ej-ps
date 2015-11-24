<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
    
    <script type="text/javascript">
    	$(function(){
    		$('#keyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				fncSearchCustomer();
				}
    		})
    	})
		function fncSearchCustomer(arg) {
		   	document.searchForm.action="<c:url value='/ntosCustomerFinder.do?method=list'/>";
		   	document.searchForm.submit();						
		}
		function createCustomerView(){
			document.location.href="<c:url value='/ntosCustomer.do?method=createView'/>";
		}
	</script>
	
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="24">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of Customer</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="customer" method="post" name="searchForm">
<!--begin of search-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
		<tr>
			<td align="left">
				총 ${size}건
				
				<select cssClass="ct_input_g" cssStyle="width:80px;" id="tableSize" name ="tableSize" onchange="javascript:selectPageSize(this)">
					<option value="10" selected="selected">10건씩 보기</option>
					<option value="20">20건씩 보기</option>
					<option value="30">30건씩 보기</option>
					<option value="40">40건씩 보기</option>
					<option value="50">50건씩 보기</option>
				</select>
			</td>
			<td align="right">
				<form:select path="codeInfo.code" cssClass="ct_input_g" cssStyle="width:80px;">
					<form:option value="">전체</form:option>
					<form:option value="1">사용자</form:option>
					<form:option value="2">가입자</form:option>
				</form:select>
				
				<form:select path="searchCondition">
					<form:option value="고객번호">고객번호</form:option>
					<form:option value="고객명">고객명</form:option>
				</form:select>
				
				<form:input path = "searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50" />
				
				<a href="javascript:fncSearchCustomer();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
			<input type="hidden" id="cnm" name="cnm"/>
			<input type="hidden" id="cusNo" name="cusNo"/>
		</tr>
	</table>
	<!--end of search-->
	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No.</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="customer.no"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="customer.userTc"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="customer.cnm"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="customer.lastChngDt"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="customer" items="${customers}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >				
					<td align="center">${customer.no}</td>
					<td class="underline" align="center">
						<a class="linkClass" href="${ctx}/ntosCustomer.do?method=get&cusNo=${customer.cusNo}">${customer.cusNo}</a>
					</td>
					<td align="center">${customer.codeInfo.codeName}</td>
					<td align="center">${customer.cnm}</td>
					<td align="center">${customer.lastChngDt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:fncSearchCustomer();"
					pages="${resultPage}" 
					firstImg="${ctx}/sample/images/pagenav/page_before1.gif" 
					lastImg="${ctx}/sample/images/pagenav/page_after1.gif" 
					prevImg="${ctx}/sample/images/pagenav/page_before.gif" 
					nextImg="${ctx}/sample/images/pagenav/page_after.gif"/>
			</td>
		</tr>
	</table>
	
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td align="right"><a href='<c:url value="javascript:createCustomerView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
	
</form:form>
