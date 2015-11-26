<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title>상품관리</title>
	<!-- css -->
 	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/bootstrap.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/list/component.css'/>" type="text/css">
	
	<!-- script -->
	 <script type="text/javascript">
    	$(function(){
    		$('#keyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				searchProduct();
				}
    		})
    	})
    	
		function searchProduct(arg) {			
		   	document.searchForm.action="<c:url value='/ntosProductFinder.do?method=list'/>";
		   	document.searchForm.submit();		
		}
    		
    	function createProductView() {
			document.location.href="<c:url value='/ntosProduct.do?method=createView'/>";
		}
    	
    	function selectPageSize(selectObj) {
    		document.searchForm.action="<c:url value='/ntosProductFinder.do?method=list'/>";
		   	document.searchForm.submit();
    	}
	</script>
</head>


<form:form modelAttribute="product" method="post" name="searchForm">
	<!--begin of search-->
	<div class="list_header">
		<div class="left">PRODUCT MANAGEMENT</div>
		<div class="center"></div>
		<div class="right">
			<form:select path="searchCondition" cssClass="ct_input_list" id="gubun">
					<form:option value="" selected="selected">전체</form:option>
					<form:option value="1">상품번호</form:option>
					<form:option value="2">상품명</form:option>
				</form:select>
				<input type="hidden" id="prodName" name="prodName"/>
				<input type="hidden" id="prodNo" name="prodNo"/>
				<form:input path="searchKeyword" cssClass="ct_input_g" placeholder="검색하세요.." cssErrorClass="text medium error" maxlength="50"/>
				<button class="list_search_btn" onclick='searchProduct();'>검색</button>
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
				<form:select path="prodLclsC" cssClass="ct_input_list_num" cssStyle="width:130px;">
					<form:option value="">전체</form:option>
					<form:option value="1"><spring:message code="product.lcls_c1"/></form:option>
					<form:option value="2"><spring:message code="product.lcls_c2"/></form:option>
					<form:option value="3"><spring:message code="product.lcls_c3"/></form:option>
					<form:option value="4"><spring:message code="product.lcls_c4"/></form:option>
					<form:option value="5"><spring:message code="product.lcls_c5"/></form:option>
					<form:option value="6"><spring:message code="product.lcls_c6"/></form:option>
				</form:select>
				
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
	<table class="table table-striped table-bordered table-condensed">
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
	<table width="100%">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchProduct();"
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


