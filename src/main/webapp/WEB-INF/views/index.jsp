<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<%
   String ctxPath = request.getContextPath();
   String brandName = request.getParameter("brand");
   if(brandName==null) {
      brandName = "스타";  // 예외처리  
   } 
%>
<%
   String avenue = request.getParameter("city");

%>
<html>
<head>
<meta charset="UTF-8">
<title>JABA</title>
<meta name="viewport" content="width=device-width,initial-scale=1,maximum-scale=1,minimal-ui" />
<!-- <link rel="stylesheet" type="text/css" href="mainStyle.css" /> -->
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>
<!-- MODAL -->
<meta name="viewport" content="width=device-width, initial-scale=1">
<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- RESET -->
<link href="<%=ctxPath%>/resources/css/html5_reset.css" rel="stylesheet">
<!-- FONT -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
<!-- HEADER CSS -->
<link href="<%=ctxPath%>/resources/css/header.css" rel="stylesheet">
<!-- SECTION CSS -->
<link href="<%=ctxPath%>/resources/css/section.css" rel="stylesheet">
<!-- FOOTER CSS -->
<link href="<%=ctxPath%>/resources/css/footer.css" rel="stylesheet">
<!-- INDEX CSS -->
<link href="<%=ctxPath%>/resources/css/index.css" rel="stylesheet">

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
   // search 버튼 클릭 시 dropdown 동작 slideToggle
    $(document).ready(
         function() {$("#searchBtn").click(
                  function() {
                     $('#searchDrop').toggle();
                  });
         function aTagPost(){
      	   var getId=$(this).attr("id");
             frm.action="<%=ctxPath%>/explore/searchAddr.do?addr="+getId;
             frm.method="post";
             frm.submit();
             };
         });
   //외부영역 클릭시 dropdown 닫기
      $(document).mouseup(function (e){
       var container = $('#searchDrop');
          if( container.has(e.target).length === 0){
               container.css('display','none');
    }
  }); 
   
  
      
      // 모달창 닫혔을 때 페이지 reload 시켜주기
      $(document).ready(
            function() {
            	$('.modal').on('hidden.bs.modal', function () {
       				location.reload();
     	})
     });
</script>
</head>
<body>
   <!-- HEADER -->
   <header>
      <div class="header_container">
         <div class="logo">
            <a href="<%=ctxPath%>/"><img src="<%=ctxPath%>/resources/images/clogo1.png" style="width:30px; height:30px;"></a>
         </div>
         <div class="dropdown">
            <div class="menu">
               <div class="MuiAvatar-root jss98" id="MuiAvatar-root-id"
                  style="color: rgb(255, 255, 255); background-color: rgb(0, 0, 0);">${client.client_name }</div>
               <button
                  class="MuiButtonBase-root MuiIconButton-root jss99 logo__navigation MuiIconButton-sizeSmall"
                  tabindex="0" type="button" id="dropdownMenuButton"
                  data-toggle="dropdown" aria-haspopup="true" aria-expanded="false"
                  style="color: rgb(0, 0, 0);">
                  <span class="MuiIconButton-label"><svg
                        class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
                        aria-hidden="true" role="presentation">
                        <path
                           d="M7.41 8.59L12 13.17l4.59-4.58L18 10l-6 6-6-6 1.41-1.41z"></path>
                        <path fill="none" d="M0 0h24v24H0V0z"></path></svg></span><span
                     class="MuiTouchRipple-root"></span>
               </button>
               <div class="dropdown-menu" aria-labelledby="dropdownMenuButton">
                  <a class="dropdown-item" href="<%=ctxPath%>/client/myPage.do" id="My_account_profile"><div class="dropdown-itemss">
                        <svg class="menu-item__icon">
                           <g id="\u2192-Assets" stroke="none" stroke-width="1"
                              fill="none" fill-rule="evenodd">
                           <g id="ic-account" fill="#14171A">
                           <path
                              d="M7,12 L13,12 C15.7614237,12 18,14.2385763 18,17 C18,17.5522847 17.5522847,18 17,18 C16.4871642,18 16.0644928,17.6139598 16.0067277,17.1166211 L15.9949073,16.8237272 C15.9070404,15.3072462 14.6927538,14.0929596 13.1762728,14.0050927 L13,14 L7,14 C5.34314575,14 4,15.3431458 4,17 C4,17.5522847 3.55228475,18 3,18 C2.44771525,18 2,17.5522847 2,17 C2,14.3112453 4.12230671,12.1181819 6.78311038,12.0046195 L7,12 L13,12 L7,12 Z M10,2 C12.7614237,2 15,4.23857625 15,7 C15,9.76142375 12.7614237,12 10,12 C7.23857625,12 5,9.76142375 5,7 C5,4.23857625 7.23857625,2 10,2 Z M10,4 C8.34314575,4 7,5.34314575 7,7 C7,8.65685425 8.34314575,10 10,10 C11.6568542,10 13,8.65685425 13,7 C13,5.34314575 11.6568542,4 10,4 Z"
                              id="Icon-Color"></path></g></g></svg>
                        <span>My account</span>
                     </div></a> <a class="dropdown-item" href="<%=ctxPath%>/client/myOrderList.do"><svg
                        class="menu-item__icon">
                        <g id="\u2192-Assets" stroke="none" stroke-width="1" fill="none"
                           fill-rule="evenodd">
                        <g id="ic-order_history" fill="#14171A">
                        <path
                           d="M10,2 C14.418278,2 18,5.581722 18,10 C18,14.418278 14.418278,18 10,18 C5.581722,18 2,14.418278 2,10 C2,5.581722 5.581722,2 10,2 Z M10,4 C6.6862915,4 4,6.6862915 4,10 C4,13.3137085 6.6862915,16 10,16 C13.3137085,16 16,13.3137085 16,10 C16,6.6862915 13.3137085,4 10,4 Z M10,6 C10.5128358,6 10.9355072,6.38604019 10.9932723,6.88337887 L11,7 L11,9.58578644 L12.7071068,11.2928932 C13.0976311,11.6834175 13.0976311,12.3165825 12.7071068,12.7071068 C12.3466228,13.0675907 11.7793918,13.0953203 11.3871006,12.7902954 L11.2928932,12.7071068 L9.29289322,10.7071068 C9.1366129,10.5508265 9.03740171,10.3481451 9.00867243,10.131444 L9,10 L9,7 C9,6.44771525 9.44771525,6 10,6 Z"
                           id="Icon-Color"></path></g></g></svg>Order history</a> <a class="dropdown-item"
                     href="<%=ctxPath%>/qna/qnaList.do"><svg class="menu-item__icon">
                        <g id="\u2192-Assets" stroke="none" stroke-width="1" fill="none"
                           fill-rule="evenodd">
                        <g id="ic-help_center" fill="#14171A">
                        <path
                           d="M10,2 C14.418278,2 18,5.581722 18,10 C18,14.418278 14.418278,18 10,18 C5.581722,18 2,14.418278 2,10 C2,5.581722 5.581722,2 10,2 Z M10,14 C9.44771525,14 9,14.4477153 9,15 C9,15.5522847 9.44771525,16 10,16 C10.5522847,16 11,15.5522847 11,15 C11,14.4477153 10.5522847,14 10,14 Z M10,4 C11.6568542,4 13,5.34314575 13,7 C13,7.54060402 12.7972,7.95243249 12.4324938,8.33695441 L12.3049846,8.46425623 L11.6976805,9.00562265 C11.227883,9.46313853 11,9.98493642 11,11 C11,11.5128358 10.6139598,11.9355072 10.1166211,11.9932723 L10,12 C9.44771525,12 9,11.5522847 9,11 L9.00528561,10.712882 C9.05455619,9.40117173 9.44742455,8.4787716 10.1475931,7.73055006 L10.3023195,7.57280447 L10.5268503,7.36697752 L10.9833325,6.9652856 C10.9940344,6.95806514 10.9983381,6.95876504 10.9999034,6.9646777 L10.991185,6.86663987 C10.9259877,6.37740496 10.5070677,6 10,6 C9.48716416,6 9.06449284,6.38604019 9.00672773,6.88337887 L8.99327227,7.11662113 C8.93550716,7.61395981 8.51283584,8 8,8 C7.44771525,8 7,7.55228475 7,7 C7,5.34314575 8.34314575,4 10,4 Z"
                           id="Icon-Color"></path></g></g></svg>Help center</a>
               </div>
            </div>
            <button class="menu_btn" value="LOG IN" type="button"
               class="btn btn-primary" data-toggle="modal"
               data-target="#LoginModal">
               <span>LOG IN</span>
            </button>

            <button class="menu_btn" value="SIGN UP" class="btn btn-primary"
               data-toggle="modal" data-target="#registerModal">
               <span>SIGN UP</span>
            </button>
            <button id="logoutBtn">LOGOUT</button>
         </div>
      </div>

   </header>
   <!-- MODAL -->
   <!-- LOG IN -->
   <!-- Modal Basic -->
   <div class="modal fade" id="LoginModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-size" role="document">
         <div class="modal-content modal-size">

            <!-- modal-header -->
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="loginCloseBtn">
                  <span aria-hidden="true">&times;</span>
               </button>
               <div class="header-icon" style="stroke: #112732; background-color: rgba(17, 39, 50, 0.12);">
                  <svg height="32" viewBox="0 0 32 32" width="32">
                     <path
                        d="m28 2.66666667-2.6666667 2.66666666m-10.1466666 10.14666667c1.8732867 1.8483505 2.6125307 4.5587607 1.9370876 7.1022582-.6754432 2.5434974-2.6619987 4.5300529-5.2054961 5.2054961-2.54349751.6754431-5.25390769-.0638009-7.1022582-1.9370876-2.77912954-2.8774452-2.73938408-7.4512884.08933045-10.2800029 2.82871452-2.8287145 7.40255775-2.86846 10.28000285-.0893305zm0 0 5.48-5.48m0 0 4 4 4.6666666-4.66666667-4-4m-4.6666666 4.66666667 4.6666666-4.66666667"
                        fill="none" stroke-linecap="round" stroke-linejoin="round" stroke-width="2.666667"></path></svg>
               </div>
               <div class="header-title" style="font-weight: bold; font-size: 24px;">
                  <p>Sign in to JABA</p>
               </div>
               <div class="header-subtitle">
                  <p>
                     Don't have an account?&nbsp;<a href="javascript:signUpNow();" class="register">Sign up now</a>
                  </p>
               </div>
            </div>

  			<!-- modal-body -->
            <div class="modal-body">
               <div class="text-box" style="font-weight: bold;">
                  <p>Email address</p>
                  <input type="text" class="signin-input" id="email" name="email">
               </div>

               <div class="text-box">
                  <br><span style="font-weight: bold;"> Password </span> <span style="float: right"><a href="javascript:lostPw();">Forgot&nbsp;password?</a>
                  </span> <input type="password" class="signin-input" id="pwd" name="pwd">
               </div>
              
            </div>

            <!-- modal-footer -->
            <div class="modal-footer">
               <button type="button" class="btnChk" id="signin" name="signin">Sign in</button>
            </div>
            
             <div class="modal-body" id="lostPw-body" style="display: none">
               <div class="text-box" style="font-weigh: bold;">
                  <span style="font-weight: bold;">Email address</span><span style="float: right"> <a href="javascript:returnLogin();">return to login</a></span>
                  <input type="text" class="signin-input" id="lostemail" name="lostemail">
               </div>
               </div>
               <div class="modal-footer" id="lostPw-footer" style="display: none">
               <button type="button" class="btnChk" id="Send a new PassWord">Send a temporary Password</button>
               </div>
         </div>
      </div>
   </div>
   <!-- MODAL -->
   <!-- SIGN UP -->
   <!-- Modal Basic -->
   <div class="modal fade" id="registerModal" tabindex="-1" role="dialog" aria-labelledby="exampleModalLabel" aria-hidden="true">
      <div class="modal-dialog modal-size" role="document">
         <div class="modal-content modal-size">

            <!-- modal-header -->
            <div class="modal-header">
               <button type="button" class="close" data-dismiss="modal" aria-label="Close" id="signupCloseBtn">
                  <span aria-hidden="true">&times;</span>
               </button>
               <div class="header-icon" style="stroke: #112732; background-color: rgba(17, 39, 50, 0.12);">
                  <svg height="32" viewBox="0 0 32 32" width="32">
                     <g
                        style="fill: none; fill-rule: evenodd; stroke-linecap: round; stroke-linejoin: round; stroke: rgba(17, 39, 50); stroke-width: 2.66667;">
                     <path
                        d="m21.3333333 28v-2.6666667c0-2.9455186-2.3878146-5.3333333-5.3333333-5.3333333h-9.33333333c-2.94551867 0-5.33333334 2.3878147-5.33333334 5.3333333v2.6666667"></path>
                     <circle cx="11.333333" cy="9.333333" r="5.333333"></circle>
                     <path d="m26.666667 10.666667v8"></path>
                     <path d="m30.666667 14.666667h-8"></path></g></svg>
               </div>
               <div class="header-title" style="font-weight: bold; font-size: 20px;">
                  <p>Sign up to JABA</p>
               </div>
               <div class="header-subtitle">
                  <p>
                     Already have an account?&nbsp;<a href="#" class="register">Sign in here</a>
                  </p>
               </div>
            </div>

            <!-- modal-body -->
            <div class="modal-body">
               <div class="text-box" style="font-weight: bold; font-size: 14px;">
                  <p>Name</p>
                  <input type="text" class="signin-input" id="name" name="name">
               </div>

               <div class="text-box">
                  <br>
                  <div class="text-box" style="font-weight: bold; font-size: 14px;">
                     <p>Mobile number</p>
                     <input type="text" class="signin-input" id="mobile" name="mobile">
                  </div>

                  <div class="text-box">
                     <br>
                     <div class="text-box" style="font-weight: bold; font-size: 14px;">
                        <p>Email address</p>
                        <input type="text" class="signin-input" id="emailRegister" name="emailRegister"> <span id="emailCheckResult"></span>
                     </div>

                     <div class="text-box">
                        <br>
                        <div class="text-box" style="font-weight: bold; font-size: 14px;">
                           <p>Password</p>
                           <input type="password" class="signin-input" id="passwordRegister" name="passwordRegister"> <span id="passwordRegisterResult"></span><br>
                           <p style="font-size: 12px; font-weight: normal; padding-top: 5px">Password must be at least 8 characters</p>
                        </div>

                     </div>

                     <!-- modal-footer -->
                     <div class="modal-footer">
                        <br>
                        <button type="button" class="btnChk" id="signup" name="signup">Sign up</button>
                     </div>
                  </div>
               </div>
            </div>
         </div>
      </div>
   </div>

   <!-- NAVIGATOR -->
   <nav></nav>
   <!-- SECTION -->

   <section id="home" style="background-image: url(<%=ctxPath%>/resources/images/c3.png), url(<%=ctxPath%>/resources/images/c5.png); background-repeat:no-repeat; background-position: left bottom, right center;">
      <div class="container">
         <h1>
            Favourites at<br>your fingertips.<br>
         </h1>
<!--         <p style="font-size:14px; color:#111111; font-weight:bold;">order from amazing cafes.</p> -->
         
         <div class="search-bar" style="margin-top:10px;">
            <div class="MuiInputBase-root jss38">
               <svg viewBox="0 0 14 16">
                  <path d="M7 0C3.504.004.6707 2.8373.6667 6.3333c0 4.3647 4.3586 8.3254 5.694 9.4354a.9993.9993 0 001.278 0c1.3333-1.11 5.6946-5.072 5.6946-9.436C13.3287 2.8367 10.496.004 7 0zm0 9.6667c-1.8407 0-3.3333-1.4927-3.3333-3.3334C3.6667 4.4927 5.1593 3 7 3s3.3333 1.4927 3.3333 3.3333c0 1.8407-1.4926 3.3334-3.3333 3.3334z" fill="currentColor" fill-rule="nonzero"></path></svg>
               <input type="text" class="search_text" id="addr_search" name="city" placeholder="Enter your address">
              
               <div class="searchDropWrap">
                  <ul id="searchDrop" class="dropdown-menu">
                     <c:if test="${not empty getAddrList}">
                        <c:forEach items="${getAddrList}" var="addr" varStatus="status">
                           <li class="addr_store_addr"><a href="javascript:aTag();" class="addr_store_anchor" id="${addr.store_addr}">${addr.store_addr}</a></li>
                           <!-- 리스트의 첫 번째 id만 가능하다,,,, -->
                        </c:forEach>
                       
                     </c:if>
                     <li class="addr_store_addr"><a href="javascript:bTag();" id="loc_store_anchor">현재 위치로 검색하기</a></li>
                  </ul>
               </div>
               
            </div>
         </div>
      
         <div class="search-button">
            <button id="searchBtn" type="button">SEARCH</button>
         </div>
         
      </div>

   </section>
   <!-- SECTION -->
   <section id="brands">
      <div class="container">
         <div>
            <h2>Browse By Brand</h2>
         </div>
         <div class="store_list_grid" id="store_grid">
         <div data-index="0" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="brand-badge">
                  <img src="<%=ctxPath%>/resources/images/logo_starbucks.jpg" class="active brand_img" id="스타벅스">
               </div>
            </div>
         </div>
         <div data-index="1" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="brand-badge ">
                  <img src="<%=ctxPath%>/resources/images/logo_coffeebean.png" class="active brand_img" id="커피빈">
               </div>
            </div>
         </div>
         <div data-index="2" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="brand-badge ">
                  <img src="<%=ctxPath%>/resources/images/logo_duckes.png" class="active brand_img" id="듁스" >
               </div>
            </div>
         </div>
         <div data-index="3" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="brand-badge ">
                  <img src="<%=ctxPath%>/resources/images/logo_ant.png" class="active brand_img" id="앤드러사이트">
               </div>
            </div>
         </div>
         <div data-index="4" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="brand-badge ">
                  <img src="<%=ctxPath%>/resources/images/logo_paul.png" class="active brand_img" id="폴바셋">
               </div>
            </div>
         </div>
         <div data-index="5" class="brands" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="brand-badge ">
                  <img src="<%=ctxPath%>/resources/images/logo_hollys.png" class="active brand_img">
               </div>
            </div>
         </div>
         </div>
      </div>
   </section>
<!--  도시 명 검색 시, searchAddr와 마찬가지로, 해당 도시 명이 들어간 주소로 검색하는 기능 -->
   <section id="cities">
      <div class="container">
         <div>
            <h2>Browse By City</h2>
         </div>
         <div class="store_list_grid" id="store_grid">
         <div data-index="0" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="서울특별시 종로구">Eulji-ro</a>
               </div>
            </div>
         </div>
         <div data-index="1" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="서울특별시 영등포구">YeoUi-do</a>
               </div>
            </div>
         </div>
         <div data-index="2" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="서울특별시 마포구">HapJeong</a>
               </div>
            </div>
         </div>
         <div data-index="3" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="서울특별시 성동구">SeongSu</a>
               </div>
            </div>
         </div>
         <div data-index="4" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="서울특별시 송파구">JamSil</a>
               </div>
            </div>
         </div>
         <div data-index="5" class="cities" tabindex="-1" aria-hidden="false" style="outline: none; width: 130px;">
            <div>
               <div class="city-badge">
                  <a class="city_name" id="서울특별시 강남구 신사동">Garosu-gil</a>
               </div>
            </div>
         </div>
		</div>
      </div>

   </section>
   <!-- MAP API -->
   <div id="map"></div>

<script type="text/javascript" src="//dapi.kakao.com/v2/maps/sdk.js?appkey=7e6cd41f87d7529ffb39adb770099e29"></script>
<script>
var mapContainer = document.getElementById('map'), // 지도를 표시할 div 
    mapOption = { 
        center: new kakao.maps.LatLng(33.450701, 126.570667), // 지도의 중심좌표
        level: 5 // 지도의 확대 레벨 
    }; 

var map = new kakao.maps.Map(mapContainer, mapOption); // 지도를 생성합니다

// HTML5의 geolocation으로 사용할 수 있는지 확인합니다 
if (navigator.geolocation) {
    
    // GeoLocation을 이용해서 접속 위치를 얻어옵니다
    navigator.geolocation.getCurrentPosition(function(position) {
        
        var lat = position.coords.latitude, // 위도
            lon = position.coords.longitude; // 경도
        
        var locPosition = new kakao.maps.LatLng(lat, lon), // 마커가 표시될 위치를 geolocation으로 얻어온 좌표로 생성합니다
            message = '<div style="padding:5px;">현재 위치</div>'; // 인포윈도우에 표시될 내용입니다
        
        // 마커와 인포윈도우를 표시합니다
        displayMarker(locPosition, message);
            
      });
    
} else { // HTML5의 GeoLocation을 사용할 수 없을때 마커 표시 위치와 인포윈도우 내용을 설정합니다
    
    var locPosition = new kakao.maps.LatLng(0, 0),    
        message = 'geolocation을 사용할수 없어요..'
        
    displayMarker(locPosition, message);
}

// 지도에 마커와 인포윈도우를 표시하는 함수입니다
function displayMarker(locPosition, message) {

    // 마커를 생성합니다
    var marker = new kakao.maps.Marker({  
        map: map, 
        position: locPosition
    }); 
    
    var iwContent = message, // 인포윈도우에 표시할 내용
        iwRemoveable = true;

    // 인포윈도우를 생성합니다
    var infowindow = new kakao.maps.InfoWindow({
        content : iwContent,
        removable : iwRemoveable
    });
    
    // 인포윈도우를 마커위에 표시합니다 
    infowindow.open(map, marker);
    
    // 지도 중심좌표를 접속위치로 변경합니다
    map.setCenter(locPosition);      
    
    // 지도 정보 콘솔창에 띄워보자
    var center = map.getCenter();
    console.log("현재 위치의 위도: " + center.getLat() + ", 현재 위치의 경도: " + center.getLng());
}    
</script>

   <!-- ASIDE -->
   <aside></aside>

   <!-- FOOTER -->
   <footer>
      <div class="container" id="footer_container">
         <div class="row">
            <div class="footer_logo">
               <img src="<%=ctxPath%>/resources/images/clogo1.png" style="width:30px; height:30px;">
            </div>
            <div class="footer_links">
               <ul>
                  <li class="links_head">JABA for YOUNG&RICH</li>
                  <li>WHY JABA?</li>
                  <li>PRICING</li>
                  <li><a href='#'>PARTNER LOGIN</a></li>
               </ul>
               <ul>
                  <li class="links_head">TOP CITIES</li>
                  <li>JONGRO</li>
                  <li>SEOCHON</li>
                  <li>PARIS</li>
               </ul>
               <ul>
                  <li class="links_head">SUPPORT</li>
                  <li>CUSTOMER HELP</li>
                  <li>PARTNER HELP</li>
                  <li>SUGGEST STH</li>
               </ul>
               <ul>
                  <li class="links_head">COMPANY</li>
                  <li>CUSTOMER HELP</li>
                  <li>PARTNER HELP</li>
                  <li>SUGGEST STH</li>
               </ul>
            </div>
         </div>
         <hr>
         <div class="row">
            <div class="footer__disclaimer">
               <p>JABA connects customers with popular cafe brands.</p>
               <p>We believe that time is precious. We strive to create beautiful technology that helps you save time and make ordering easy, both sides of
                  the counter. Order from JABA with the best selection of local cafes.</p>
               <div class="legal">
                  <div>
                     <div class="legal__copyright">© 2020 JABA Technologies Pty Ltd</div>
                     <ul class="legal__links">
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="/legal/privacy-policy">Privacy
                              Policy</a></li>
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="/legal/terms-and-conditions">Terms
                              of Use</a></li>
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="https://help.bopple.com/"
                           target="_blank" rel="noopener noreferrer">Help Centre</a></li>
                        <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
                           href="https://customer-contact-help.bopple.com" target="_blank" rel="noopener noreferrer">Leave Feedback</a></li>
                     </ul>
                  </div>
               </div>
            </div>

         </div>
      </div>

   </footer>
   <!-- 현재 위치 좌표값을 servlet으로 보내는 부분 -->
   <form name="frm">
      <input type="hidden" name="lat2">
      <input type="hidden" name="lon2">      
   </form>
   <script>
   if (navigator.geolocation) {
      var frm = document.frm;
       // GeoLocation을 이용해서 접속 위치를 얻어옵니다
            navigator.geolocation.getCurrentPosition(function(position) {
           lat2 = position.coords.latitude, // 현재 위치의 위도
           lon2 = position.coords.longitude; // 현재 위치의 경도
           console.log(frm.lat2.value);
           console.log(frm.lon2.value);
           frm.lat2.value = lat2;
           frm.lon2.value = lon2;
           console.log(frm.lat2.value);
           console.log(frm.lon2.value);
           
           
           
           
           $(".brand_img").on("click", function(){
        var getId=$(this).attr("id");
           frm.action="<%=ctxPath%>/explore/searchBrand.do?brand="+getId;
           frm.method="post";
           frm.submit();
           });
           
        // 도시 명 클릭 시 바로 explore로 이동할 수 있겠다.
        // 다만 넘겨지는 id값이 addr와 이어지려면 "시 구 동"형태로 들고 넘어가야 한다.
           $(".city_name").on("click", function(){
               var getId=$(this).attr("id");
                  frm.action="<%=ctxPath%>/explore/searchAddr.do?addr="+getId;
                  frm.method="post";
                  frm.submit();
                  });
        	$("#searchDrop").children().on("click", function(){
        		var getId=$(this).attr("id");
        		frm.action="<%=ctxPath%>/explore/searchAddr.do?addr="+getId;
        		frm.method="post";
        		frm.submit();
        	})
           
           //추후 수정, searchBtn 클릭 시 해당 기능 (내일 01/06)
           // searchBtn 클릭하면 ajax를 통해서 데이터 리스트를 session에 담아서 가져오고
           // 해당부분 reload? 를 시켜줘야할것같아여.. --> el 태그로 불러와서 뿌려주는거라서.. 
                 // 자바스크립트만으로는 session에 담긴값을 얻어올수가 없기떄문에.. 
           $("#searchBtn").click(function(){
              var getInputValue = $("#addr_search").val();
              $.ajax({
                 url: "addrCheck.do",
                 data:   {
                    addr : getInputValue
                 },
                 success:   function(res){
                    console.log("받아오는건 잘 작동");
                    $(".searchDropWrap ul").load(location.href + " .searchDropWrap ul .addr_store_addr");
                    // 주소 목록 부분 리스트 로드
                   // $("주소목록부분").load(location.href + " 주소목록부분");
                    // 버튼을 클릭하면 주소 목록 부분이 보여짐
                     //  $("#머시기").show();
                 },
                 error: function(request,status,error){
                       alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
                   }
              }); 
              
           });
           
           // 리스트를 클릭했을때 이동하는 기능
<%--                 
              frm.action="<%=ctxPath%>/explore/searchAddr.do?addr="+getInputValue;
               frm.method="post";
               /* frm.submit(); */
           }); --%>
           
          /*  $("#dropdownMenu").click(function(){
             var getInputValue 
           }); */
       })
   };
</script>
<!-- a tag href javascript function -->
<script>
function aTag(){
var frm = document.frm;
// GeoLocation을 이용해서 접속 위치를 얻어옵니다
     navigator.geolocation.getCurrentPosition(function(position) {
    lat2 = position.coords.latitude, // 현재 위치의 위도
    lon2 = position.coords.longitude; // 현재 위치의 경도
    console.log(frm.lat2.value);
    console.log(frm.lon2.value);
    frm.lat2.value = lat2;
    frm.lon2.value = lon2;
    console.log(frm.lat2.value);
    console.log(frm.lon2.value);
    $(".addr_store_anchor").on("click", function(){
    	var getId=$(this).attr("id");
        frm.action="<%=ctxPath%>/explore/searchAddr.do?addr="+getId;
        frm.method="post";
        frm.submit();
    });

    
    });
}
function bTag(){
var frm = document.frm;
// GeoLocation을 이용해서 접속 위치를 얻어옵니다
     navigator.geolocation.getCurrentPosition(function(position) {
    lat2 = position.coords.latitude, // 현재 위치의 위도
    lon2 = position.coords.longitude; // 현재 위치의 경도
    console.log(frm.lat2.value);
    console.log(frm.lon2.value);
    frm.lat2.value = lat2;
    frm.lon2.value = lon2;
    console.log(frm.lat2.value);
    console.log(frm.lon2.value);
    $("#loc_store_anchor").on("click", function(){
    	frm.action="<%=ctxPath%>/explore/searchLoc.do";
    	frm.method="post";
    	frm.submit();
    });
    
    });
}

function click(obj){
	$(obj).css("background-color", "red");
}


</script>

<!--  로그인 스크립트 ajax 통신  -->
<script>
   console.log();
   $("#signin").on("click",function(){
      $.ajax({
         url:"client/clientLogin.do",
         data: { email: $("#email").val(),
               pw: $("#pwd").val()},
         success: function(res1){
            console.log(res1);
            var biz = "BizPartner";
            var admin = "Admin";
            var client = "Client";
            // res1 이 BizPartner 이면 BizPartner 페이지로 이동.
           if(res1 == admin){
               location.href="<%=ctxPath%>/admin/adminMain.do";
            }else if(res1==client){
               
               $(".menu_btn").hide();
               $("#logoutBtn").show();
               $("#dropdownMenuButton").show();
               $("#MuiAvatar-root-id").css("visibility","visible");
               document.getElementById("loginCloseBtn").click();
               
            }else if(res1 == 'NotExist'){
               alert("일치하는 회원정보가 없습니다.");
            }else{ //bizPartner일 경우, user_id받아와서 해당 페이지로 이동하게끔
                location.href="<%=ctxPath%>/biz/bizIndex.do";
             }
         }
      });
   });
   
   // 로그아웃
   $("#logoutBtn").on("click",function(){
      $.ajax({
         url:"client/clientLogout.do",
         success: function(res){
           console.log("succ 작동")
            $(".menu_btn").show();
            $("#logoutBtn").hide();
            $("#dropdownMenuButton").hide();
            $("#MuiAvatar-root-id").css("visibility","hidden");
         },
         error: function(request,status,error){
            alert("code:"+request.status+"\n"+"message:"+request.responseText+"\n"+"error:"+error);
         }
      });
   });
   
   $("#signup").on("click",function(){
         // 각종 유효성 체크 추가해야함 
            if($("#emailRegister").val() != "" && $("#passwordRegister").val() !== ""){
            $.ajax({
               url:"client/clientRegister.do",
               data:{ client_name: $("#name").val(),
                  client_phone: $("#mobile").val(),
                  client_id: $("#emailRegister").val(),
                  client_pw: $("#passwordRegister").val()},
               success: function(res){   // 회원가입 완료시 창닫기
                  document.getElementById("signupCloseBtn").click();
               }
            });
         }else{
            alert("모두 입력해주세요.");
         }
      });
   
   // 아이디 중복체크 
   $("#emailRegister").change(function(){
      $.ajax({
         url:"client/clientCheckId.do",
         data:{ emailRegister: $("#emailRegister").val()},
         success: function(res1){
            console.log(res1);
            if(res1 == 'no'){
               console.log("아이디 중복");
               $("#emailRegister").val("");
               alert("사용할 수 없는 email입니다.");
            }
            // alert(res1); 이메일 체크 확인하려고 넣었던 코드 
         }
      });
   });
   
   $("#passwordRegister").change(function(){
      var pw = $("#passwordRegister").val();
       var num = pw.search(/[0-9]/g);
       var eng = pw.search(/[a-z]/ig);
       var spe = pw.search(/[`~!@@#$%^&*]/gi);

       if(pw.length < 8 || pw.length > 20){
        alert("8자리 ~ 20자리 이내로 입력해주세요.");
        $("#passwordRegister").val("");
        return false;
       }else if(pw.search(/\s/) != -1){
        alert("비밀번호는 공백 없이 입력해주세요.");
        $("#passwordRegister").val("");
        return false;
       }else if(num < 0 || eng < 0 || spe < 0 ){
        alert("영문,숫자, 특수문자를 혼합하여 입력해주세요.");
        $("#passwordRegister").val("");
        return false;
       }else {
         console.log("통과"); 
          return true;
       }
   });
   </script>
   <script>
      // 페이지 로딩되었을때 로그인이 되어있는지 확인
      $(document).ready(function(){
         $.ajax({
            url:"client/loginCheck.do",
            data:{ },
            success: function(res1){
               if(res1 == 'KeepLogin'){
                  $(".menu_btn").hide();
                   $("#dropdownMenuButton").show();
                   $("#MuiAvatar-root-id").css("visibility","visible");
                   $("#logoutBtn").show();
               }
            }
         });
      });
   </script>
	<script>
   //비밀번호 찾기
   function lostPw(){
       $("#LoginModal .modal-body").hide();
       $("#LoginModal .modal-footer").hide();
       $("#lostPw-body").show();
       $("#lostPw-footer").show();
      
   }
   //로그인 창으로 되돌리기
   function returnLogin(){
      $("#LoginModal .modal-body").show();
      $("#LoginModal .modal-footer").show();
      $("#lostPw-body").hide();
      $("#lostPw-footer").hide();
   }
   </script>
	<script>
	function signUpNow() {
	  //기존 모달창 닫기
	  $("#LoginModal").hide();
	  //signUp 모달창 오픈
	  $("#registerModal").modal();
	  
	  $('.modal').on('hidden.bs.modal', function () {
		  location.reload();
		})
	}
	</script>
</body>
</html>
