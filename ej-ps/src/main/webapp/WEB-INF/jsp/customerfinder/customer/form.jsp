<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title><spring:message code="customerDetail.title"/></title>
    <meta name="heading" content="<spring:message code='customerDetail.heading'/>"/>   
	<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">            
	<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>
	<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script>
	<script type="text/javascript">
	$(function(){
		$("input:radio[name=bunho]").change(function(){
			if ($(this).val() == 'saup') {
				$("#jumin").attr("hidden","hidden");
				$("#saup").removeAttr("hidden");
			}else{
				$("#saup").attr("hidden","hidden");
				$("#jumin").removeAttr("hidden");
			}
		});
	});
	
	function createCustomer() {
	    if ($("input:radio[name=bunho]:checked").val()=='saup') {
			$('#rbno').val($('#rbno3').val()+$('#rbno4').val()+$('#rbno5').val());
			if ($('#rbno').val().length != 10) {
				showError();
				return;
			}
		}else{
			$('#rbno').val($('#rbno1').val()+$('#rbno2').val());
			if ($('#rbno').val().length != 13) {
				showError();
				return;
			}
		}
	    
	    $("span","td[name='rbno']").html("");
	    
	    function showError(){
	    	$("span","td[name='rbno']").html("");
			$("td[name='rbno']").append("<span style='color: red'><spring:message code='customer.invalidrbno'/></span>");
	    }
	    
	    $('#psno').val($('#psno1').val()+$('#psno2').val());
	    
	    document.customerForm.action="<c:url value='/ntosCustomer.do?method=create'/>";
	    document.customerForm.submit();
	    
	}
	
	function updateCustomer() {
		$('#psno').val($('#psno1').val()+$('#psno2').val());
	    document.customerForm.action="<c:url value='/ntosCustomer.do?method=update'/>";
	    document.customerForm.submit();
	}
	
	function removeCustomer(){	
		if(confirmDelete('Customer')) {
			var cusNo = $('#cusNo').val();
			 $.ajax({
				"url" : "${ctx}/ntosCustomer.do?method=remove",
				"type" : "POST",
				"dataType" : "json",
				"data" : {"cusNo" : cusNo},
				success : function(data) {
					location.href = "${ctx}/ntosCustomerFinder.do?method=list";
				},
				error : function(request, status, error){
					alert("해당 고객명으로 가입된 계약이 있어 삭제가 불가합니다");
				}
			});
		}	    
	}
	
	function findZipCode(){
		window.open("${ctx}/ntosZipcodeFinder.do?method=openWindow", "zipcode", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
	}
	
	function goBack(){
		window.history.back();
	}
	
	</script>         
</head>
<!--************************** begin of contents *****************************-->

<!--begin of title-->
<table width="100%" height="37" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td background="<c:url value='/sample/images/ct_ttl_img02.gif'/>" width="100%" style="padding-left: 10px;">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">
				 	<c:if test="${empty customer.cusNo}">
				 	Add Customer Information
				 	<c:set var="readonly" value="false"/>
					</c:if>
			
				    <c:if test="${not empty customer.cusNo}">	
					Update Customer Information
					<c:set var="readonly" value="true"/>				 
					</c:if>					
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<form:form modelAttribute="customer" name="customerForm" method="post" enctype="multipart/form-data">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<c:if test="${not empty customer.cusNo}">
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.no" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="cusNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="cusNo" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		</c:if>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.cnm" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="cnm" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="cnm" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6" ></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.userTc" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			<form:select path="codeInfo.code">
            	<form:options items="${codeList}" itemValue="code" itemLabel="codeName"/>
          	</form:select>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="customer.rbno" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" name="rbno">
			<c:if test="${empty customer.cusNo}">
				<input type="radio" name="bunho" value="saup"> 사업자등록번호
				<input type="radio" name="bunho" value="jumin"> 주민등록번호
				<br>
			</c:if>
			<form:hidden path="rbno" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="rbno" cssClass="errors" />
			<div <c:if test="${fn:length(customer.rbno) != 13}">hidden="hidden"</c:if> id="jumin">
				<input type="text" value="${fn:substring(customer.rbno,0,6)}" id="rbno1" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>> -
				<input type="text" value="${fn:substring(customer.rbno,6,13)}" id="rbno2" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>>
			</div>
			<div <c:if test="${fn:length(customer.rbno) != 10}">hidden="hidden"</c:if> id="saup">
				<input type="text" value="${fn:substring(customer.rbno,0,3)}" id="rbno3" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>> -
				<input type="text" value="${fn:substring(customer.rbno,3,5)}" id="rbno4" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>> -
				<input type="text" value="${fn:substring(customer.rbno,5,10)}" id="rbno5" <c:if test="${not empty customer.cusNo}"> readonly="readonly" </c:if>>
			</div>
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td rowspan="5" class="ct_td">우편물 수령지</td>
			<td width="150" class="ct_td"><spring:message code="customer.psno" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<input type="text" value="${fn:substring(customer.psno,0,3)}" id="psno1" onclick="findZipCode()" readonly="true"> - 
				<input type="text" value="${fn:substring(customer.psno,3,6)}" id="psno2" onclick="findZipCode()" readonly="true">
				<form:hidden path="psno"/>
				<input type="button" value="우편번호 찾기" onclick="findZipCode()">
				<form:errors path="psno" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.addr" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="addr" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="10" readonly="true" onclick="findZipCode()"/>
				<form:errors path="addr" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.dongBlwAddr" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="dongBlwAddr" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="10" />
				<form:errors path="dongBlwAddr" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td width="150" class="ct_td" colspan="2">
			<spring:message code="customer.pictureFile"/></td><td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">		
				<c:if test="${not empty customer.pictureFile}">
					<img src="<c:url value='${customer.pictureFile}'/>" width="250px" height="200px" alt="<spring:message code='customer.pictureFile'/>" border="0" />
					<form:hidden path="pictureFile"/>
				</c:if>
				<input type="file" name="realPictureFile" class="ct_input_g" style="width:309px; height:19px" maxLength="100" >
			</td>
		</tr>
	</table>
	<br>
	
	<%-- <table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" colspan="7">최종변경정보</td>
			<td bgcolor="D6D6D6" width="1"></td>
		</tr>
		<tr>
			<td width="150" class="ct_td"><spring:message code="customer.lastChngUsid"/></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">${customer.lastChngUsid}</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td width="150" class="ct_td"><spring:message code="customer.lastChngDt"/></td>
			<td bgcolor="D6D6D6" width="1"></td><td class="ct_write01">${customer.lastChngDt}
			</td>
		</tr>
	</table> --%>
	
	<!--begin of button-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty customer.cusNo}">
					<a href="javascript:goBack();"><img src="<c:url value='/sample/images/btn_back.png'/>" width="64" height="18" border="0" /></a>
					<a id="createlink" href="javascript:createCustomer();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
					<input type="reset" value="RESET">
				</c:if>
				<c:if test="${not empty customer.cusNo}">
					<a href="javascript:goBack();"><img src="<c:url value='/sample/images/btn_back.png'/>" width="64" height="18" border="0" /></a>
					<a id="updatelink" href="javascript:updateCustomer();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeCustomer();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
					<input type="reset" value="RESET">
				</c:if>
			</td>
		</tr>
	</table>
</form:form>
