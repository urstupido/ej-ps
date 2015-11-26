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

	function searchCus() {
		alert("안뇽");
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
					<td height="24" class="ct_ttl01" style="padding-left: 12px">
						Update Contract Information</td>
				</tr>
			</table>
		</td>
	</tr>
</table>
${contract.contNo}
<spring:message code="contract.contNo" />


<form:form modelAttribute="contract" name="contractForm" method="post">

	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" colspan="3"><spring:message
					code="contract.contNo" /> &nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="5"><form:input path="contNo"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" readonly="true" /> <form:errors path="contNo"
					cssClass="errors" /></td>
		</tr>
		<tr>
			<td height="1" colspan="8" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="3"><spring:message
					code="contract.cusNo" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="1"><form:input path="cusNo"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="cusNo" cssClass="errors" />

				<input type="button" value="고객찾기" onclick="searchCus()" /></td>
			<td width="150" class="ct_td" colspan="3"><spring:message
					code="contract.contProc" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="1"><form:select
					path="ContProcStatC" id="ContProcStatC" cssClass="ct_input_g"
					cssStyle="width:150px;">
					<form:options items="${ContProcList}" itemValue="code"
						itemLabel="codeName" />
					<c:if test="${codeInfo.codeType eq 'CONT_PROC_STAT_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}" />
					</c:if>
				</form:select> <form:errors path="ContProcStatC" cssClass="errors" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>


		<tr>
			<td rowspan="5" class="ct_td"><spring:message
					code="contract.rsndAccBnk" /></td>
			<td rowspan="5" bgcolor="D6D6D6" width="1"></td>

			<td width="150" class="ct_td"><spring:message
					code="contract.rsndAccBnk_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:select path="rsndAccBnkC"
					id="rsndAccBnkC" cssClass="ct_input_g" cssStyle="width:150px;">
					<form:options items="${BankList}" itemValue="code"
						itemLabel="codeName" />
					<c:if test="${codeInfo.codeType eq 'RSND_ACC_BAK_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}" />
					</c:if>
				</form:select> <form:errors path="rsndAccBnkC" cssClass="errors" /></td>
			<td rowspan="5" class="ct_td"><spring:message
					code="contract.contInfo" /></td>
			<td rowspan="5" bgcolor="D6D6D6" width="1"></td>

			<td width="150" class="ct_td"><spring:message
					code="contract.planCode" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:select path="PlanKindC"
					id="PlanKindC" cssClass="ct_input_g" cssStyle="width:150px;"
					>
					<form:options items="${PlanKindList}" itemValue="code"
						itemLabel="codeName" />
					<c:if test="${codeInfo.codeType eq 'PLAN_KIND_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}" />
					</c:if>
				</form:select> <form:errors path="PlanKindC" cssClass="errors" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message
					code="contract.rsndAccNo" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="rsndAccNo"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="rsndAccNo" cssClass="errors" /></td>
			<td width="150" class="ct_td"><spring:message
					code="contract.planEntrDate" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="planEntrDate"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="planEntrDate"
					cssClass="errors" /></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message
					code="contract.rsndAccDepo_nm" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="rsndAccDepoNm"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="rsndAccDepoNm"
					cssClass="errors" /></td>
			<td width="150" class="ct_td"><spring:message
					code="contract.planEndDate" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="planEndDate"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="planEndDate"
					cssClass="errors" /></td>

		</tr>









		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>

		<%-- 	<tr>
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
		</tr> --%>


		<%-- 	<tr>
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
		</tr> --%>


	</table>


	<table width="100%" border="0" cellspacing="0" cellpadding="0"
		style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center"><c:if
					test="${not empty contract.contNo}">
					<a id="updatelink" href="javascript:updateContract();"><img
						src="<c:url value='/sample/images/btn_update.png'/>" width="64"
						height="18" border="0" /></a>
					<script type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
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