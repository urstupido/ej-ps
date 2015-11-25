<%@ page language="java"
	pageEncoding="UTF-8" contentType="text/html;charset=utf-8"%>
<%@ include file="/sample/common/taglibs.jsp"%>
<script language="javascript" src="<c:url value='/sample/javascript/common.js'/>"></script>
<div id="left">
<style type="text/css">

.menus {
	background-image: url("<c:url value='/sample/images/top_menus.png'/>");
}

.depth01 a:hover {
	background: #dadada
		url("<c:url value='/sample/images/menu_hover.png'/>") left top
		no-repeat;
}

.Depth02on {
	font-size: 12px;
	line-height: 25px;
	color: #505050;
	font-weight:normal;
	text-indent: 19px;
	background-image: url(<c:url value='/sample/images/left/leftMenuDep02_on.gif'/>);
	background-repeat:no-repeat;
  	}

	.Depth02off {
	 font-size: 12px;
	line-height: 25px;
	color: #505050;
	font-weight:normal;
	text-indent: 19px;
	background-image: url(<c:url value='/sample/images/left/leftMenuDep02_off.gif'/>);
	background-repeat:no-repeat;
  	}

	.Depth03 {
	font-size: 12px;
	line-height: 20px;
	color: #505050;
	font-weight:normal;
	text-indent: 14px;
	background-image: url(<c:url value='/sample/images/left/leftMenuDep03Bg.gif'/>);
	background-repeat:no-repeat;
 	}

	.DepthEnd {
	background-image: url(<c:url value='/sample/images/left/space_line.gif'/>);
	line-height: 5px;
	background-repeat:no-repeat;
	}
	
	.layer_submenu_bg {
	background-image:  url(<c:url value='/sample/images/left/menuLayerBg.gif'/>);
	background-position: right;
	background-repeat: repeat;
	text-align: center;
	}

</style>
<table border="0" cellpadding="0" cellspacing="0" bgcolor="#eeeeee">
	<tr>
		<td>
		<table width="177" border="0" cellpadding="0" cellspacing="0"
			bgcolor="#FFFFFF">
			<tr>
				<td height="23" bgcolor="#eeeeee" class="menus"></td>
			</tr>
			<!--Add new menu here-->
			<tr>
				<td valign="top">
				<table id="Main1" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu1" class="Depth02off"><a
							href="javascript:toggle(1)">고객관리</a></td>
					</tr>
				</table>

				<div ID="sub1" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosCustomerFinder.do?method=list">고객목록</a></td>
					</tr>
				</table>
				</div>
				</td>
			</tr>
			<!--hibernate-menu-START-->

			<tr>
				<td valign="top">
				<table id="Main2" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu2" class="Depth02off"><a
							href="javascript:toggle(2)">상품관리</a></td>
					</tr>
				</table>

				<div ID="sub2" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProductFinder.do?method=list">상품목록</a></td>
					</tr>
				</table>
				
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProduct????????.do?method=list">상품등록</a></td>
					</tr>
				</table>
				</div>
				
				
				</td>
			</tr>
			
			
			<tr>
				<td valign="top">
				<table id="Main3" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu3" class="Depth02off"><a
							href="javascript:toggle(3)">플랜관리</a></td>
					</tr>
				</table>

				<div ID="sub3" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProductFinder.do?method=list">플랜목록</a></td>
					</tr>
				</table>
				
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProduct????????.do?method=list">플랜등록</a></td>
					</tr>
				</table>
				</div>
				
				
				</td>
			</tr>
			
			
			<tr>
				<td valign="top">
				<table id="Main4" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu4" class="Depth02off"><a
							href="javascript:toggle(4)">가입자관리</a></td>
					</tr>
				</table>

				<div ID="sub4" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProductFinder.do?method=list">가입자목록</a></td>
					</tr>
				</table>
				
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProduct????????.do?method=list">가입자등록</a></td>
					</tr>
				</table>
				</div>
				
				
				</td>
			</tr>
			
			<tr>
				<td valign="top">
				<table id="Main5" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu5" class="Depth02off"><a
							href="javascript:toggle(5)">사무담당자관리</a></td>
					</tr>
				</table>

				<div ID="sub5" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProductFinder.do?method=list">사무담당자목록</a></td>
					</tr>
				</table>
				
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProduct????????.do?method=list">사무담담자등록</a></td>
					</tr>
				</table>
				</div>
				
				
				</td>
			</tr>
			
			<tr>
				<td valign="top">
				<table id="Main6" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu6" class="Depth02off"><a
							href="javascript:toggle(6)">운용비율관리</a></td>
					</tr>
				</table>

				<div ID="sub6" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProductFinder.do?method=list">운용비율목록</a></td>
					</tr>
				</table>
				
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProduct????????.do?method=list">운용비율등록</a></td>
					</tr>
				</table>
				</div>
				
				
				</td>
			</tr>
			
			<tr>
				<td valign="top">
				<table id="Main7" border="0" cellspacing="0" cellpadding="0"
					width="177">
					<tr>
						<td id="menu7" class="Depth02off"><a
							href="javascript:toggle(7)">상품선정관리</a></td>
					</tr>
				</table>

				<div ID="sub7" style="DISPLAY: none">
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProductFinder.do?method=list">상품선정목록</a></td>
					</tr>
				</table>
				
				<table border="0" cellspacing="0" cellpadding="0" width="177">
					<tr>
						<td class="Depth03"><a
							href="${ctx}/ntosProduct????????.do?method=list">상품선정등록</a></td>
					</tr>
				</table>
				</div>
				
				
				</td>
			</tr>
			
			
			
			<!--hibernate-menu-END-->
		</table>
		</td>
	</tr>
</table>
</div>
