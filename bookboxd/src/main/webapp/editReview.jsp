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
<title>Bookboxd - Edit Review</title>

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
	<div class="demo-layout mdl-layout mdl-js-layout mdl-layout--fixed-drawer mdl-layout--fixed-header">
		<header class="demo-header mdl-layout__header mdl-color--grey-100 mdl-color-text--grey-600">
			<div class="mdl-layout__header-row">
				<span class="mdl-layout-title">Edit Review</span>
				<div class="mdl-layout-spacer"></div>
				<div class="mdl-textfield mdl-js-textfield mdl-textfield--expandable">
				<form>
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
				<!-- TODO: may want to add warning that this won't save any choices -->
				<a class="mdl-navigation__link" href="ViewProfile?user_id=${user.user_id}">
					<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">account_circle</i>Profile</a>
				<div class="mdl-layout-spacer"></div>
				<a class="mdl-navigation__link" href="https://github.com/zklars/CSCI4830-Bookboxd">
					<i class="mdl-color-text--blue-grey-400 material-icons" role="presentation">info</i><span class="visuallyhidden">GitHub</span></a>
			</nav>
		</div>
		<main class="mdl-layout__content mdl-color--grey-100">
		<div class="mdl-grid demo-content">
			<div class="edit-review mdl-color--white mdl-shadow--2dp mdl-cell--5-col" style="padding: 16px;">
				<form action="EditReviewServlet" method="post">
					Edit Review:
					<p>
						<input type="range" value="3" min="1" max="5" oninput="this.nextElementSibling.value = this.value">
						<output>3</output>
					</p>
					<div class="mdl-textfield mdl-js-textfield">
    					<textarea class="mdl-textfield__input" type="text" rows= "3" name="review" maxlength="255"></textarea>
   						<label class="mdl-textfield__label" for="sample5">255 Character Max</label>
  					</div>
					<br><br>
					<!-- TODO: make it select the option that the user has picked out already -->
					Review Privacy Setting:
					<br>
					<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="public">
						<input type="radio" id="public" class="mdl-radio__button" name="reviewPrivacy" value="public">
						<span class="mdl-radio__label">Public</span>
					</label>
					&nbsp;&nbsp;
					<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="private">
					  	<input type="radio" id="private" class="mdl-radio__button" name="reviewPrivacy" value="private">
					  	<span class="mdl-radio__label">Private</span>
					</label>
					&nbsp;&nbsp;
					<label class="mdl-radio mdl-js-radio mdl-js-ripple-effect" for="friends">
					  	<input type="radio" id="friends" class="mdl-radio__button" name="reviewPrivacy" value="friends">
					  	<span class="mdl-radio__label">Friends Only</span>
					</label>
					<br><br>
					<a class="mdl-button mdl-js-button mdl-button--raised" href="dashboard.jsp">Cancel</a>
  					&nbsp;&nbsp;
					<button class="mdl-button mdl-js-button mdl-button--raised mdl-button--colored" type="submit">Save Changes</button>
				</form>
			</div>
		</div>
		</main>
	</div>
	<script src="https://code.getmdl.io/1.3.0/material.min.js"></script>
</body>
</html>
