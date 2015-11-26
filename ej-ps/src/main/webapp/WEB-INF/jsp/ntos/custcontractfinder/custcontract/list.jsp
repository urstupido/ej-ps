<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title>가입자관리</title>
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>

    <script type="text/javascript">
    	$(function(){
    		$('#searchKeyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				SearchCustContract();
				}
    		})
    	})
		function SearchCustContract(arg) {
		   	document.searchForm.action="<c:url value='/ntosCustContractFinder.do?method=list'/>";
		   	document.searchForm.submit();						
		}
		function createCustContractView(){
			document.location.href="<c:url value='/ntosCustContract.do?method=createView'/>";
		}
    	function selectPageSize(selectObj) {
    		document.searchForm.action="<c:url value='/ntosCustContractFinder.do?method=list'/>";
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
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of CustContract</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="custContract" method="post" name="searchForm">

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
				
				<form:input path = "searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50" />
				
				<a href="javascript:fncSearchCustContract();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>

		</tr>
	</table>
	<!--end of search-->
	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No.</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="custcontract.cus_name_no"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="custcontract.inco_stac_c"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="custcontract.entr_date"/></th>
				<th scope="col" style="border-right: 1px #CCCCCC solid"><spring:message code="custcontract.retr_date"/></th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="custContract" items="${custContracts}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >				
					<td align="center">${custContract.no}</td>
					<td class="underline" align="center">
						<a class="linkClass" href="${ctx}/ntosCustContract.do?method=get&contNo=${custContract.contNo}">${custContract.cusNameNo}</a>
					</td>
					<td align="center">${custContract.incoStacC}</td>
					<td align="center">${custContract.entrDate}</td>
					<td align="center">${custContract.retrDate}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:SearchCustContract();"
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
			<td align="right"><a href='<c:url value="javascript:createCustContractView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
	
</form:form>
