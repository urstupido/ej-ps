<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
    <%@ include file="/sample/common/meta.jsp" %>
    <title> <spring:message code="productDetail.title"/> </title>
    <meta name="heading" content="<spring:message code='productDetail.heading'/>"/>    
	<link rel="stylesheet" href="<c:url value='/sample/css/admin.css'/>" type="text/css">                    
	<script type="text/javascript">
		function updateProductSelect() {
		    document.productSelectForm.action="<c:url value='/ntosProductSelect.do?method=update'/>";
		    document.productSelectForm.submit();
		}
		
		function removeProductSelect(){	
			if(confirmDelete('product select')) {
			    document.productSelectForm.action="<c:url value='/ntosProductSelect.do?method=remove'/>";
			    document.productSelectForm.submit();
			}	    
		}
		
		function goBack(){
			window.history.back();
		}
		function searchContract(){
			window.open("${ctx}/ntosContractFinder.do?method=popup", "popup", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");			
		}
		
		function searchProduct(){
			var contNo = $('#contNo').val(); 
			if ($('#contNo').val()=='') {
				alert("상품검색하기에 앞서 계약을 먼저 선택해주세요!");
				return;
			}
			window.open("${ctx}/ntosProductFinder.do?method=popup&contNo="+contNo, "popup", "left=150, top = 150, width=650, height=500, resizable=no, scrollbars=no, status=no;");
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
					Add ProductSelect Information
				</td>
			</tr>
		</table>
		</td>
	</tr>
</table>

	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 13px;">
		<tr>
			<td width="150" class="ct_td" ><spring:message code="productSelect.contNo" />&nbsp;*</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan ="7">
				<input type="text" readonly="readonly" class="ct_input_g" id="contNo" name="contNo"/>
				<input type="button" value="계약찾기" onclick="searchContract()">
			</td>
			
		</tr>
		<tr>
			<td height="1" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
			<td width="150" class="ct_td" > <spring:message code="productSelect.prodNo" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan ="7">
				<input type="text" readonly="readonly" class="ct_input_g" id="prodNo"/>
				<input type="button" value="상품찾기" onclick="searchProduct()">
			</td>
		</tr>
		<tr>
			<td height="1" bgcolor="D6D6D6"></td>
		</tr>
		
		<tr>
		 	<td width="150" class="ct_td" ><spring:message code="product.prod_lcls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			
			</td>
			<td width="150" class="ct_td" ><spring:message code="product.prod_mcls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			
			</td>
			<td width="150" class="ct_td" ><spring:message code="product.prod_scls_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			
			</td>			
		</tr>
		<tr>
			<td height="1" bgcolor="D6D6D6"></td>
		</tr>
		<%-- <tr>
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_entr_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01">
			</td> 
		 	<td width="150" class="ct_td" colspan="2"><spring:message code="product.prod_sell_end_dt" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			
			<td class="ct_write01">
				
			</td>
		</tr>
		
		<tr>
			<td height="1" colspan="3" bgcolor="D6D6D6"></td>
		</tr> --%>
		
		<tr>
		 	<td width="150" class="ct_td" ><spring:message code="product.prod_offr_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			
			<td class="ct_write01">
			</td> 
			
		 	<td width="150" class="ct_td" ><spring:message code="product.asts_mng_org_c" /> *</td>
			<td bgcolor="D6D6D6" width="1"></td>
			<td class="ct_write01" colspan="4">
			
			</td> 
		</tr>
		
	 	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td height="24" colspan="2" align="center">
					<a href="javascript:goBack();"><img src="<c:url value='/sample/images/btn_back.png'/>" width="64" height="18" border="0" /></a>
					<a id="updatelink" href="javascript:updateProductSelect();"><img src="<c:url value='/sample/images/btn_update.png'/>" width="64" height="18" border="0" /></a>
					<script type="text/javascript">
					    Spring.addDecoration(new Spring.ValidateAllDecoration({elementId:'updatelink', event:'onclick'}));
					</script>
					<a href="javascript:removeProductSelect();"><img src="<c:url value='/sample/images/btn_delete.png'/>" width="64" height="18" border="0" /></a>
					<input type="reset" value="RESET">
			</td>
		</tr>
	</table>
