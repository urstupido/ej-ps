<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script> 
    
    <script type="text/javascript">
		function fncSearchCustomer(arg) {
		   	document.searchForm.action="<c:url value='/ntosCustomerFinder.do?method=list'/>";
		   	document.searchForm.submit();						
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

	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">고객번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">사용자_구분코드</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">주민사업자등록번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">고객명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">우편번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">주소</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">동_이하_주소</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="customer" items="${customers}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >				
					<td class="underline" align="center">
						<a class="linkClass" href="${ctx}/ntosCustomer.do?method=get&cusNo=${customer.cusNo}">${customer.cusNo}</a>
					</td>
					</td>
					<td align="center">${customer.userTc}</td>
					<td align="center">${customer.rbno}</td>
					<td align="center">${customer.cnm}</td>
					<td align="center">${customer.psno}</td>
					<td align="center">${customer.addr}</td>
					<td align="center">${customer.dongBlwAddr}</td>
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
</form:form>