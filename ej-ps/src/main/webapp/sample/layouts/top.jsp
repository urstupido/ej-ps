<%@ page language="java" pageEncoding="UTF-8"
	contentType="text/html;charset=utf-8"%>
<%@ include file="/sample/common/taglibs.jsp"%>


<div id="Topapplication" style="margin:0">
<header class="cd-main-header">
		
		<a class="cd-logo" href="http://localhost:8080/ej-ps/">Ntos</a>
		<a class="cd-logo" href="http://localhost:8080/ej-ps/"> <img src="<c:url value='/sample/css/cd-logo.svg'/>"></a>

		<ul class="cd-header-buttons">
			<li><a class="cd-search-trigger" href="#cd-search"><span></span></a></li>
			<li><a class="cd-nav-trigger" href="#cd-primary-nav"><span></span></a></li>
		</ul>
		<!-- cd-header-buttons -->
	</header>


	<main class="cd-main-content">
	</main>
	<div class="cd-overlay"></div>
	<nav class="cd-nav">
		<ul id="cd-primary-nav" class="cd-primary-nav is-fixed">
			<li class="has-children"><a href="http://codyhouse.co/?p=409">View</a>

				<ul class="cd-secondary-nav is-hidden">
					<li class="go-back"><a href="#0">Menu</a></li>
					<li class="has-children"><a href="http://codyhouse.co/?p=409">상품관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosProductFinder.do?method=list">상품목록</a></li>
							<li><a href="${ctx}/ntosProduct.do?method=createView">상품등록</a></li>
						</ul></li>
					<li class="has-children"><a href="http://codyhouse.co/?p=409">플랜(계약)관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosContractFinder.do?method=list">계약목록</a></li>
							<li>계약등록</li>
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

					<li class="has-children"><a href="http://codyhouse.co/?p=409">가입자관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosCustContractFinder.do?method=list">가입자목록</a></li>
							<li>가입자등록</li>
						</ul></li>
					<li class="has-children"><a href="http://codyhouse.co/?p=409">고객관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosCustomerFinder.do?method=list">고객목록</a></li>
							<li><a href="${ctx}/ntosCustomer.do?method=createView">고객등록</a></li>
						</ul></li>

					<li class="has-children"><a href="http://codyhouse.co/?p=409">상품배분비율관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosProductDistributionFinder.do?method=list">상품배분비율</a></li>
						</ul></li>
					<li class="has-children"><a href="http://codyhouse.co/?p=409">상품선정관리</a>

						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosProductSelectFinder.do?method=list">상품선정목록</a></li>
							<li>상품선정등록</li>
						</ul></li>
					<li class="has-children"><a href="http://codyhouse.co/?p=409">사무담당자관리</a>
						<ul class="is-hidden">
							<li class="go-back"><a href="#0">back</a></li>
							<li><a href="${ctx}/ntosChargemanFinder.do?method=list">사무담당자목록</a></li>
							<li>사무담당자등록</li>
						</ul></li>
				</ul></li>

			<li class="has-children"><a href="http://codyhouse.co/?p=409">Registration</a>

				<ul class="cd-nav-gallery is-hidden">
					<li class="go-back"><a href="#0">back</a></li>
					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img01_r.png'/>" alt="상품등록">
							<h3>상품등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img.jpg'/>" alt="고객등록">
							<h3>고객등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img.jpg'/>" alt="플랜등록">
							<h3>플랜등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img.jpg'/>" alt="가입자등록">
							<h3>가입자등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img.jpg'/>" alt="사무담당자등록">
							<h3>사무담당자등록</h3>
					</a></li>


					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img.jpg'/>" alt="운영비율등록">
							<h3>운영비율등록</h3>
					</a></li>

					<li><a class="cd-nav-item" href=""> <img
							src="<c:url value='/sample/images/img.jpg'/>" alt="상품선정등록">
							<h3>상품선정등록</h3>
						</a>
					</li>
					
					
				</ul>
			</li>
			<li class="has-children">
			<c:choose><c:when test="${userId!=null}">
			<li class="logmsg"><img src="<c:url value='/sample/images/usericon.png'/>" style="margin-top: 23px;"> </li>
			<li><div class="user_name"><c:out value='${userId}' />님&nbsp;&nbsp;</div></li>
			<li class="action-btn"><a href="${ctx}/logout.do" >Logout</a></li>
			</c:when>
			<c:otherwise>
			<li class="action-btn"><a href="${ctx}/sample/login.jsp">Login</a></li>
			</c:otherwise>
			</c:choose>
			</li>
		</ul>
	</nav> 


	<div id="cd-search" class="cd-search">
		<input type="search" placeholder="검색하세요">
	</div>
</div>
