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
<!-- <meta http-equiv="X-UA-Compatible" content="IE=edge,chrome=1"> -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>My Order List</title>
<link href="http://www.jqueryscript.net/css/jquerysctipttop.css" rel="stylesheet" type="text/css">
<script type="text/javascript" src="http://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<script type="text/javascript" src="<%=ctxPath%>/resources/js/hubslider.js"></script>
<!-- RESET -->
<link href="<%=ctxPath%>/resources/css/html5_reset.css" rel="stylesheet">
<!-- FONT -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- HEADER CSS -->
<link href="<%=ctxPath%>/resources/css/header.css" rel="stylesheet">
<!-- myOrderList CSS -->
<link href="<%=ctxPath%>/resources/css/myOrderList.css" rel="stylesheet">

<script>
$(function(){
   $(window).scroll(function(){
   var navbar = $(this).scrollTop();
   var $header = $('header');
   if(navbar > 0){
       $header.addClass('activated');
   }else{
       $header.removeClass('activated');
   }
 })
})
   // 페이지 로딩되었을때 로그인이 되어있는지 확인
   $(document).ready(function() {
      $.ajax({
         url : "<%=ctxPath%>/client/loginCheck.do",
         data : {},
         success : function(res1) {
            if (res1 == 'KeepLogin') {
               $("#logoutBtn").show();
            }
         }
      });
   });
</script>
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
html {
	width: auto;
	height: auto;
}
</style>
</head>
<body>
   <!-- HEADER -->
   <header>
      <div class="header_container">
         <div class="logo" >
            <a href="<%=ctxPath%>/"><img src="<%=ctxPath%>/resources/images/clogo1.png" style="width:30px; height:30px;"></a>
         </div>
         <div class="menu">
            <button id="logoutBtn">LOGOUT</button>
         </div>
      </div>
   </header>
   
   <!-- 주문 내역 조회 카드 -->
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
                        <div class="orderPayItems" style="font-weight:700; margin-bottom:10px;">${paySearchList.pay_time }</div>
                        <div class="orderPayItems">${paySearchList.store_name }</div>
                        <div class="orderPayItems">${paySearchList.pickup_time }</div>
                        <div class="orderPayItems" style="margin-bottom:20px;">${paySearchList.pay_request }</div>
                     </div>
                     <hr>
                     <div class="orderMenu">   
                        <c:forEach items="${paySearchList.menuCollection}" var="menu"
                           varStatus="m">
                           <div class="product_name">
                                 <!-- 여기는 menu_name -->
                                 <div class="orderMenuItems">
                                 <span style="font-size:16px; font-weight:700;">${menu.menu_name}</span>
                                 <span style="font-size:16px; font-weight:700;">&times;${menu.order_quantity }</span>
                                 <c:forEach items="${menu.customCollection}" var="custom" varStatus="c">
                                    <!-- 여기가 custom_name -->
                                    <span class="orderCustomItems" style="font-size:16px; font-weight:700;">+&nbsp;${custom.custom_name}</span>
                                 </c:forEach>
                                 </div>
                           </div>
                        </c:forEach>
                        </div>
                        <hr>
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
	<script>
   // 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
    $("#logoutBtn").on("click",function(){
        $.ajax({
           url:"<%=ctxPath%>/client/clientLogout.do",
           data:   {},
           success: function(){
              $("#logoutBtn").hide();
              location.href="<%=ctxPath%>/";
           }
        });
        });
   </script>
</body>
</html>
