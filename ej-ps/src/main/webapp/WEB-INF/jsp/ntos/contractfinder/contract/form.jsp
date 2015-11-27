<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp"%>
<title><spring:message code="contractDetail.title" /></title>
<meta name="heading"
	content="<spring:message code='contractDetail.heading'/>" />
<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css"> 
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
	
	function removeContract(){	
		if(confirmDelete('contract')) {
			var prodNo = $('#contNo').val();
			 $.ajax({
				"url" : "${ctx}/ntosContract.do?method=remove",
				"type" : "POST",
				"dataType" : "json",
				"data" : {"contNo" : contNo},
				success : function(data) {
					location.href = "${ctx}/ntosContractFinder.do?method=list";
				},
				error : function(request, status, error){
					alert("해당 계약은 가입자가 있어서 삭제가 불가능합니다.");
				}
			});
		}	  
	}

	function findCustomer() {
		window.open("${ctx}/ntosCustomerFinder.do?method=popup", "popup", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
		event.preventDefault();
	}
	
	function goBack() {
	    window.history.back();
	}
</script>
	
</script>
</head>
<!--************************** begin of contents *****************************-->






<!--begin of title-->
<div class="list_header">
		<div class="left">UPDATE CONTRACT INFORMATION </div>
		<div class="center"></div>
		<div class="right">
			<c:if test="${not empty contract.contNo}">
				<script type="text/javascript">
						Spring.addDecoration(new Spring.ValidateAllDecoration({
							elementId : 'updatelink',
							event : 'onclick'
						}));
				</script>		
				<button id="updatelink" class="add_button" onclick="goBack()">&lt;&nbsp;BACK</button>
				<button class="add_button" onclick='updateContract()'>UPDATE</button>
				<button class="add_button" onclick='removeContract()'>DELETE</button>
			</c:if>
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
	
	
<form:form modelAttribute="contract" name="contractForm" method="post">
	<div class="table_view">
	<table class="table table-bordered">
		<tr>
			<td width="150" bgcolor="#f3f3f3" colspan="3">
			<spring:message code="contract.contNo" /> &nbsp;*</td>
			<td class="ct_write01" colspan="5"><form:input path="contNo" 
					cssClass="ct_input_g" cssStyle="width:300px;" cssErrorClass="text medium error" size="40"
					maxlength="50" readonly="true" /> <form:errors path="contNo"
					cssClass="errors" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#f3f3f3" colspan="3"><spring:message
					code="contract.cusNo" /></td>
				<td class="ct_write01" colspan="1"><form:input path="cusNo" id="cusNo"
					cssClass="ct_input_g" cssStyle="width:300px;" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="cusNo" cssClass="errors" />

				<button class="list_search_btn" style="margin-left: -5px" onclick='findCustomer()'>고객찾기</button>
<!-- 				<input type="button" value="고객찾기" onclick="searchCus()" /></td> -->
			<td width="150" bgcolor="#f3f3f3" colspan="3"><spring:message code="contract.contProc" /></td>
			<td class="ct_write01" colspan="1"><form:select
					path="ContProcStatC" id="ContProcStatC" cssClass="ct_input_list"
					cssStyle="width:200px;">
					<form:options items="${ContProcList}" itemValue="code"
						itemLabel="codeName" />
					<c:if test="${codeInfo.codeType eq 'CONT_PROC_STAT_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}" />
					</c:if>
				</form:select> <form:errors path="ContProcStatC" cssClass="errors" /></td>
		</tr>
		<tr>
			<td rowspan="5" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.rsndAccBnk" /></td>

			<td width="150" bgcolor="#f3f3f3"><spring:message
					code="contract.rsndAccBnk_c" /></td>
			<td class="ct_write01"><form:select path="rsndAccBnkC"
					id="rsndAccBnkC" cssClass="ct_input_list" cssStyle="width:200px;">
					<form:options items="${BankList}" itemValue="code"
						itemLabel="codeName" />
					<c:if test="${codeInfo.codeType eq 'RSND_ACC_BAK_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}" />
					</c:if>
				</form:select> <form:errors path="rsndAccBnkC" cssClass="errors" /></td>
			<td rowspan="5" bgcolor="#f3f3f3" colspan="2"><spring:message code="contract.contInfo" /></td>
			

			<td width="150" bgcolor="#f3f3f3"><spring:message
					code="contract.planCode" /></td>
			<td class="ct_write01"><form:select path="PlanKindC"
					id="PlanKindC" cssClass="ct_input_list" cssStyle="width:200px;"
					>
					<form:options items="${PlanKindList}" itemValue="code"
						itemLabel="codeName" />
					<c:if test="${codeInfo.codeType eq 'PLAN_KIND_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}" />
					</c:if>
				</form:select> <form:errors path="PlanKindC" cssClass="errors" /></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#f3f3f3"><spring:message
					code="contract.rsndAccNo" /></td>
				<td class="ct_write01"><form:input path="rsndAccNo"
					cssClass="ct_input_g" cssStyle="width:300px" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="rsndAccNo" cssClass="errors" /></td>
			<td width="150" bgcolor="#f3f3f3"><spring:message
					code="contract.planEntrDate" /></td>
			<td class="ct_write01">
				<input type="text" id="planEntrDate" class="ct_input_g_cal" name="planEntrDate" value="${contract.planEntrDate}" onclick="fnPopUpCalendar(planEntrDate,planEntrDate,'yyyymmdd')" class='text_box1'>
			</td>
		</tr>

		<tr>
			<td width="150" bgcolor="#f3f3f3"><spring:message
					code="contract.rsndAccDepo_nm" /></td>
			<td class="ct_write01"><form:input path="rsndAccDepoNm"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="rsndAccDepoNm"
					cssClass="errors" /></td>
			<td width="150" bgcolor="#f3f3f3"><spring:message
					code="contract.planEndDate" /></td>
			<td class="ct_write01">
				<input type="text" id="planEndDate" class="ct_input_g_cal" name="planEndDate" value="${contract.planEndDate}" onclick="fnPopUpCalendar(planEndDate,planEndDate,'yyyymmdd')" class='text_box1'>
			</td>
		</tr>
		<%-- 	<tr>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.cont_lcls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contLclsC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contLclsC" cssClass="errors" />
			</td>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.cont_mcls_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contMclsC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contMclsC" cssClass="errors" />
			</td>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
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
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.cont_sell_entr_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contSellEntrDt"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contSellEntrDt"
					cssClass="errors" /></td>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
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
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.cont_offr_org_c" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="contOffrOrgC"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" /> <form:errors path="contOffrOrgC"
					cssClass="errors" /></td>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
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
			<td width="150" bgcolor="#f3f3f3" colspan="12">최종변경정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.last_chng_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01"><form:input path="lastChngDt"
					cssClass="ct_input_g" cssErrorClass="text medium error" size="40"
					maxlength="50" readonly="false" /> <form:errors path="lastChngDt"
					cssClass="errors" /></td>
			<td width="150" bgcolor="#f3f3f3" colspan="2"><spring:message
					code="contract.last_chng_usid" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6"><form:input
					path="lastChngUsid" cssClass="ct_input_g"
					cssErrorClass="text medium error" size="40" maxlength="50"
					readonly="true" /> <form:errors path="lastChngUsid"
					cssClass="errors" /></td>
		</tr> --%>


	</table>	
</div>
</form:form>
