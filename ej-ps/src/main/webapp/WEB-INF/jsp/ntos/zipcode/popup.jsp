<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp"%>
<title><spring:message code="customerDetail.title" /></title>
<meta name="heading"
	content="<spring:message code='customerDetail.heading'/>" />
<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
<script type="text/javascript"
	src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript">
	function searchZipcode(args) {
		/* var keyword = $('#dong').val();
		 $.ajax({
			"url" : "${ctx}/ntosZipcodeFinder.do?method=list",
			"type" : "POST",
			"dataType" : "json",
			"data" : {"searchKeyword" : keyword},
			success : function(data) {
				alert("check");
				console.log(data);
			}
		}); */
		document.searchForm.action="<c:url value='/ntosZipcodeFinder.do?method=list'/>";
		document.searchForm.submit();
	}
	$(function(){
		$('#searchKeyword').keypress(function(key){
			if (key.keyCode == 13) {
				searchZipcode();
			}
		})
	})
	
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
<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
	<form:form modelAttribute="zipcode" method="post" name="searchForm">
	<tr>
		<td align="center"><label>동 검색: 
		<form:input path="searchKeyword" cssClass="ct_input_g"	cssErrorClass="text medium error" maxlength="50" /></label> 
			<a href="javascript:searchZipcode();"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25"
				height="18" border="0" align="middle" /></a></td>
	</tr>
</table>
	
		<table class="scrollTable" width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<thead>
			<tr>
				<th scope="col" style="border-right: 1px #CCCCCC solid" width="20%">우편번호</th>
				<th scope="col" style="border-right: 1px #CCCCCC solid" width="80%">행정동명</th>
			</tr>
		</thead>
	<c:if test="${resultPage ne null}">
		<tbody>
			<c:forEach var="zipcode" items="${zipcodes}">
				<tr class="board" onMouseOver="this.style.backgroundColor='#e4eaff';return true;" onMouseOut="this.style.backgroundColor=''; return true;" >				
					<td class="underline" align="center"><a class="linkClass" href="javascript:addToOpener(${zipcode.seq})" seq="${zipcode.seq}">${zipcode.zip1}-${zipcode.zip2}</a></td>
					<td align="left" id="${zipcode.seq}">${zipcode.sido}시 ${zipcode.gugun} ${zipcode.dong} ${zipcode.bunji}</td>
				</tr>
			</c:forEach>
		</tbody>
		</table>
		<br>
		<span style="margin-left: 5%"><c:if test="${size ne null}">검색결과 : ${size} 개</c:if></span>
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top:10px;">
		<tr>
			<td class="page" height="50" align="center">
				<anyframe:pagenavigator linkUrl="javascript:searchZipcode();"
					pages="${resultPage}" 
					firstImg="${ctx}/sample/images/pagenav/page_before1.gif" 
					lastImg="${ctx}/sample/images/pagenav/page_after1.gif" 
					prevImg="${ctx}/sample/images/pagenav/page_before.gif" 
					nextImg="${ctx}/sample/images/pagenav/page_after.gif"/>
			</td>
		</tr>
	</table>
	</c:if>
	</form:form>
</html>