<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title>상품관리</title>
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>   
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
	<script type="text/javascript">
    	$(function(){
    		$('#searchKeyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				searchChargeman();
				}
    		})
    	})
    	
		function searchChargeman(arg) {			
		   	document.searchForm.action="<c:url value='/ntosChargemanFinder.do?method=list'/>";
		   	document.searchForm.submit();		
		}
    		
    	function createChargemanView() {
			document.location.href="<c:url value='/ntosChargeman.do?method=createView'/>";
		}
    	
    	function selectPageSize(selectObj) {
    		document.searchForm.action="<c:url value='/ntosChargemanFinder.do?method=list'/>";
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
				<td height="24" class="ct_ttl01" style="padding-left: 12px">사무담당자 목록</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="chargeman" method="post" name="searchForm">
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
				<form:select path="searchCondition" cssClass="ct_input_g" cssStyle="width:80px;" id="gubun">
					<form:option value="" selected="selected">전체</form:option>
					<form:option value="1">담당자명</form:option>
					<form:option value="2">부서명</form:option>
				</form:select>
				
				<input type="hidden" id="chmnNm" name="chmnNm"/>
				<input type="hidden" id="chmnDpnm" name="chmnDpnm"/>
				
				<form:input path="searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50"/>

				<a href="javascript:searchChargeman();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
			
		</tr>
	</table>
	<!--end of search-->

	<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid">No</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">계약번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">일련번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">담당자명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">부서명</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid">직위명</th>
			</tr>
		</thead>
		<tbody>
			<c:forEach var="chargeman" items="${chargemans}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >
					<td align="center">${chargeman.no}</td>
					<td class="underline" align="center">
						<a class="linkClass" href="${ctx}/ntosChargeman.do?method=get&contNo=${chargeman.contNo}">${chargeman.contNo}</a>
					</td>
					<td align="center">${chargeman.chmnSeq}</td>
					<td align="center">${chargeman.chmnNm}</td>
					<td align="center">${chargeman.chmnDpnm}</td>
					<td align="center">${chargeman.chmnPsnm}</td>
				</tr>
			</c:forEach>
		</tbody>
	</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchChargeman();"
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
			<td align="right"><a href='<c:url value="javascript:createChargemanView();" />'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
</form:form>