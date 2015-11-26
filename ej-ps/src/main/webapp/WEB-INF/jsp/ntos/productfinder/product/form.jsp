<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="productDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='productDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<script type="text/javascript">
		$(function(){
			for (var i = 1; i < document.getElementById("prodMclsC").length; i++) {
				document.getElementById("prodMclsC")[i].hidden = "hidden";
			}
			for (var i = 1; i < document.getElementById("prodSclsC").length; i++) {
				document.getElementById("prodSclsC")[i].hidden = "hidden";
			}
		});
	
		function updateProduct() {
		    document.productForm.action="<c:url value='/ntosProduct.do?method=update'/>";
		    document.productForm.submit();
		}
		
		function removeProduct(){	
			if(confirmDelete('product')) {
				var prodNo = $('#prodNo').val();
				 $.ajax({
					"url" : "${ctx}/ntosProduct.do?method=remove",
					"type" : "POST",
					"dataType" : "json",
					"data" : {"prodNo" : prodNo},
					success : function(data) {
						location.href = "${ctx}/ntosProductFinder.do?method=list";
					},
					error : function(request, status, error){
						alert("해당 상품은 선정된 계약이 있어서 삭제가 불가능합니다.");
					}
				});
			}	  
		}
		
		function selectProdC(obj) {
			if(obj.id=="prodLclsC"){
				document.getElementById("prodMclsC")[0].selected = true;
				document.getElementById("prodSclsC")[0].selected = true;
				
				for (var i = 1; i < document.getElementById("prodMclsC").length; i++) {
					document.getElementById("prodMclsC")[i].hidden = "hidden";
										
					if(obj.value == document.getElementById("prodMclsC")[i].value.substring(0,1)){
						document.getElementById("prodMclsC")[i].removeAttribute("hidden");
					} 
				}
				
				for (var i = 1; i < document.getElementById("prodSclsC").length; i++) {
					document.getElementById("prodSclsC")[i].hidden = "hidden";
				}
				
			} else if(obj.id=="prodMclsC"){
				document.getElementById("prodSclsC")[0].selected = true;
				
				for (var i = 1; i < document.getElementById("prodSclsC").length; i++) {
					document.getElementById("prodSclsC")[i].hidden = "hidden";
					
					if(obj.value == document.getElementById("prodSclsC")[i].value.substring(0,3)){
						document.getElementById("prodSclsC")[i].removeAttribute("hidden");
					} 
				}
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
					Update Product Information
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

<form:form modelAttribute="product" name="productForm" method="post">
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_no" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="prodNo" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/>
				<form:errors path="prodNo" cssClass="errors" />
			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="150" class="ct_td" colspan="2"> <spring:message code="product.prod_name" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="10">
				<form:input path="prodName" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" /> <form:errors path="prodName" cssClass="errors" />
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_lcls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodLclsC" id="prodLclsC" cssClass="ct_input_g" cssStyle="width:150px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="-- 선택하세요 --"/>
					<c:forEach items="${prodCodeList}" var="codeInfo" varStatus="status">
					<c:if test="${codeInfo.codeType eq 'PROD_LCLS_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}"/>
					</c:if>
				</c:forEach>
				</form:select>
				<form:errors path="prodLclsC" cssClass="errors" />
				
				
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_mcls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodMclsC" id="prodMclsC" cssClass="ct_input_g" cssStyle="width:150px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="-- 선택하세요 --"/>
					<c:forEach items="${prodCodeList}" var="codeInfo" varStatus="status">
					<c:if test="${codeInfo.codeType eq 'PROD_MCLS_C'}">
						<form:option value="${codeInfo.code}" label="${codeInfo.codeName}"/>
					</c:if>
				</c:forEach>
				</form:select>
				<form:errors path="prodMclsC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_scls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodSclsC" id="prodSclsC" cssClass="ct_input_g" cssStyle="width:150px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="-- 선택하세요 --"/>				
					<c:forEach items="${prodCodeList}" var="codeInfo" varStatus="status">
						<c:if test="${codeInfo.codeType eq 'PROD_SCLS_C'}">
							<form:option value="${codeInfo.code}" label="${codeInfo.codeName}"/>
						</c:if>
					</c:forEach>
				</form:select>
				<form:errors path="prodSclsC" cssClass="errors" />
			</td> 
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_entr_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			    <input type="text" id="prodSellEntrDt" name="prodSellEntrDt" value="${product.prodSellEntrDt}" onclick="fnPopUpCalendar(prodSellEntrDt,prodSellEntrDt,'yyyymmdd')" class='text_box1'>
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_end_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<input type="text" id="prodSellEndDt" name="prodSellEndDt" value="${product.prodSellEndDt}" onclick="fnPopUpCalendar(prodSellEndDt,prodSellEndDt,'yyyymmdd')" class='text_box1'>

			</td>
		</tr>
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr>
		<tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_offr_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:select path="prodOffrOrgC" id="prodOffrOrgC" cssClass="ct_input_g" cssStyle="width:150px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="기관을 선택하세요"/>				
					<form:options items="${orgCodeList}" itemValue="code" itemLabel="codeName"/>
				</form:select>
				<form:errors path="prodOffrOrgC" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.asts_mng_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:select path="astsMngOrgC" id="astsMngOrgC" cssClass="ct_input_g" cssStyle="width:150px;" onchange="javascript:selectProdC(this)">
					<form:option value="" label="기관을 선택하세요"/>				
					<form:options items="${orgCodeList}" itemValue="code" itemLabel="codeName"/>
				</form:select>
				<form:errors path="astsMngOrgC" cssClass="errors" />
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
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.last_chng_dt" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
				<form:input path="lastChngDt" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="lastChngDt" cssClass="errors" />
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.last_chng_usid" /></td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="6">
				<form:input path="lastChngUsid" cssClass="ct_input_g" cssErrorClass="text medium error" size="40" maxlength="50" readonly="true"/> <form:errors path="lastChngUsid" cssClass="errors" />
			</td> 
		</tr>
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
				<c:if test="${empty product.prodNo}">
					<a id="createlink" href="javascript:createProduct();"><img src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'createlink', event:'onclick'}));
					</script>
				</c:if>
				<c:if test="${not empty product.prodNo}">
					<a id="updatelink" href="javascript:updateProduct();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeProduct();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
				</c:if>
			</td>
		</tr>
	</table>
	
</form:form>