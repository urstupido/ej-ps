<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="productDistribution.title"/></title>
	<!-- css -->
 	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/bootstrap.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/list/component.css'/>" type="text/css"> 
	
	 <script type="text/javascript">
    	$(function(){
    		$('#searchKeyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				searchProduct();
				}
    		})
    	});
    	
    	function findContract(){
    		window.open("${ctx}/ntosContractFinder.do?method=popup", "popup", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
    		event.preventDefault();
    	}
    	
		function searchProductDistribution(arg) {			
		   	document.searchForm.action="<c:url value='/ntosProductDistributionFinder.do?method=list'/>";
		   	document.searchForm.submit();		
		}
    	
		function updateProductDistribution() {
		    document.customerForm.action="<c:url value='/ntosCustomer.do?method=update'/>";
		    document.customerForm.submit();
		}
		
		function selectPageSize(selectObj) {
    		document.searchForm.action="<c:url value='/ntosProductDistributionFinder.do?method=list'/>";
		   	document.searchForm.submit();
    	}
	</script>
</head>

<form:form modelAttribute="productDistribution" method="post" name="searchForm">
	<!--begin of search-->
	<div class="list_header">
		<div class="left">PRODUCT DIST MANAGEMENT</div>
		<div class="center"></div>
		<div class="right">
				<button id="updatelink" class="add_button" onclick='updateProductDistribution()'>UPDATE</button>
				<button class="list_search_btn_find" value="<spring:message code="productDistribution.find_contract"/>" onclick="findContract()">계약찾기</button>
				<input type="text" style="width: 200px" id="contNo" readonly="true" class="ct_input_g">
				<input type="text" style="width: 150px" id="cusName" readonly="true" class="ct_input_g">
				<button class="list_search_btn" onclick="searchProductDistribution()">검색</button>
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
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.cont_no"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.prod_no"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.prod_name"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.dstr_rto"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productDistribution" items="${productDistributions}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >
					<td align="center">${productDistribution.no}</td>
					<td align="center">${productDistribution.contNo}</td>
					<td align="center">${productDistribution.prodNo}</td>
					<td align="center">${productDistribution.prodName}</td>
					<td align="center"><input type="text" class="ct_input_g_dist" style="width: 100%;"value="${productDistribution.dstrRto}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table width="100%">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchProductDistribution();"
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
			<td align="right">
			
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
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of product</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="productDistribution" method="post" name="searchForm">
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
			
			
			<td align="right">
				<input type="button" value="<spring:message code="productDistribution.find_contract"/>" onclick="findContract()">
				<input type="text" id="contNo" readonly="true"> - 
				
				
				<input type="button" value="Search" onclick="searchProductDistribution()">
			</td>
			
		</tr>
	</table>
	<!--end of search-->

	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.cont_no"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.prod_no"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.prod_name"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="productDistribution.dstr_rto"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="productDistribution" items="${productDistributions}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >
					<td align="center">${productDistribution.no}</td>
					<td align="center">${productDistribution.contNo}</td>
					<td align="center">${productDistribution.prodNo}</td>
					<td align="center">${productDistribution.prodName}</td>
					<td align="center"><input type="text" value="${productDistribution.dstrRto}"></td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchProductDistribution();"
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
			<td align="right">
			<a id="updatelink" href="javascript:updateProductDistribution();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
			</td>
		</tr>
	</table>
</form:form> --%>