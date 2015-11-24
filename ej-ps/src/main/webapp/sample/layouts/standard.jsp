<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<%@ taglib prefix="tiles" uri="http://tiles.apache.org/tags-tiles" %>
<html>
<head>
	<meta http-equiv="Content-Type" content="text/html; charset=UTF-8" />
	<title>Anyframe Plugins</title>
	
	<script type="text/javascript" src="<c:url value='/sample/javascript/modernizr.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script> 
	<script type="text/javascript" src="<c:url value='/sample/javascript/main.js'/>"></script>
	<script type="text/javascript" src="<c:url value="/resources/dojo/dojo.js" />"></script>  
    <script type="text/javascript" src="<c:url value="/resources/dojo/io/iframe.js" />"></script>  
    <script type="text/javascript" src="<c:url value="/resources/spring/Spring.js" />"> </script>
	<script type="text/javascript" src="<c:url value="/resources/spring/Spring-Dojo.js" />"> </script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>	
	
	<link type="text/css" rel="stylesheet" href="<c:url value="/resources/dijit/themes/tundra/tundra.css" />" />
    <link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<%-- <link rel="stylesheet" href="<c:url value='/sample/css/left.css'/>" type="text/css"> --%>
	
	<link href='https://fonts.googleapis.com/css?family=Muli' rel='stylesheet' type='text/css'>
	
	
	<link rel="stylesheet" href="<c:url value='/sample/css/tundra-customized.css'/>" type="text/css">
	
</head>
<!-- <body class="tundra spring"> -->
<body class="nav-is-fixed" onLoad="alert('퇴사자의 복수닷!');">
<table width="100%" height="79" border="0" cellpadding="0" cellspacing="0">
 <!---- Top ------>
  <tr>
    <td height="79" align="left" valign="top">
    	<tiles:insertAttribute name="top"/>
    </td>
  </tr>
</table>
<table width="100%" height="100%" border="0" cellpadding="0" cellspacing="0">
  <tr>
  <!---- Left Menu ------>
   <%--  <td width="177" height="100%" align="left" valign="top"  bgcolor="#eeeeee">
    	<div id="left">
    		<tiles:insertAttribute name="left"/>
    	</div>
    </td> --%>
	<!---- Body ------>
    <td width="100%" height="100%" align="left" valign="top" style="padding:0 20px 0 20px">   
		<div id="body">
        	<tiles:insertAttribute name="body"/>
        </div>	
    </td>
  </tr>
</table>
</body>
</html>