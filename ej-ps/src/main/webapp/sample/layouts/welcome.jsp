<%@ page language="java" pageEncoding="UTF-8" contentType="text/html;charset=utf-8" %>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<script type="text/javascript" src="<c:url value='/sample/javascript/jquery-2.1.1.js'/>"></script>
<link rel="stylesheet" href="<c:url value='/sample/css/welcome.css'/>" type="text/css">


<div id="body">

<div class="cd-nugget-info">
		<h1>WELCOME TO NTOS</h1>
		<button id="cd-tour-trigger" class="cd-btn">Start tour</button>
	</div>

	<ul class="cd-tour-wrapper">
		<li class="cd-single-step">
			<span>Step 1</span>

			<div class="cd-more-info bottom">
				<h2>Step Number 1</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Modi alias animi molestias in, aperiam.</p>
				<img src="img/step-1.png" alt="step 1">
			</div>
		</li> <!-- .cd-single-step -->

		<li class="cd-single-step">
			<span>Step 2</span>

			<div class="cd-more-info top">
				<h2>Step Number 2</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Officia quasi in quisquam.</p>
				<img src="img/step-2.png" alt="step 2">
			</div>
		</li> <!-- .cd-single-step -->

		<li class="cd-single-step">
			<span>Step 3</span>

			<div class="cd-more-info right">
				<h2>Step Number 3</h2>
				<p>Lorem ipsum dolor sit amet, consectetur adipisicing elit. Optio illo non enim ut necessitatibus perspiciatis, dignissimos.</p>
				<img src="img/step-3.png" alt="step 3">
			</div>
		</li> <!-- .cd-single-step -->
	</ul> <!-- .cd-tour-wrapper -->

	<div class="cd-app-screen"></div>

	<div class="cd-cover-layer"></div>
</div>