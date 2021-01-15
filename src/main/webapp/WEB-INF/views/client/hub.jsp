<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();
String brandName = request.getParameter("brand");
String storename = request.getParameter("storename");

String avenue = request.getParameter("storename");
if (avenue == null) {
   avenue = request.getParameter("brand");
}
%>
<!doctype html>
<html>
<head>
<meta charset="utf-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Hublabs Slider Example</title>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/js/hubslider.js"></script>
<script type="text/javascript">
        $(function () {

$('.hub-slider-slides ul').hubSlider({
    selector: $('li'),
    button: {
        next: $('.hub-slider-arrow_next'),
        prev: $('.hub-slider-arrow_prev')
    },
    transition: '0.7s',
    startOffset: 30,
    auto: true,
    time: 2 // secondly
});

        })
    </script>
<style>

.container {
	width: 500px;
	margin: 350px auto;
}

.hub-slider {
	position: relative;
}

.hub-slider ul {
	list-style: none;
}

.hub-slider ul li {
	width: 500px;
	height: 300px;
	background: #DA4453;
	color: #fff;
	line-height: 300px;
	text-align: center;
	position: absolute;
	border-radius: 5px;
	left: 0;
	top: 0;
}

.hub-slider-controls {
	position: absolute;
	right: 0;
	top: 0;
	z-index: 1000;
}

.hub-slider-arrow {
	width: 40px;
	height: 40px;
	border: none;
	background: #34BC9D;
	color: #fff;
	font-weight: bold;
}
</style>
</head>
<body>
	<div class="container">
		<div class="hub-slider">
			<div class="hub-slider-slides">
				<ul>
					<li>Slide 1</li>
					<li>Slide 2</li>
					<li>Slide 3</li>
					<li>Slide 4</li>
					<li>Slide 5</li>
				</ul>
			</div>
			<div class="hub-slider-controls">
				<button class="hub-slider-arrow hub-slider-arrow_next">↑</button>
				<button class="hub-slider-arrow hub-slider-arrow_prev">↓</button>
			</div>
		</div>
	</div>
</body>
</html>