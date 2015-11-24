<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>
<head>
<%@ include file="/sample/common/meta.jsp" %>
<title><spring:message code="movieList.title"/></title>
<meta name="heading" content="<spring:message code='movieList.heading'/>"/>       
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
	var rowNum 		= 3;			//그리드 한페이지에 표시되는 데이터 수.
	var sortname 	= 'MOVIE_ID';		//정렬컬럼.
	var sortorder 	= 'ASC';		//정렬방식

	if( '${movie.totalRecordCount}' != '' && '${movie.totalRecordCount}' > 0 ) {
		// SVO에 데이터가 들어있을 경우에 각 변수들의 값을 SVO의 값들로 셋팅
		rowNum		= '${movie.totalRecordCount}';
		page		= '${movie.currentPageNo}';
		sortname 	= '${movie.sidx}';
		sortorder 	= '${movie.sord}';
	}

	var movieGrid = jQuery("#movieListGrid").jqGrid({
		url			: "<c:url value='/jqueryMovieListAjax.do'/>",
		datatype	: "json",
		mtype		: "POST",
		colNames : [
		    'movieId'
			,'<spring:message code="movie.genre" />'
			,'<spring:message code="movie.title" />'
			,'<spring:message code="movie.director" />'
			,'<spring:message code="movie.actors" />'
			,'<spring:message code="movie.ticketPrice" />'
			,'<spring:message code="movie.releaseDate" />'
		],
		jsonReader: {repeatitems: false},
		colModel : [
			{name : 'movieId', index : 'MOVIE_ID', width: 200, key:true, hidden: true},
			{name : 'genre.name', index : 'NAME', width: 200,  sortable: false},
			{name : 'title', index : 'TITLE', width: 300, sortable: false},
			{name : 'director', index : 'DIRECTOR', width: 300, sortable: false},
			{name : 'actors', index : 'ACTORS', width: 400, sortable: false},
			{name : 'ticketPrice', index : 'TICKET_PRICE', width: 200, sortable: false},
			{name : 'releaseDate', index : 'RELEASE_DATE', width: 200, sortable: false},
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
				jQuery("#movieListGrid").setSelection(rowId, false);
				return false;
			}
			return true;
		},
		onSelectRow: function(rowId) {
			$( "#dialog:ui-dialog" ).dialog( "destroy" );
			$( "#movieAddDiaBox" ).dialog({
				resizable: false,
				width:500,
				height:350,
				modal: true,
				title: "Update Movie",
				open: function(event, ui) {
		            var $buttonPane = $(this).next();
		            $buttonPane.find("button").addClass("nor_button");

		            $( "#movieAddDiaBox" )
		            	.empty()
		            	.load("<c:url value='/jqueryMovieUpdateView.do?movieId='/>"+rowId);
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
		movieGrid.jqGrid('setGridParam', {datatype:'json'})
        .trigger('reloadGrid', [{page:1}]);
		$("#searchForm #page").remove();
	});

	$("#btnAdd").click(function(e){
		e.preventDefault();
		$( "#dialog:ui-dialog" ).dialog( "destroy" );
		$( "#movieAddDiaBox" ).dialog({
			resizable: false,
			width:500,
			height:350,
			modal: true,
			title: "Add New Movie",
			open: function(event, ui) {
	            var $buttonPane = $(this).next();
	            $buttonPane.find("button").addClass("nor_button");

	            $( "#movieAddDiaBox" )
	            	.empty()
	            	.load("<c:url value='/jqueryMovieCreateView.do'/>");
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
				<td height="24" class="ct_ttl01" style="padding-left: 12px">Search List of Movie</td>
			</tr>
		</table>
		</td>
	</tr>
</table>
<!--end of title-->

<form:form modelAttribute="movie" method="post" name="searchForm" id="searchForm">
	<!--begin of search-->
	<table width="100%" border="0" cellspacing="0" cellpadding="0" style="margin-top: 10px; vertical-align: center;">
		<tr>
			<td align="right">
				<label><spring:message code="movie.title" />: <form:input path="title" cssClass="ct_input_g" cssErrorClass="text medium error" maxlength="50" /></label>
				
			</td>
			<td align="right" width="180">
				<spring:message code="movie.nowPlaying" />: 
					<form:select path="nowPlaying" cssClass="ct_input_g" cssStyle="width:80px;">
						<form:option value="Y">Playing</form:option>
						<form:option value="N">Not playing</form:option>
					</form:select>
			</td>
			
			<td align="right" width="35">
				<a id="btnSearch" href="#"><img src="<c:url value='/sample/images/btn_search.png'/>" width="25" height="18" border="0" align="middle"/></a>
			</td>
		</tr>
	</table>
	<!--end of search-->
	
	<!-- begin of jqGrid  -->
	<div class="" style="padding-top: 10px;">
		<table id="movieListGrid" class="scroll" cellpadding="0" cellspacing="0">
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

<div id="movieAddDiaBox"></div>