<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Ntos System</title>
	
	<!-- jQuery -->
	<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script>
    <script type="text/javascript" src="<c:url value='/sample/javascript/list/jquery.mixitup.min.js'/>"></script> 
    
    <!-- JS Plugin -->
	<script type="text/javascript" src="<c:url value='/sample/javascript/modernizr.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/bootstrap.min.js'/>"></script> 
	<script type="text/javascript" src="<c:url value='/sample/javascript/main.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/list/contetns-filter.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/list/classie.js'/>"></script> 
	
	<!-- Basic JS -->
	<script type="text/javascript" src="<c:url value="/resources/dojo/dojo.js" />"></script>  
    <script type="text/javascript" src="<c:url value="/resources/dojo/io/iframe.js" />"></script>  
    <script type="text/javascript" src="<c:url value="/resources/spring/Spring.js" />"> </script>
	<script type="text/javascript" src="<c:url value="/resources/spring/Spring-Dojo.js" />"> </script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>	
	
	<!-- CSS -->
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/dijit/themes/tundra/tundra.css" />" />
	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/theme.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/bootstrap.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/tundra-customized.css'/>" type="text/css">
	<!-- WEB FONT -->
	<link href='https://fonts.googleapis.com/css?family=Cantarell:700,400' rel='stylesheet' type='text/css'>
	
	<!-- 상단바 투명 처리 -->
	<script>
	$(function() {
		$(window).scroll(function(){
			var scrollTop = $(window).scrollTop();
			if(scrollTop != 0)
				$('#Topapplication').stop().animate({'opacity':'0.75'},400);
			else	
				$('#Topapplication').stop().animate({'opacity':'1'},400);
		});
		
		$('#Topapplication').hover(
			function (e) {
				var scrollTop = $(window).scrollTop();
				if(scrollTop != 0){
					$('#Topapplication').stop().animate({'opacity':'1'},400);
				}
			},
			function (e) {
				var scrollTop = $(window).scrollTop();
				if(scrollTop != 0){
					$('#Topapplication').stop().animate({'opacity':'0.75'},400);
				}
			}
		);
		if ('${userId}' == "") {
			alert("login을 하지 않았거나 \n시간이 경과하여 로그아웃이 되었습니다.");
			location.href = '${pageContext.request.contextPath}/sample/login.jsp';
		}
	});
	</script>
</head>
<!-- <body class="tundra spring"> -->
<body class="nav-is-fixed">
<!-- <table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
 -- Top ----
  <tr>
    <td height="100%" align="left" valign="top"> -->
    	<tiles:insertAttribute name="top"/>
<!--     </td>
  </tr>
</table> -->
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  <!---- Left Menu ------>
   <%--  <td width="177" height="100%" align="left" valign="top"  bgcolor="#eeeeee">
    	<div id="left">
    		<tiles:insertAttribute name="left"/>
    	</div>
    </td> --%>
	<!---- Body ------>
<td class="bodyonload" width="100%" height="100%" align="left" valign="top">   
		<div id="body">
        	<tiles:insertAttribute name="body"/>
        </div>	
    </td>
  </tr>
</table>
</body>
</html>
