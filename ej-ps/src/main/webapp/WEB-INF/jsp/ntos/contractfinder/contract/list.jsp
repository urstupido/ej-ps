<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
	<title>계약관리</title>
	<!-- css -->
 	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/bootstrap.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/list/component.css'/>" type="text/css">
	
    
    <script type="text/javascript">
	    $(function(){
			$('#searchKeyword').keypress(function(key){
				if (key.keyCode == 13) {
					searchContract();
				}
			})
		});
	
		function searchContract() {
			if(window.name == "popup"){
				document.searchForm.action="<c:url value='/ntosContractFinder.do?method=popup'/>";
			} else {
				document.searchForm.action="<c:url value='/ntosContractFinder.do?method=list'/>";
			}
		   	document.searchForm.submit();		
		}
		
		function createContractView(){
			document.location.href="<c:url value='/ntosContract.do?method=createView'/>";
		}
		
		function selectPageSize(selectObj) {
			if(window.name == "popup"){
				document.searchForm.action="<c:url value='/ntosContractFinder.do?method=popup'/>";
			} else {
				document.searchForm.action="<c:url value='/ntosContractFinder.do?method=list'/>";
			}
		   	document.searchForm.submit();
    	}
		
		function addToOpener(val1, val2){
			$("#contNo", opener.document).val(val1);
			$("#cusName", opener.document).val(val2);
			window.close();
		}
		
		
	</script>
	
</head>





<form:form modelAttribute="contract" method="post" name="searchForm">
	<!--begin of search-->
	<div class="list_header">
		<div class="left">PLAN MANAGEMENT</div>
		<div class="center"></div>
		<div class="right">
			<form:select path="searchCondition" cssClass="ct_input_list" id="gubun">
					<form:option value="1" selected="selected">계약번호</form:option>
					<form:option value="2">계약자명</form:option>
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
				<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.contNo"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.contNameNo"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.planCode"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.contProc"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.planEntrDate"/></th>
			</tr>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="contract" items="${contracts}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >				
					<td align="center">${contract.no}</td>
					<td class="underline" align="center">
						<c:choose>
							<c:when test="${windowName eq 'popup'}">
								<a class="linkClass" href="javascript:addToOpener('${contract.contNo}', '${contract.cusName}')">${contract.contNo}</a>
							</c:when>
							<c:otherwise>
								<a class="linkClass" href="${ctx}/ntosContract.do?method=get&contNo=${contract.contNo}">${contract.contNo}</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">${contract.contNameNo}</td>
					<td align="center">${contract.planCode}</td>
					<td align="center">${contract.contProc}</td>
					<td align="center">${contract.planEntrDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>
	<table width="100%">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchContract();"
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
	<%-- <c:if test="${windowName != 'popup'}">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			<tr>
				<td align="right"><a href='<c:url value="javascript:createContractView();" />'><img
					src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
			</tr>
		</table>
	</c:if> --%>
</form:form>








































<%-- 



<!--************************** begin of contents *****************************-->
<!--begin of title-->
<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="24">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of Contract</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="contract" method="post" name="searchForm">
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
				조회조건 : 
				<form:select path="searchCondition" cssClass="ct_input_g" cssStyle="width:80px;" id="gubun">
					<form:option value="1" selected="selected">계약번호</form:option>
					<form:option value="2">계약자명</form:option>
				</form:select>
				
				<form:input path="searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50"/>

				<a href="javascript:searchContract();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
			
		</tr>
	</table>
	<!--end of search-->
	
	
	
	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.contNo"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.contNameNo"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.planCode"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.contProc"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="contract.planEntrDate"/></th>
				 
			</tr>
		</thead>
		
		<tbody>
			<c:forEach var="contract" items="${contracts}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >				
					<td align="center">${contract.no}</td>
					<td class="underline" align="center">
						<c:choose>
							<c:when test="${windowName eq 'popup'}">
								<a class="linkClass" href="${ctx}/ntosContract.do?method=get&contNo=${contract.contNo}">${contract.contNo}</a>
							</c:when>
							<c:otherwise>
								<a class="linkClass" href="${ctx}/ntosContract.do?method=get&contNo=${contract.contNo}">${contract.contNo}</a>
							</c:otherwise>
						</c:choose>
					</td>
					<td align="center">${contract.contNameNo}</td>
					<td align="center">${contract.planCode}</td>
					<td align="center">${contract.contProc}</td>
					<td align="center">${contract.planEntrDate}</td>
				</tr>
			</c:forEach>
		</tbody>
		 
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:fncSearchContract();"
					pages="${resultPage}" 
					firstImg="${ctx}/sample/images/pagenav/page_before1.gif" 
					lastImg="${ctx}/sample/images/pagenav/page_after1.gif" 
					prevImg="${ctx}/sample/images/pagenav/page_before.gif" 
					nextImg="${ctx}/sample/images/pagenav/page_after.gif"/>
			</td>
		</tr>
	</table>
	<c:if test="${windowName != 'popup'}">
		<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
			<tr>
				<td align="right"><a href='<c:url value="javascript:createContractView();" />'><img
					src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
			</tr>
		</table>
	</c:if>
</form:form>
 --%>