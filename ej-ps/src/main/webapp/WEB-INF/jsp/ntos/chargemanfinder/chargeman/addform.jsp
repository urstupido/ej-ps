<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="chargemanDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='chargemanDetail.heading'/>"/>  
      
	<link rel="stylesheet" href="<c:url value='/sample/css/reset.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/bootstrap.css'/>" type="text/css">
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	               
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
		
    	function findContract(){
    		window.open("${ctx}/ntosContractFinder.do?method=contractpopup", "popup", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
    		event.preventDefault();
    	}
		
		function createChargeman() {
	    	document.productForm.action="<c:url value='/ntosChargeman.do?method=create'/>";
	    	document.productForm.submit();
		}
		
	</script>
	<script>
		function goBack() {
		    window.history.back();
		}
</script>
</head>
<!--************************** begin of contents *****************************-->

<!--begin of title-->
<div class="list_header">
		<div class="left">ADD Chargeman Information </div>
		<div class="center"></div>
		<div class="right">
				<button class="add_button" onclick='goBack();'>&lt;&nbsp;BACK</button>
				<button class="add_button" onclick='createChargeman();'>+ADD</button>
		</div>
	</div>
<table class="table table-condensed">
		<tr>
			<td align="left">
				
			</td>
			
			<td align="right">
				</td>
			
		</tr>
	</table>	

<form:form modelAttribute="chargeman" name="chargemanForm" method="post">
	<div class="table_view">
	<table class="table table-bordered">
		<tr>
			<td width="150" colspan="2" bgcolor="#f3f3f3"><spring:message code="chargeman.contNo" />&nbsp;*</td>
			<td class="ct_write01" colspan="4">
				<form:input path="contNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50"/>
				<form:errors path="contNo" cssClass="errors" />
			<button class="list_search_btn_find" value="<spring:message code="chargeman.find_contract"/>" onclick="findContract()">계약찾기</button>
			</td>
		</tr>
		
		<tr>
			<td width="150" colspan="2" bgcolor="#f3f3f3"><spring:message code="chargeman.chmnNm" /></td>
			<td class="ct_write01">
				<form:input path="chmnNm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50"/>
				<form:errors path="chmnNm" cssClass="errors" />
			</td>
			<td width="150" colspan="2" bgcolor="#f3f3f3"> <spring:message code="chargeman.chmnRrno" /></td>
			<td class="ct_write01">
				<input type="text" class="ct_input_g" value="${fn:substring(chargeman.chmnRrno,0,6)}" id="rrno1"> -
				<input type="text" class="ct_input_g" value="${fn:substring(chargeman.chmnRrno,6,13)}" id="rrno2">
			</td>
		</tr>
		

		<tr>
			<td width="150" colspan="2" bgcolor="#f3f3f3"><spring:message code="chargeman.chmnDpnm" /></td>
			<td class="ct_write01">
				<form:input path="chmnDpnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50"/>
				<form:errors path="chmnDpnm" cssClass="errors" />
			</td>
			<td width="150" colspan="2" bgcolor="#f3f3f3"> <spring:message code="chargeman.chmnPsnm" /></td>
			<td class="ct_write01">
				<form:input path="chmnPsnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50"/>
				<form:errors path="chmnPsnm" cssClass="errors" />
			</td>
		</tr>


		<tr>
			<td width="150" colspan="2" bgcolor="#f3f3f3"><spring:message code="chargeman.chmnMnph" /></td>
			<td class="ct_write01">
			<form:hidden path="chmnMnph" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> 
			<form:errors path="chmnMnph" cssClass="errors" />
				<input class="ct_input_g" type="text" value="${fn:substring(chargeman.chmnMnph,0,3)}" id="mnph1"> -
				<c:choose>
					<c:when test="${fn:length(chargeman.chmnMnph) eq 11}">
						<input class="ct_input_g" type="text" value="${fn:substring(chargeman.chmnMnph,3,7)}" id="mnph2"> -
						<input class="ct_input_g" type="text" value="${fn:substring(chargeman.chmnMnph,7,11)}" id="mnph3">
					</c:when>
					<c:otherwise>
						<input class="ct_input_g" type="text" value="${fn:substring(chargeman.chmnMnph,3,6)}" id="mnph2"> -
						<input class="ct_input_g" type="text" value="${fn:substring(chargeman.chmnMnph,6,10)}" id="mnph3">
					</c:otherwise>
				</c:choose>
			</td>
			<td width="150" colspan="2" bgcolor="#f3f3f3"> <spring:message code="chargeman.chmnEmail" /></td>
			<td class="ct_write01">
				<form:hidden path="chmnEmail" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> 
				<form:errors path="chmnEmail" cssClass="errors" />
				<input class="ct_input_g" type="text" value="${fn:substringBefore(chargeman.chmnEmail, '@')}" id="email1"> @
				<input class="ct_input_g" type="text" value="${fn:substringAfter(chargeman.chmnEmail, '@')}" id="email2" >
				
				
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
		 
	</div>
</form:form>
