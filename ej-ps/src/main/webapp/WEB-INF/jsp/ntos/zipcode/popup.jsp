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
	function searchZipcode() {
		var keyword = $('#dong').val();
		 $.ajax({
			"url" : "${ctx}/ntosZipcodeFinder.do?method=list",
			"type" : "POST",
			"dataType" : "json",
			"data" : {"dong" : keyword},
			success : function(data) {
				alert("check");
				console.log(data);
			}
		});
		
	}
</script>
</head>
<table>
	<tr>
		<td>동 검색 <input type="text" id="dong"> <input
			type="button" onclick="searchZipcode()" value="검색">
		</td>
	</tr>
	<tr>
		<td>검색결과</td>
	</tr>
</table>
</html>