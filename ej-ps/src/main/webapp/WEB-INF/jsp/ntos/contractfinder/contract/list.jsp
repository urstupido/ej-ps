<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
    
    <script type="text/javascript">
	    $(function(){
			$('#searchKeyword').keypress(function(key){
				if (key.keyCode == 13) {
					searchContract();
				}
			})
		});
	
		function searchContract() {			
		   	document.searchForm.action="<c:url value='/ntosContractFinder.do?method=popup'/>";
		   	document.searchForm.submit();		
		}
    	
		function createContractView(){
			document.location.href="<c:url value='/ntosContract.do?method=createView'/>";
		}
		
		function addToOpener(seq){
			var zip1 = $("a[seq="+seq+"]").html().split("-")[0];
			var zip2 = $("a[seq="+seq+"]").html().split("-")[1];
			var dong = $.trim($("#"+seq).html());
			$("#psno1", opener.document).val(zip1);
			$("#psno2", opener.document).val(zip2);
			$("#addr", opener.document).val(dong);
			window.close();
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
				<th scope="col" style="border-right: 1px #CCCCCC solid">No.</th>
				<!-- <th scope="col" style="border-right: 1px #CCCCCC solid">1</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">2</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">3</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">4</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">5</th>  -->
				
				
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
						<a class="linkClass" href="${ctx}/ntosContract.do?method=get&contNo=${contract.contNo}">${contract.contNo}</a>
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
	
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td align="right"><a href='<c:url value="javascript:createContractView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
	
</form:form>