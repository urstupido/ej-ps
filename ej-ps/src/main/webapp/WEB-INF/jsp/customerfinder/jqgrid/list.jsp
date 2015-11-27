<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp" %>
<link rel="stylesheet" href="<c:url value='/sample/css/style.css'/>" type="text/css">
<link rel="stylesheet" href="<c:url value='/sample/css/jquery-ui-1.10.4.custom.css'/>" type="text/css">
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sample/javascript/jqgrid/ui.jqgrid.css" />
<link rel="stylesheet" type="text/css" href="${pageContext.request.contextPath}/sample/javascript/jqgrid/plugins/ui.multiselect.css" />
<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-1.10.2.min.js'/>"></script>
<script type="text/javascript" src="<c:url value='/sample/javascript/CommonScript.js'/>"></script>    
<script type="text/javascript" src="${pageContext.request.contextPath}/sample/javascript/jquery-ui-1.10.4.custom.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/sample/javascript/jqgrid/jquery.jqGrid.min.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/sample/javascript/jqgrid/i18n/grid.locale-en.js"></script>
<script type="text/javascript" src="${pageContext.request.contextPath}/sample/javascript/jqgrid/plugins/ui.multiselect.js"></script>
<script type="text/javascript">
jQuery(document).ready(function() {
	var page 		= 1;			//현재 페이지.
	var rowNum 		= 10;			//그리드 한페이지에 표시되는 데이터 수.
	var sortname 	= 'CUST_NO';		//정렬컬럼.
	var sortorder 	= 'ASC';		//정렬방식

	if( '${customer.totalRecordCount}' != '' && '${customer.totalRecordCount}' > 0 ) {
		// SVO에 데이터가 들어있을 경우에 각 변수들의 값을 SVO의 값들로 셋팅
		rowNum		= '${customer.totalRecordCount}';
		page		= '${customer.currentPageNo}';
		sortname 	= '${customer.sidx}';
		sortorder 	= '${customer.sord}';
	}

	var customerGrid = jQuery("#customerListGrid").jqGrid({
		url			: "<c:url value='/jqgridCustomerList.do'/>",
		datatype	: "json",
		mtype		: "POST",
		colNames : [
		    'No'
			,'<spring:message code="customer.no" />'
			,'<spring:message code="customer.userTc" />'
			,'<spring:message code="customer.cnm" />'
			,'<spring:message code="customer.lastChngDt" />'
		],
		jsonReader: {repeatitems: false},
		colModel : [
			{name : 'no', index : 'NO', width: 200, sortable:true},
			{name : 'cusNo', index : 'CUS_NO', width: 200, key:true, sortable: true},
			{name : 'codeInfo.codeName', index : 'CODE_NAME', width: 300, sortable: true},
			{name : 'cnm', index : 'CNM', width: 300, sortable: true},
			{name : 'lastChngDt', index : 'LAST_CHNG_DT', width: 300, sortable: true}
		],
		autowidth: true,
		viewrecords : true,
		emptyrecords: '데이터가 없습니다.',
		sortname: sortname,	// 정렬 칼럼
		sortorder: sortorder,
		caption		: false,
		height : 'auto',
		multiselect : false,
		sortable : false,
		gridview: true,
		pager: jQuery('#pager'),
		page: page,	
		rowNum: rowNum,
		pgtext: "{0} / {1}",
		loadtext: "Loading...",
		jsonReader: {
			root		: "resultPage.list",
			page		: "resultPage.currentPage",
			total		: "resultPage.maxPage",
			records		: "resultPage.totalCount",
	   		repeatitems	: false,
	   		id			: ""
		},
		serializeGridData: function(postData) {
			var formData = {};
			var serializedArray = $("#searchForm").serializeArray();
			for (var i = 0, len = serializedArray.length; i < len; i++) {
				formData[serializedArray[i].name] = serializedArray[i].value;
			}
			
			return $.extend(postData, formData);
		},
		beforeSelectRow : function(rowId, e) {
			if ($(e.target).is(":checkbox")) {
				jQuery("#customerListGrid").setSelection(rowId, false);
				return false;
			}
			return true;
		},
		onSelectRow: function(rowId) {
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
			$( "#customerAddDiaBox" ).dialog({
				resizable: false,
				width:500,
				height:350,
				modal: true,
				title: "Update Customer",
				open: function(event, ui) {
		            var $buttonPane = $(this).next();
		            $buttonPane.find("button").addClass("nor_button");

		            $( "#customerAddDiaBox" )
		            	.empty()
		            	.load("<c:url value='/jqgridCustomerUpdateView.do?cusNo='/>"+rowId);
				}
			});
	    },
	    loadComplete : function(data) {
	    	
    	}
	});
	$("#btnSearch").click( function(e) {
		e.preventDefault();
		var hiddenPage = "<input type='hidden' name='page' id='page' value='1'/>";
		$("#searchForm").append(hiddenPage);
		customerGrid.jqGrid('setGridParam', {datatype:'json'})
        .trigger('reloadGrid', [{page:1}]);
		$("#searchForm #page").remove();
	});

	$("#btnAdd").click(function(e){
		e.preventDefault();
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#customerAddDiaBox" ).dialog({
			resizable: false,
			width:500,
			height:350,
			modal: true,
			title: "Add New Customer",
			open: function(event, ui) {
	            var $buttonPane = $(this).next();
	            $buttonPane.find("button").addClass("nor_button");

	            $( "#customerAddDiaBox" )
	            	.empty()
	            	.load("<c:url value='/jqgridCustomerCreateView.do'/>");
			}
		});
	});
	
});
</script>
</head>
<!--************************** begin of contents *****************************-->
<!--begin of title-->
<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
	<tr>
		<td height="24">
		<table width="100%" height="24" border="0" cellpadding="0" cellspacing="0">
			<tr>
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of Customer</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="customer" method="post" name="searchForm" id="searchForm">
	<!--begin of search-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
		<tr>
			<td align="right">
				<form:select path="codeInfo.code" cssClass="ct_input_g" cssStyle="width:80px;">
					<form:option value="">전체</form:option>
					<form:option value="1">사용자</form:option>
					<form:option value="2">가입자</form:option>
				</form:select>
				
				<form:select path="searchCondition">
					<form:option value="고객번호">고객번호</form:option>
					<form:option value="고객명">고객명</form:option>
				</form:select>
				
				<form:input path = "searchKeyword" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50" />
			</td>
			<td align="right" width="35">
				<a id="btnSearch" href="#"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
			<input type="hidden" id="cnm" name="cnm"/>
			<input type="hidden" id="cusNo" name="cusNo"/>
			
		</tr>
	</table>
	<!--end of search-->
	
	<!-- begin of jqGrid  -->
	<div class="" style="padding-top: 10px;">
		<table id="customerListGrid" class="scroll" cellpadding="0" cellspacing="0">
			<tr><td/></tr>
		</table>
		<div id="pager" class="scroll" style="text-align:center;"></div>
	</div>
	
	<!-- end of jqGrid  -->
	
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px;">
		<tr>
			<td align="right"><a id="btnAdd" href='#'><img
				src="<c:url value='/sample/images/btn_add.png'/>" width="64" height="18" border="0" /></a></td>
		</tr>
	</table>
</form:form>

<div id="customerAddDiaBox"></div>