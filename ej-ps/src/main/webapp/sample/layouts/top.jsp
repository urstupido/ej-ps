<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ include file="/sample/common/taglibs.jsp"%>

<div id="Topapplication" style="margin:0">
<header class="cd-main-header">
		
		<a class="cd-logo" href="http://localhost:8080/ej-ps/">Ntos</a>
		<a id="top_menu1" class="cd-logo" href="http://localhost:8080/ej-ps/"> <img src="<c:url value='/sample/css/cd-logo.svg'/>"></a>

		<ul class="cd-header-buttons">
			<li><a class="cd-search-trigger" href="#cd-search"><span></span></a></li>
			<li><a class="cd-nav-trigger" href="#cd-primary-nav"><span></span></a></li>
		</ul>
	</header>

	<main class="cd-main-content">
	</main>
	<div class="cd-overlay"></div>
	<nav class="cd-nav">
		<ul id="cd-primary-nav" class="cd-primary-nav is-fixed">
			<li id="top_menu2" class="has-children"><a href="">NAVIGATION</a>
				<ul class="cd-secondary-nav is-hidden">
					<li class="go-back"><a href="#0">Menu</a></li>
					<li class="has-children"><a href="#">상품관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosProductFinder.do?method=list">상품목록</a></li>
							<li><a href="${ctx}/ntosProduct.do?method=createView">상품등록</a></li>

						</ul></li>

					<li class="has-children"><a href="#0">플랜(계약)관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosContractFinder.do?method=list">계약목록</a></li>
							<li><a href="${ctx}/ntosContract.do?method=createView">계약등록</a></li>
							<!-- <li class="has-children">
								<a href="#0">계약등록</a>

								<ul class="is-hidden">
									<li class="go-back"><a href="#0">Bottoms</a></li>
									<li class="see-all"><a href="http://codyhouse.co/?p=409">All Jeans</a></li>
									<li><a href="http://codyhouse.co/?p=409">Ripped</a></li>
									<li><a href="http://codyhouse.co/?p=409">Skinny</a></li>
									<li><a href="http://codyhouse.co/?p=409">Slim</a></li>
									<li><a href="http://codyhouse.co/?p=409">Straight</a></li>
								</ul>
							</li> -->
						</ul></li>

					<li class="has-children"><a href="#0">가입자관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosCustContractFinder.do?method=list">가입자목록</a></li>
							<li><a href="${ctx}/ntosCustContract.do?method=createView">가입자등록</a></li>
						</ul></li>

					<li class="has-children"><a href="#0">고객관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a id="middle_menu1" href="${ctx}/ntosCustomerFinder.do?method=list">고객목록</a></li>
							<li><a href="${ctx}/ntosCustomer.do?method=createView">고객등록</a></li>
						</ul></li>

					<li class="has-children"><a href="#0">상품배분비율관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosProductDistributionFinder.do?method=list">상품배분비율</a></li>
						</ul></li>


					<li class="has-children"><a href="#0">상품선정관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosProductSelectFinder.do?method=list">상품선정목록</a></li>
							<li><a href="${ctx}/ntosProductSelect.do?method=createView">상품선정등록</a></li>
						</ul></li>

					<li class="has-children"><a href="#0">사무담당자관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosChargemanFinder.do?method=list">사무담당자목록</a></li>
							<li><a href="${ctx}/ntosChargeman.do?method=createView">사무담당자등록</a></li>
						</ul></li>
				</ul></li>

			<li id="top_menu3" class="has-children"><a href="http://codyhouse.co/?p=409">REGISTRATION</a>

				<ul class="cd-nav-gallery is-hidden">
					<li class="go-back"><a href="#0">back</a></li>
					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image01_regi.png'/>" alt="상품등록">
							<h3>상품등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image02_regi.png'/>" alt="고객등록">
							<h3>고객등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image03_regi.png'/>" alt="플랜등록">
							<h3>플랜등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image04_regi.png'/>" alt="가입자등록">
							<h3>가입자등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image05_regi.png'/>" alt="사무담당자등록">
							<h3>사무담당자등록</h3>
					</a></li>


					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image06_regi.png'/>" alt="운영비율등록">
							<h3>운영비율등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/image07_regi.png'/>" alt="상품선정등록">
							<h3>상품선정등록</h3>
					</a></li>


				</ul></li>
			<li id="top_menu4" class="has-children"><c:choose>
					<c:when test="${userId!=null}">
						<li class="logmsg"><img
							src="<c:url value='/sample/images/usericon.png'/>"
							style="margin-top: 23px;"></li>
						<li><div class="user_name">
								<c:out value='${userId}' />
								님&nbsp;&nbsp;
							</div></li>
						<li class="action-btn"><a href="${ctx}/sample/logout.do">Logout</a></li>
					</c:when>
					<c:otherwise>
						<li class="action-btn"><a href="${ctx}/sample/login.jsp">Login</a></li>
					</c:otherwise>
				</c:choose></li>
			<%-- <c:choose>
				<c:when test="${userId!=null}">
				<td align="right">
				<c:out value='${userId}' />님 환영합니다! 
				<a href="${ctx}/logout.do">
				<li class="action-btn"><a href="#0">Logout</a></li>
				</a>
				</td>
				</c:when>
				<c:otherwise>
				<td align="right">
				<!-- 로그인 해주세요!  -->
				<a href="${ctx}/sample/login.jsp">
				<li class="action-btn"><a href="#0">Login</a></li>
				</a>
				</td>
				</c:otherwise>
				</c:choose> --%>
		</ul>
		<!-- primary-nav -->
	</nav>
	<!-- cd-nav -->

	<!-- <div id="cd-search" class="cd-search">
		<form>
			<input type="search" placeholder="검색하세요">
		</form>
	</div> -->


	<%-- <table width="100%" height="79" border="0" cellpadding="0" cellspacing="0">
  <tr>  
    <td width="450" height="48" align="left" valign="middle" class="toptitle">
    	<a href="${ctx}" title="Go Home">PS System</a></td>
    <td align="right" valign="top">
    	<img src="<c:url value='/sample/images/top_bg_movie.jpg'/>" width="350" height="48" border="0"/></td>
  </tr>
  <tr>
    <td height="31" align="right" valign="middle" style="padding-right:20px"></td>
    <td align="right" valign="middle">
		<table border="0" cellspacing="0" cellpadding="0">
			<tr>
				<c:choose>
				<c:when test="${userId!=null}">
				<td align="right">
				<c:out value='${userId}' />님 환영합니다! 
				<a href="${ctx}/logout.do">
				<img src="<c:url value='/sample/images/btn_logout.gif'/>" >
				</a>
				</td>
				</c:when>
				<c:otherwise>
				<td align="right">
				로그인 해주세요! 
				<a href="${ctx}/sample/login.jsp">
				<img src="<c:url value='/sample/images/btn_login.gif'/>" >
				</a>
				</td>
				</c:otherwise>
				</c:choose>
			</tr>
		</table>
	</td>
  </tr>
</table> --%>
</div>
