<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
    
    <script type="text/javascript">
    	$(function(){
    		$('#keyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				fncSearchContract();
				}
    		})
    	})
    	
	/*  	function fncSearchContract(arg) {
			if ($('#gubun').val() == '고객번호') {
				$('#contNo').val($('#keyword').val());
			}else{
				$('#cnm').val($('#keyword').val());
			}
		   	document.searchForm.action="<c:url value='/ntosContractFinder.do?method=list'/>";
		   	document.searchForm.submit();						
		}  */
    	
		
		function createContractView(){
			document.location.href="<c:url value='/ntosContract.do?method=createView'/>";
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
			</td>
			<td align="right">
			<%-- 	<form:select path="codeInfo.code" cssClass="ct_input_g" cssStyle="width:80px;">
					<form:option value="">전체</form:option>
					<form:option value="1">사용자</form:option>
					<form:option value="2">가입자</form:option>
				</form:select> 
				<select cssClass="ct_input_g" cssStyle="width:80px;" id="gubun">
					<option value="고객번호">고객번호</option>
					<option value="고객명">고객명</option>
				</select>--%>
				
				<select cssClass="ct_input_g" cssStyle="width:80px;" id="gubun">
					<option value="계약번호">계약번호</option>
					<option value="고객번호">고객번호</option>
					<option value="고객명">고객명</option>
				</select>
				
				<input type="text" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50" id="keyword">
				<a href="javascript:fncSearchContract();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
			<input type="hidden" id="cnm" name="cnm"/>
			<input type="hidden" id="contNo" name="contNo"/>
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