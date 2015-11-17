<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<div id="Topapplication" style="margin:0">
<table width="100%" height="79" border="0" cellpadding="0" cellspacing="0">
  <tr>  
    <td width="450" height="48" align="left" valign="middle" class="toptitle">
    	<a href="${ctx}" title="Go Home">PS System</a></td>
    <td align="right" valign="top">
    	<img src="<c:url value='/sample/images/top_bg_movie.jpg'/>" width="350" height="48" border="0"/></td>
  </tr>
  <tr>
    <td height="31" align="right" valign="middle" style="padding-right:20px"></td>
    <td align="right" valign="middle">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<c:choose>
				<c:when test="${userId!=null}">
				<td align="right">
				<c:out value='${userId}' />님 환영합니다! 
				<a href="${ctx}/logout.do">
				<img src="<c:url value='/sample/images/btn_logout.gif'/>" >
				</a>
				</td>
				</c:when>
				<c:otherwise>
				<td align="right">
				로그인 해주세요! 
				<a href="${ctx}/sample/login.jsp">
				<img src="<c:url value='/sample/images/btn_login.gif'/>" >
				</a>
				</td>
				</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</td>
  </tr>
</table>
</div>
