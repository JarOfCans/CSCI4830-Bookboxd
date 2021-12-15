<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!doctype html>
<!--
  Material Design Lite
  Copyright 2015 Google Inc. All rights reserved.

  Licensed under the Apache License, Version 2.0 (the "License");
  you may not use this file except in compliance with the License.
  You may obtain a copy of the License at

      https://www.apache.org/licenses/LICENSE-2.0

  Unless required by applicable law or agreed to in writing, software
  distributed under the License is distributed on an "AS IS" BASIS,
  WITHOUT WARRANTIES OR CONDITIONS OF ANY KIND, either express or implied.
  See the License for the specific language governing permissions and
  limitations under the License
-->
<html lang="en">
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="description"
	content="A front-end template that helps you build fast, modern mobile web apps.">
<meta name="viewport"
	content="width=device-width, initial-scale=1.0, minimum-scale=1.0">
<title>Bookboxd - ${userProfile.username}'s Profile</title>

<!-- Add to homescreen for Chrome on Android -->
<meta name="mobile-web-app-capable" content="yes">
<link rel="icon" sizes="192x192" href="images/android-desktop.png">

<!-- Add to homescreen for Safari on iOS -->
<meta name="apple-mobile-web-app-capable" content="yes">
<meta name="apple-mobile-web-app-status-bar-style" content="black">
<meta name="apple-mobile-web-app-title" content="Material Design Lite">
<link rel="apple-touch-icon-precomposed" href="images/ios-desktop.png">

<!-- Tile icon for Win8 (144x144 + tile color) -->
<meta name="msapplication-TileImage"
	content="images/touch/ms-touch-icon-144x144-precomposed.png">
<meta name="msapplication-TileColor" content="#3372DF">

<link rel="shortcut icon" href="images/favicon.png">

<!-- SEO: If your mobile URL is different from the desktop URL, add a canonical link to the desktop page https://developers.google.com/webmasters/smartphone-sites/feature-phones -->
<!--
    <link rel="canonical" href="http://www.example.com/">
    -->

<link rel="stylesheet"
	href="https://fonts.googleapis.com/css?family=Roboto:regular,bold,italic,thin,light,bolditalic,black,medium&amp;lang=en">
<link rel="stylesheet"
	href="https://fonts.googleapis.com/icon?family=Material+Icons">
<link rel="stylesheet"
	href="https://code.getmdl.io/1.3.0/material.cyan-light_blue.min.css">
<link rel="stylesheet" href="dashboard.css">
<style>
#view-source {
	position: fixed;
	display: block;
	right: 0;
	bottom: 0;
	margin-right: 40px;
	margin-bottom: 40px;
	z-index: 900;
}
</style>
</head>
<body>
	<div
		class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<header
			class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
			<div class="mdl-layout__header-row">
				<span class="mdl-layout-title">Profile Viewer</span>
				<div class="mdl-layout-spacer"></div>
				<div
					class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
					<form action="Search" method="GET">
					<label class="mdl-button mdl-js-button mdl-button--icon"
						for="searchBox"> <i class="material-icons">search</i>
					</label>
					<div class="mdl-textfield__expandable-holder">
						<input class="mdl-textfield__input" type="text" id="searchBox" name="query">
						<label class="mdl-textfield__label" for="searchBox">Enter your query...</label>
						<input type="submit" style="display: none" />
					</div>
				</form>
			</div>
		</header>
		<div
			class="demo-drawer mdl-layout__drawer mdl-color--blue-grey-900 mdl-color-text--blue-grey-50">
			<header class="demo-drawer-header">
				<div class="demo-avatar-dropdown">
					<span>Hello again, ${user.username}</span>
				</div>
			</header>
			<nav class="demo-navigation mdl-navigation mdl-color--blue-grey-800">
				<a class="mdl-navigation__link" href="dashboard.jsp">
					<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">home</i>Dashboard</a>
				<c:choose>
					<c:when test="${isFriendsWithLoggedInUser}">
						<a class="mdl-navigation__link" href="">
							<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">person_remove</i>Remove Friend</a>
					</c:when>
					<c:when test="${friendRequestPending and not isFriendsWithLoggedInUser and userProfile.user_id ne user.user_id}">
						<a class="mdl-navigation__link" href="">
							<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">done</i>Accept Friend Request</a>
						<a class="mdl-navigation__link" href="">
							<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">not_interested</i>Decline Friend Request</a>
					</c:when>
					<c:when test="${not isFriendsWithLoggedInUser and not friendRequestPending}">
						<a class="mdl-navigation__link" href="">
							<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">person_add</i>Send Friend Request</a>
					</c:when>
				</c:choose>
				<div class="mdl-layout-spacer"></div>
				<a class="mdl-navigation__link" href="https://github.com/zklars/CSCI4830-Bookboxd">
					<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">info</i><span class="visuallyhidden">GitHub</span></a>
			</nav>
		</div>
		<main class="mdl-layout__content mdl-color--grey-100">
		<div class="mdl-grid demo-content">
			<div class="demo-charts mdl-cell mdl-cell--12-col mdl-grid">
				<h3>${userProfile.username}'s profile</h3>
				<br><br>
			</div>
			<div class="demo-charts mdl-cell mdl-cell--12-col mdl-grid">
				${userProfile.about_desc}
			</div>
			<div class="demo-graphs mdl-shadow--2dp mdl-color--white mdl-cell mdl-cell--8-col">
				${userProfile.username}'s lists
				<ul class="demo-list-icon mdl-list">
					<c:forEach items="${userLists}" var="item">
						<li class="mdl-list__item">
							<span class="mdl-list__item-primary-content">
							<i class="material-icons mdl-list__item-icon">view_list</i>
							<a href="ListViewer?list_id=${item.list_id}">${item.list_name}</a>
					  		</span>
						</li>
					</c:forEach>
				</ul>
			</div>
			<c:if test="${not empty userFriends}">
				<div class="demo-cards mdl-cell mdl-cell--4-col mdl-cell--8-col-tablet mdl-grid mdl-grid--no-spacing">
					<div class="demo-graphs mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--4-col-tablet mdl-cell--12-col-desktop">
						${userProfile.username}'s friends
						<ul class="demo-list-icon mdl-list">
							<c:forEach items="${userFriends}" var="item">
								<li class="mdl-list__item">
									<span class="mdl-list__item-primary-content">
									<i class="material-icons mdl-list__item-icon">sentiment_very_satisfied</i>
									<a href="ViewProfile?user_id=${item.user_id}">${item.username}</a>
									</span>
								</li>
							</c:forEach>
						</ul>
					</div>
					<div class="demo-separator mdl-cell--1-col"></div>
					<!-- <div class="demo-graphs mdl-card mdl-shadow--2dp mdl-cell mdl-cell--4-col mdl-cell--3-col-tablet mdl-cell--12-col-desktop">
						Friend Requests Go Here
					</div> -->
				</div>
			</c:if>
		</div>
		</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
