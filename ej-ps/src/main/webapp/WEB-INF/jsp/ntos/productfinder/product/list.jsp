<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title>상품관리</title>
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>   
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
	
	 <script type="text/javascript">
    	$(function(){
    		$('#keyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				searchProduct();
				}
    		})
    	})
    	
		function searchProduct(arg) {
			if ($('#gubun').val() == "1") {
				$('#prodNo').val($('#keyword').val());
			}else{
				$('#prodName').val($('#keyword').val());
			}
			
		   	document.searchForm.action="<c:url value='/ntosProductFinder.do?method=list'/>";
		   	document.searchForm.submit();						
		}
    	function createProductView() {
			document.location.href="<c:url value='/ntosProduct.do?method=createView'/>";
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
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of product</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="product" method="post" name="searchForm">
	<!--begin of search-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
		<tr>
			<td align="left">
				총 ${size}건
			</td>
			<td align="right">
				<select cssClass="ct_input_g" cssStyle="width:80px;" id="gubun">
					<option value="" selected="selected">전체</option>
					<option value="1">상품번호</option>
					<option value="2">상품명</option>
				</select>
				
				<input type="hidden" id="prodName" name="prodName"/>
				<input type="hidden" id="prodNo" name="prodNo"/>
				
				<input type="text" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50" id="keyword">
				
				<select cssClass="ct_input_g" cssStyle="width:80px;" id="prodLcls">
					<option value="" selected="selected">전체</option>
					<option value="1"><spring:message code="product.lcls_c1"/></option>
					<option value="2"><spring:message code="product.lcls_c2"/></option>
					<option value="3"><spring:message code="product.lcls_c3"/></option>
					<option value="4"><spring:message code="product.lcls_c4"/></option>
					<option value="5"><spring:message code="product.lcls_c5"/></option>
					<option value="6"><spring:message code="product.lcls_c6"/></option>
				</select>
				
				<a href="javascript:searchProduct();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
			
		</tr>
	</table>
	<!--end of search-->

	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품대분류</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">자산관리기관명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품제공기관명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품판매일자</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">상품종료일자</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="product" items="${products}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >
					<td align="center">${product.no}</td>
					<td class="underline" align="center">
						<a class="linkClass" href="${ctx}/ntosProduct.do?method=get&prodNo=${product.prodNo}">${product.prodNo}</a>
					</td>
					<td align="center">${product.prodName}</td>
					<td align="center">${product.prodLclsC}</td>
					<td align="center">${product.prodOffrOrgC}</td>
					<td align="center">${product.astsMngOrgC}</td>
					<td align="center">${product.prodSellEntrDt}</td>
					<td align="center">${product.prodSellEndDt}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:fncSearchproduct();"
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
			<td align="right"><a href='<c:url value="javascript:createProductView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
</form:form>