<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp"%>
<title><spring:message code="contractDetail.title" /></title>
<meta name="heading"
	content="<spring:message code='contractDetail.heading'/>" />
<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>"
	type="text/css">
<script type="text/javascript"
	src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
<script type="text/javascript">
	function createContract() {
		document.contractForm.action = "<c:url value='/ntosContract.do?method=create'/>";
		document.contractForm.submit();
	}

	function updateContract() {
		document.contractForm.action = "<c:url value='/ntosContract.do?method=update'/>";
		document.contractForm.submit();
	}

	function removeContract() {
		if (confirmDelete('contract')) {
			document.contractForm.action = "<c:url value='/ntosContract.do?method=remove'/>";
			document.contractForm.submit();
		}
	}
</script>
</head>
<!--************************** begin of contents *****************************-->

<!--begin of title-->
<table width="100%" height="37" border="0" cellpadding="0"
	cellspacing="0">
	<tr>
		<td background="<c:url value='/sample/images/ct_ttl_img02.gif'/>"
			width="100%" style="padding-left: 10px;">
			<table width="100%" height="24" border="0" cellpadding="0"
				cellspacing="0">
				<tr>
					<td height="24" class="ct_ttl01" style="padding-left: 12px"><c:if
							test="${empty contract.contNo}">
				 	Add Contract Information
				 	<c:set var="readonly" value="false" />
						</c:if> <c:if test="${not empty contract.contNo}">	
					Update Contract Information
					<c:set var="readonly" value="true" />
						</c:if></td>
				</tr>
			</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="contract" name="contractForm" method="post">

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_no" /> &nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="10"><form:input path="contNo"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" readonly="true" /> <form:errors path="contNo"
					cssClass="errors" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_name" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="10"><form:input path="contName"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contName" cssClass="errors" />
			</td>
		</tr>

		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_lcls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contLclsC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contLclsC" cssClass="errors" />
			</td>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_mcls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contMclsC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contMclsC" cssClass="errors" />
			</td>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_scls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contSclsC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contSclsC" cssClass="errors" />
			</td>
		</tr>

		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_sell_entr_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contSellEntrDt"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contSellEntrDt"
					cssClass="errors" /></td>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_sell_end_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6"><form:input
					path="contSellEndDt" cssClass="ct_input_g"
					cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors
					path="contSellEndDt" cssClass="errors" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.cont_offr_org_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contOffrOrgC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contOffrOrgC"
					cssClass="errors" /></td>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.asts_mng_org_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6"><form:input
					path="astsMngOrgC" cssClass="ct_input_g"
					cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors
					path="astsMngOrgC" cssClass="errors" /></td>
		</tr>

		<tr>
			<td height="25" colspan="3"></td>
		</tr>

		<tr>
			<td width="150" class="ct_td" colspan="12">최종변경정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.last_chng_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="lastChngDt"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" readonly="false" /> <form:errors path="lastChngDt"
					cssClass="errors" /></td>
			<td width="150" class="ct_td" colspan="2"><spring:message
					code="contract.last_chng_usid" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6"><form:input
					path="lastChngUsid" cssClass="ct_input_g"
					cssErrorClass="text medium error" size="40" maxlength="50"
					readonly="true" /> <form:errors path="lastChngUsid"
					cssClass="errors" /></td>
		</tr>


		<table width="100%" border="0" cellspacing="0" cellpadding="0"
			style="margin-top: 10px;">
			<tr>
				<td height="24" colspan="2" align="center"><c:if
						test="${empty contract.contNo}">
						<a id="createlink" href="javascript:createContract();"><img
							src="<c:url value='/sample/images/btn_add.png'/>" width="64"
							height="18" border="0" /></a>
						<script type="text/javascript">
							Spring
									.addDecoration(new Spring.ValidateAllDecoration(
											{
												elementId : 'createlink',
												event : 'onclick'
											}));
						</script>
					</c:if> <c:if test="${not empty contract.contNo}">
						<a id="updatelink" href="javascript:updateContract();"><img
							src="<c:url value='/sample/images/btn_update.png'/>" width="64"
							height="18" border="0" /></a>
						<script type="text/javascript">
							Spring
									.addDecoration(new Spring.ValidateAllDecoration(
											{
												elementId : 'updatelink',
												event : 'onclick'
											}));
						</script>
						<a href="javascript:removeContract();"><img
							src="<c:url value='/sample/images/btn_delete.png'/>" width="64"
							height="18" border="0" /></a>
					</c:if></td>
			</tr>
		</table>
		</form:form>