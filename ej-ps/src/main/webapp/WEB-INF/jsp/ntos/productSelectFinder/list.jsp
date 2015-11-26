<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title>상품선정관리</title>
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>   
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
    <script  type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>
	
	 <script type="text/javascript">
    	$(function(){
    		$('#keyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				searchProductSelect();
				}
    		})
    	})
    	
		function searchProductSelect(arg) {			
		   	document.searchForm.action="<c:url value='/ntosProductSelectFinder.do?method=list'/>";
		   	document.searchForm.submit();		
		}
    		
    	function createProductSelectView() {
			document.location.href="<c:url value='/ntosProductSelect.do?method=createView'/>";
		}
    	
    	function selectPageSize(selectObj) {
    		document.searchForm.action="<c:url value='/ntosProductSelectFinder.do?method=list'/>";
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
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of productSelect</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="productSelect" method="post" name="searchForm">
	<!--begin of search-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
		<tr>
			<td align="left">
				총 ${size}건
				
				<form:select path="pageSize" cssClass="ct_input_g" cssStyle="width:80px;" id="tableSize" name ="tableSize" onchange="javascript:selectPageSize(this)">
					<form:option value="10" selected="selected">10건씩 보기</form:option>
					<form:option value="20">20건씩 보기</form:option>
					<form:option value="30">30건씩 보기</form:option>
					<form:option value="40">40건씩 보기</form:option>
					<form:option value="50">50건씩 보기</form:option>
				</form:select>
				
			</td>
			<!-- start of search -->
			<%-- <td align="right">
				<form:select path="searchCondition" cssClass="ct_input_g" cssStyle="width:80px;" id="gubun">
					<form:option value="" selected="selected">전체</form:option>
					<form:option value="1">상품번호</form:option>
					<form:option value="2">상품명</form:option>
				</form:select>
				
				<input type="hidden" id="prodName" name="prodName"/>
				<input type="hidden" id="prodNo" name="prodNo"/>
				
				<form:input path="searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50"/>
				
				<form:select path="prodLclsC" cssClass="ct_input_g" cssStyle="width:80px;">
					<form:option value="">전체</form:option>
					<form:option value="1"><spring:message code="product.lcls_c1"/></form:option>
					<form:option value="2"><spring:message code="product.lcls_c2"/></form:option>
					<form:option value="3"><spring:message code="product.lcls_c3"/></form:option>
					<form:option value="4"><spring:message code="product.lcls_c4"/></form:option>
					<form:option value="5"><spring:message code="product.lcls_c5"/></form:option>
					<form:option value="6"><spring:message code="product.lcls_c6"/></form:option>
				</form:select>

				<a href="javascript:searchProduct();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td> --%>
			
		</tr>
	</table>
	<!--end of search-->

	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">계약(플랜)번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">제도구분코드</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품선정일자</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품해제일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productSelect" items="${productSelects}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >
					<td align="center">${productSelect.rows}</td>
					<td align="center"><a class="linkClass" href="${ctx}/ntosProductSelect.do?method=get&contNo=${productSelect.contract.contNo}&prodNo=${productSelect.product.prodNo}">${productSelect.contract.contNo}<a></a></td>
					<td align="center">${productSelect.contract.planKindC}</td>
					<td align="center">${productSelect.product.prodNo}</td>
					<td align="center">${productSelect.product.prodName}</td>
					<td align="center">${productSelect.prodSlctDate}</td>
					<td align="center">${productSelect.prodRelsDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchProductSelect();"
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
			<td align="right"><a href='<c:url value="javascript:createProductSelectView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
</form:form>