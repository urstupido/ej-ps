<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
	<title>고객관리</title>
	<!-- css -->
 	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/bootstrap.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/list/component.css'/>" type="text/css">
    
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





<form:form modelAttribute="customer" method="post" name="searchForm">
	<!--begin of search-->
	<div class="list_header">
		<div class="left">CUSTOMER MANAGEMENT</div>
		<div class="center"></div>
		<div class="right">
			<form:select path="codeInfo.code" cssClass="ct_input_list" cssStyle="width:80px;">
				<form:option value="">전체</form:option>
				<form:option value="1">사용자</form:option>
				<form:option value="2">가입자</form:option>
			</form:select>
			<form:select path="searchCondition" cssClass="ct_input_list">
					<form:option value="고객번호">고객번호</form:option>
					<form:option value="고객명">고객명</form:option>
				</form:select>
			<input type="hidden" id="cnm" name="cnm"/>
			<input type="hidden" id="cusNo" name="cusNo"/>
			<form:input path="searchKeyword" cssClass="ct_input_g" placeholder="검색하세요.." cssErrorClass="text medium error" maxlength="50"/>
			<button class="list_search_btn" onclick='fncSearchCustomer()'>검색</button>
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
	<!--end of search-->
	<div class="table_view">
	<table width="100%;">
		<thead>
			<tr>
				<td>
				<%-- <form:select path="prodLclsC" cssClass="ct_input_list_num" cssStyle="width:130px;">
					<form:option value="">전체</form:option>
					<form:option value="1"><spring:message code="product.lcls_c1"/></form:option>
					<form:option value="2"><spring:message code="product.lcls_c2"/></form:option>
					<form:option value="3"><spring:message code="product.lcls_c3"/></form:option>
					<form:option value="4"><spring:message code="product.lcls_c4"/></form:option>
					<form:option value="5"><spring:message code="product.lcls_c5"/></form:option>
					<form:option value="6"><spring:message code="product.lcls_c6"/></form:option>
				</form:select> --%>
				
				<span class="search_result_msg">총 ${size}건의 검색결과가 있습니다.</span>
				</td>
				<td align="right">
				<form:select path="pageSize" cssClass="ct_input_list_num" cssStyle="width:150px;" id="tableSize" name ="tableSize" onchange="javascript:selectPageSize(this)">
					<form:option value="10" selected="selected">10건씩 보기</form:option>
					<form:option value="20">20건씩 보기</form:option>
					<form:option value="30">30건씩 보기</form:option>
					<form:option value="40">40건씩 보기</form:option>
					<form:option value="50">50건씩 보기</form:option>
				</form:select>
				</td>
			</tr>
		</thead>
	</table>
		<div class="table_spacing"></div>
	<table id="hoho" class="table table-striped table-bordered table-condensed">
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
	<table width="100%">
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
<%-- 
	<table class="table table-striped table-bordered table-condensed">
		<tr>
			<td align="right"><a href='<c:url value="javascript:createProductView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table> --%>
	</div>
</form:form>
















<%-- 




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
				
				<form:select path="pageSize" cssClass="ct_input_g" cssStyle="width:80px;" id="tableSize" name ="tableSize" onchange="javascript:fncSearchCustomer(this)">
					<form:option value="10" selected="selected">10건씩 보기</form:option>
					<form:option value="20">20건씩 보기</form:option>
					<form:option value="30">30건씩 보기</form:option>
					<form:option value="40">40건씩 보기</form:option>
					<form:option value="50">50건씩 보기</form:option>
				</form:select>
				
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
	
</form:form> --%>
