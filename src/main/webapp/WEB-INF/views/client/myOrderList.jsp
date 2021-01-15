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
 	width: 600px;
	background: #112732;
	color: white;
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
	background: #FFA618;
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
				<c:if test="${not empty paySearchList }">
               <c:forEach items="${paySearchList}" var="paySearchList" varStatus="c">

					<li>
                  <div class="product_card">
                     <div class="product_card_detail">
                     <div class="orderPay">
                        <div style="font-weight:700; margin-bottom:10px;">${paySearchList.pay_time }</div>
                        <div>${paySearchList.store_name }</div>
                        <div>${paySearchList.pickup_time }</div>
                        <div style="margin-bottom:20px;">${paySearchList.pay_request }</div>
                     </div>
                     <div class="orderMenu">   
                        <c:forEach items="${paySearchList.menuCollection}" var="menu"
                           varStatus="m">
                           <div class="product_name">
                                 <!-- 여기는 menu_name -->
                                 <div class="orderMenuItems">
                                 <span style="font-size:16px; font-weight:700;">${menu.menu_name}</span>
                                 <span style="font-size:16px; font-weight:700;">&times;${menu.order_quantity }</span>
                                 </div>
                                 <div>
                                 <c:forEach items="${menu.customCollection}" var="custom" varStatus="c">
                                    <!-- 여기가 custom_name -->
                                    <div class="orderCustomItems" style="font-size:16px; font-weight:700;">+&nbsp;${custom.custom_name}</div>
                                 </c:forEach>
                                 </div>
                           </div>
                        </c:forEach>
                        </div>
                        <div class="orderPrice" style="font-size:16px; font-weight:700;"><fmt:formatNumber value="${paySearchList.pay_total_price }" pattern="#,###" />원</div>
                     </div>
                  </div>
					</li>


			</c:forEach>
            </c:if>
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