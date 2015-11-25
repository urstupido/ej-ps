<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="productDistribution.title"/></title>
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
    <script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>   
    <script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
	
	 <script type="text/javascript">
    	$(function(){
    		$('#searchKeyword').keypress(function(key){
    			if (key.keyCode == 13) {
    				searchProduct();
				}
    		})
    	});
    	
    	function findContract(){
    		window.open("${ctx}/ntosContractFinder.do?method=openWindow", "contract", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
    	}
    	
		function searchProductDistribution(arg) {			
		   	document.searchForm.action="<c:url value='/ntosProductDistributionFinder.do?method=list'/>";
		   	document.searchForm.submit();		
		}
    	
		function updateProductDistribution() {
			
		    document.customerForm.action="<c:url value='/ntosCustomer.do?method=update'/>";
		    document.customerForm.submit();
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

<form:form modelAttribute="productDistribution" method="post" name="searchForm">
	<!--begin of search-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
		<tr>
			<td align="left">
				총 ${size}건
			</td>
			
			<td align="right">
				
				<input type="button" value="<spring:message code="productDistribution.find_contract"/>" onclick="findContract()">
				
				<input type="text" value="" id="contNo" readonly="true">
				<input type="text" value="" id="contNo" readonly="true">
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
					<td align="center">${productDistribution.seq}</td>
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
</form:form>