<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp" %>
<title><spring:message code="movieDetail.title"/></title>
<style>
.ui-datepicker-trigger{
	vertical-align: top;
}
</style>
<meta name="heading" content="<spring:message code='movieDetail.heading'/>"/>   
<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/sample/css/jquery-ui-1.10.4.custom.css'/>" type="text/css">
<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>    
<script type="text/javascript" src="${pageContext.request.contextPath}/sample/javascript/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
	$("#releaseDate").datepicker({
		dateFormat: "yy-mm-dd",
		showOn: "both",
		buttonImage: "<c:url value='/sample/images/icon_cal.png' />",
		buttonImageOnly: true
	});
	var dateVal = '${movieAdd.releaseDate}'; 
	if(dateVal && dateVal != ''){
		var ymd = new Date(dateVal.substr(0,4), dateVal.substr(5,2)-1, dateVal.substr(8,2));
		$("#releaseDate").datepicker("setDate", ymd);
	} else {
		$("#releaseDate").datepicker("setDate", new Date());
	}
	$("#btnCreate").click(function(e){
		e.preventDefault();
		// javascript를 통한 validation 추가 필요
		
		
		$("#movieForm").attr("action", "<c:url value='/jqueryMovieCreate.do'/>");
		$("#movieForm").submit();
	});
	
	$("#btnUpdate").click(function(e){
		e.preventDefault();
		// javascript를 통한 validation 추가 필요
		
		
		$("#movieForm").attr("action","<c:url value='/jqueryMovieUpdate.do'/>");
		$("#movieForm").submit();
	});
	
	$("#btnDelete").click(function(e){
		e.preventDefault();
		// javascript를 통한 validation 추가 필요
		
		
		$("#movieForm").attr("action", "<c:url value='/jqueryMovieDelete.do'/>");
		$("#movieForm").submit();
	});
});
</script>         
</head>
<!--************************** begin of contents *****************************-->
<form:form modelAttribute="movieAdd" name="movieForm" id="movieForm" method="post" enctype="multipart/form-data">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<c:if test="${not empty movieAdd.movieId}">
			<form:hidden path="movieId" />
		</c:if>
		
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.title" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="title" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="title" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.director" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="director" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="director" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.genre" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<form:select path="genre.genreId">
            	<form:options items="${genreList}" itemValue="genreId" itemLabel="name"/>
          	</form:select>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.actors" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="actors" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="actors" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.runtime" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="runtime" cssClass="ct_input_g" cssErrorClass="text medium error" size="10" maxlength="3" /> min. <form:errors path="runtime" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.releaseDate" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="releaseDate" id="releaseDate" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="10" />
				<form:errors path="releaseDate" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.ticketPrice" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input id="ticketPrice" path="ticketPrice" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="5" /> <form:errors path="ticketPrice" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="movie.nowPlaying" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">Is this movie now playing ? <form:checkbox path="nowPlaying" value="Y" /><input type="hidden" name="!nowPlaying" value="N" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>	
		<tr>
			<td width="150" class="ct_td">
			<spring:message code="movie.posterFile"/></td><td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">		
				<c:if test="${not empty movieAdd.posterFile}">
					<img src="<c:url value='${movieAdd.posterFile}'/>" alt="<spring:message code='movie.posterFile'/>" border="0" />
					<form:hidden path="posterFile"/>
				</c:if>
				<c:if test="${empty movieAdd.posterFile}">
					<input type="file" name="realPosterFile" class="ct_input_g" style="width:309px; height:19px" maxLength="100" >
				</c:if>							        
			</td>
		</tr>
	</table>
	<!--begin of button-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty movieAdd.movieId}">
					<a id="btnCreate" href="#"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
				<c:if test="${not empty movieAdd.movieId}">
					<a id="btnUpdate" href="#"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<a id="btnDelete" href="#"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
			</td>
		</tr>
	</table>
</form:form>