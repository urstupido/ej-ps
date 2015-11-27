<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="chargemanDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='chargemanDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<script type="text/javascript" src="<c:url value='/sample/javascript/calendar.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script src="http://code.jquery.com/ui/1.10.1/jquery-ui.js"></script>
	<script type="text/javascript">
		function findEmailAddr() {
			if ($('#emailAddr').val() != "") {
				$('#email2').attr("readonly", "readonly");
				$('#email2').val($('#emailAddr').val());
			}else{
				$('#email2').removeAttr("readonly");
				$('#email2').val("");
			}
		}
		
		function updateChargeman() {
			$('#chmnMnph').val($('#mnph1').val() + $('#mnph2').val() + $('#mnph3').val());
			$('#chmnEmail').val($('#email1').val() + "@" + $('#email2').val());
			
		    document.chargemanForm.action="<c:url value='/ntosChargeman.do?method=update'/>";
		    document.chargemanForm.submit();
		}
		
		function removeChargeman(){	
			if(confirmDelete('chargeman')) {
			    document.chargemanForm.action="<c:url value='/ntosChargeman.do?method=remove'/>";
			    document.chargemanForm.submit();
			}	    
		}
		
	</script>
</head>
<!--begin of title-->
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="<c:url value='/sample/images/ct_ttl_img02.gif'/>" width="100%" style="padding-left: 10px;">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">
					Update Chargeman Information
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<form:form modelAttribute="chargeman" name="chargemanForm" method="post">
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
		<c:if test="${not empty chargeman.contNo}">
			<td width="150" class="ct_td" colspan="2"><spring:message code="chargeman.contNo" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="contNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="contNo" cssClass="errors" />
			</td>
		</c:if>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="chargeman.chmnSeq" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="chmnSeq" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="chmnSeq" cssClass="errors" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="chargeman.chmnNm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="chmnNm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="chmnNm" cssClass="errors" />
			</td>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="chargeman.chmnRrno" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" value="${fn:substring(chargeman.chmnRrno,0,6)}" id="rrno1" readonly="readonly"> -
				<input type="text" value="${fn:substring(chargeman.chmnRrno,6,13)}" id="rrno2" readonly="readonly">
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr> 

		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="chargeman.chmnDpnm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="chmnDpnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50"/>
				<form:errors path="chmnDpnm" cssClass="errors" />
			</td>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="chargeman.chmnPsnm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="chmnPsnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50"/>
				<form:errors path="chmnPsnm" cssClass="errors" />
			</td>
		</tr>

		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>		 

		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="chargeman.chmnMnph" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<form:hidden path="chmnMnph" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> 
			<form:errors path="chmnMnph" cssClass="errors" />
				<input type="text" value="${fn:substring(chargeman.chmnMnph,0,3)}" id="mnph1"> -
				<c:choose>
					<c:when test="${fn:length(chargeman.chmnMnph) eq 11}">
						<input type="text" value="${fn:substring(chargeman.chmnMnph,3,7)}" id="mnph2"> -
						<input type="text" value="${fn:substring(chargeman.chmnMnph,7,11)}" id="mnph3">
					</c:when>
					<c:otherwise>
						<input type="text" value="${fn:substring(chargeman.chmnMnph,3,6)}" id="mnph2"> -
						<input type="text" value="${fn:substring(chargeman.chmnMnph,6,10)}" id="mnph3">
					</c:otherwise>
				</c:choose>
			</td>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="chargeman.chmnEmail" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:hidden path="chmnEmail" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> 
				<form:errors path="chmnEmail" cssClass="errors" />
				<input type="text" value="${fn:substringBefore(chargeman.chmnEmail, '@')}" id="email1"> @
				<input type="text" value="${fn:substringAfter(chargeman.chmnEmail, '@')}" id="email2" >
				
				
				<form:select path="chmnEmail2" id="emailAddr"  cssClass="ct_input_g" cssStyle="width:150px;" onchange="findEmailAddr(this)">
					<form:option value="" label="직접입력" selected="selected"/>
					<c:forEach items="${emailCodeList}" var="codeInfo" varStatus="status">
						<c:choose>
							<c:when test="${fn:substringAfter(chargeman.chmnEmail, '@') eq codeInfo.codeName}">
								<form:option value="${codeInfo.codeName}" label="${codeInfo.codeName}" selected="selected"/>
							</c:when>
							<c:otherwise>
								<form:option value="${codeInfo.codeName}" label="${codeInfo.codeName}" />
							</c:otherwise>
						</c:choose>
					</c:forEach>
				</form:select>
				<form:errors path="chmnEmail2" cssClass="errors" />
			</td>
		</tr>
		 
		<tr>
			<td height="25" colspan="3" ></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="12">최종변경정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="chargeman.lastChngDt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="lastChngDt" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="lastChngDt" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="chargeman.lastChngUsid" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="lastChngUsid" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="lastChngUsid" cssClass="errors" />
			</td> 
		</tr>
		</table>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty chargeman.contNo}">
					<a id="createlink" href="javascript:createChargeman();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
				</c:if>
				<c:if test="${not empty chargeman.contNo}">
					<a id="updatelink" href="javascript:updateChargeman();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeChargeman();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
			</td>
		</tr>
	</table>
	
</form:form>