<%@ page contentType="text/html; charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>

<html>
<head>
<title>Login</title>
<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">
<script language="javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
<script language="JavaScript">
function fncLogin() {
	if(FormValidation(document.loginForm) != false) {
	    document.loginForm.action="<c:url value='/login.do'/>";
	    document.loginForm.submit();
    }
}

</script>

</head>

<body bgcolor="#ffffff" text="#000000" >

<form name="loginForm" method="post">
<div align="center">
<TABLE WIDTH="100%" HEIGHT="100%" BORDER="0" CELLPADDING="0" CELLSPACING="0">
<TR>
<TD ALIGN="CENTER" VALIGN="MIDDLE">

<!--************************** begin of contents *****************************-->

<table width="650" height="390" border="5" cellpadding="0" cellspacing="0" bordercolor="#D6CDB7">
  <tr> 
    <td width="10" height="5" align="left" valign="top" bordercolor="#D6CDB7"><table width="650" height="390" border="0" cellpadding="0" cellspacing="0">
        <tr>
          <td width="305">
            <img src="<c:url value='/sample/images/login.gif'/>" width="305" height="390">
          </td>
          <td width="345" align="left" valign="top" background="<c:url value='/sample/images/login02.gif'/>"><table width="100%" height="220" border="0" cellpadding="0" cellspacing="0">
              <tr> 
                <td width="30" height="100">&nbsp;</td>
                <td width="100" height="100">&nbsp;</td>
                <td height="100">&nbsp;</td>
                <td width="20" height="100">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="50">&nbsp;</td>
                <td width="100" height="50"><img src="<c:url value='/sample/images/text_login.gif'/>" width="91" height="32"></td>
                <td height="50">&nbsp;</td>
                <td width="20" height="50">&nbsp;</td>
              </tr>
              <tr> 
                <td width="200" height="50" colspan="4">
                </td>
              </tr>              
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30"><img src="<c:url value='/sample/images/text_id.gif'/>" width="100" height="30"></td>
                <td height="30">
                  <input type='text' name="userId" class='ct_input_g' style='width:180px; height:19px' required fieldTitle='ID' maxLength='50'/>
          			</td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="30">&nbsp;</td>
                <td width="100" height="30"><img src="<c:url value='/sample/images/text_pas.gif'/>" width="100" height="30"></td>
                <td height="30">                    
                    <input type="password" name="password" class="ct_input_g" style="width:180px; height:19px" required fieldTitle="Password" maxLength="50" onKeyPress="if(event.keyCode==13) fncLogin();">                                        
                </td>
                <td width="20" height="30">&nbsp;</td>
              </tr>
              <tr> 
                <td width="30" height="20">&nbsp;</td>
                <td width="100" height="20">&nbsp;</td>
                <td height="20" align="center">
      				    <!--버튼들어가는 테이블-->
      				    <table width="136" height="20" border="0" cellpadding="0" cellspacing="0">
                          <tr> 
                            <td width="56"></td>
                            <td width="10">&nbsp;</td>
                            <td width="56"><a href="javascript:fncLogin();"><img src="<c:url value='/sample/images/btn_login.gif'/>" width="56" height="20" border="0"></a></td>
                          </tr>
                        </table></td>
                      <td width="20" height="20">&nbsp;</td>
                    </tr>
                  </table>
                </td>
              </tr>                            
      </table>
      </td>
  </tr>
</table>
</TD></TR>
  
</TABLE>
</div>

<!-- end of title -->
<input type="hidden" name="flag">
</form>
<script language="JavaScript">
document.loginForm.userId.focus();
</script>
</body>
</html>
