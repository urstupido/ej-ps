<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
	<title>Welcome, Ntos</title>
		<link rel="stylesheet" href="<c:url value='/sample/css/loginUi.css'/>" type="text/css">
		<link href='https://fonts.googleapis.com/css?family=Exo+2' rel='stylesheet' type='text/css'>
		<link href='https://fonts.googleapis.com/css?family=Lobster' rel='stylesheet' type='text/css'>
		<script language="javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
		<script src="./javascript/jquery-2.1.1.js"></script>
		<script src="./javascript/jquery.vide.js"></script>
		<script language="JavaScript">
			function fncLogin() {
				if(FormValidation(document.loginForm) != false) {
				    document.loginForm.action="<c:url value='/login.do'/>";
				    document.loginForm.submit();
			    }
			}
		</script>
</head>

<body text="#000000" data-vide-bg="video/ocean">
	<div style="position: absolute; z-index: -1; top: 0px; left: 0px; bottom: 0px; right: 0px; overflow: hidden; background-image: none; background-color: transparent; background-size: cover; background-position: 50% 50%; background-repeat: no-repeat;">
		<video autoplay="" loop="" muted="" style="margin: auto; position: absolute; z-index: -1; top: 50%; left: 50%; transform: translate(-50%, -50%); visibility: hidden; opacity: 0; width: auto; height: 951px;">
		<source src="./video/ocean.mp4" type="video/mp4"></video>
	</div>

	<form name="loginForm" method="post">
		<div class="background">
			<div class="login_container" align="center">
				<h1> Welcome, Ntos </h1><br>
				<input type='text' name="userId" class='ct_input_g_id' style='width:350px; height:40px' autocomplete=off required fieldTitle='ID' maxLength='50'/><br><br>
				<input type="password" name="password" class="ct_input_g_pw" autocomplete=off required fieldTitle="Password" maxLength="50" onKeyPress="if(event.keyCode==13) fncLogin();"><br><br><br>
				<input type="button" class="login_btn" value="Login" onClick="javascript:fncLogin();" />
			</div>
		</div>
	
		<input type="hidden" name="flag">
	</form>
	<script language="JavaScript">
		document.loginForm.userId.focus();
	</script>
</body>
</html>
