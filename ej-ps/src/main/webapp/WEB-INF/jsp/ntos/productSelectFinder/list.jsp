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
    	
    	function openPopup(){
    		window.open("${ctx}/ntosContractFinder.do?method=popup", "popup", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
    		event.preventDefault();
    	}
	</script>
</head>




<!--************************** begin of contents *****************************-->

<form:form modelAttribute="productSelect" method="post" name="searchForm">
	<!--begin of search-->
	<div class="list_header">
		<div class="left">PRODUCT SELECT MANAGEMENT</div>
		<div class="center"></div>
		<div class="right">
			<button class="list_search_btn_find" onclick="openPopup()">계약찾기</button>
				<form:input path="searchKeyword" cssClass="ct_input_g" cssStyle="width: 200px;" id="contNo"/>
				<form:input path="product.prodName" cssClass="ct_input_g" cssStyle="width: 200px;" id="cusName"/>
				<button class="list_search_btn" onclick='searchProductSelect();'>검색</button>
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
	<table class="table table-striped table-bordered table-condensed">
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
	<table width="100%">
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
<%-- 
	<table class="table table-striped table-bordered table-condensed">
		<tr>
			<td align="right"><a href='<c:url value="javascript:createProductView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table> --%>
	</div>
<%-- </form:form>
































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
	</table> --%>
</form:form>