<!doctype html>
<html>
<%
String url = request.getRequestURL().toString();
String baseURL = url.substring(0, url.length() - request.getRequestURI().length()) + request.getContextPath() + "/";
%>
<head>
<meta charset="utf-8">
<meta name="viewport"	content="width=device-width, initial-scale=1.0, maximum-scale=1.0, user-scalable=no">
<title>reveal.js</title>
<link rel="stylesheet" href="<%=baseURL%>/assets/css/reveal.css">
<link rel="stylesheet" href="<%=baseURL%>/assets/css/theme/beige.css">
<!-- Theme used for syntax highlighting of code -->
<link rel="stylesheet" href="<%=baseURL%>/assets/lib/css/zenburn.css">
<link rel="stylesheet" href="<%=baseURL%>/assets/css/cut-the-crap.css">
<!-- Printing and PDF exports -->
<script>
			var link = document.createElement( 'link' );
			link.rel = 'stylesheet';
			link.type = 'text/css';
			link.href = window.location.search.match( /print-pdf/gi ) ? '<%=baseURL%>/assets/css/print/pdf.css' : '<%=baseURL%>/assets/css/print/paper.css';
			document.getElementsByTagName( 'head' )[0].appendChild( link );
		</script>
</head>
<body>
<div class="reveal">
			<div class="slides">
				
				<section tagcloud ng-app="tags" ng-controller="myCtrl">
				<h3 style="font-size: 224px; margin-top: -233px !important; margin-bottom: 44px !important;">
				<del>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</del>Cut-The-Crap<del>&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;</del>
				</h3>
				<span tagcloud-weight="{{x.weight}}" ng-repeat="x in products">{{x.name}} </span>
				
   </section>
			</div>
		</div>
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
	<script src="<%=baseURL%>/assets/lib/js/head.min.js"></script>
	<script src="<%=baseURL%>/assets/js/reveal.js"></script>


	<script>
			// More info about config & dependencies:
			// - https://github.com/hakimel/reveal.js#configuration
			// - https://github.com/hakimel/reveal.js#dependencies
			Reveal.initialize({
				center: true,
				//parallaxBackgroundImage: 'https://s3.amazonaws.com/hakim-static/reveal-js/reveal-parallax-1.jpg',
				// Number of pixels to move the parallax background per slide
				// - Calculated automatically unless specified
				// - Set to 0 to disable movement along an axis
				//parallaxBackgroundHorizontal: null,
				//parallaxBackgroundVertical: null,
display: 'block',
width: 960,
height: 1100,

// Factor of the display size that should remain empty around the content
margin: 0.1,

// Bounds for smallest/largest possible scale to apply to content
minScale: 0.2,
maxScale: 1.5,
				dependencies: [
					{ src: '<%=baseURL%>/assets/plugin/tagcloud/tagcloud.js', async: true }, 
					{ src: '<%=baseURL%>/assets/plugin/markdown/marked.js' },
					{ src: '<%=baseURL%>/assets/plugin/markdown/markdown.js' },
					{ src: '<%=baseURL%>/assets/plugin/notes/notes.js', async: true },
					{ src: '<%=baseURL%>/assets/plugin/highlight/highlight.js', async: true, callback: function() { hljs.initHighlightingOnLoad(); } }
				]
			
			}); 
		</script>

	<script
		src="https://ajax.googleapis.com/ajax/libs/angularjs/1.6.4/angular.min.js"></script>
			<script>
			var tagsArray = [];
			 $.get("http://192.168.0.4:8080/rest/tags/all", function(data, status){
				 tagsArray= data.data;
			    });
			 console.log(tagsArray);
var app = angular.module("tags", []); 
app.controller("myCtrl", function($scope) {	
    $scope.products = tagsArray;
});
</script>
</body>
</html>