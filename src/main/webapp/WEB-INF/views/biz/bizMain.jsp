<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();
%>
<!-- board INPUT을 위함 -->
<%
   String bno = (request.getParameter("bno")!=null) ? request.getParameter("bno") : "0";
   String bref = (request.getParameter("bref")!=null) ? request.getParameter("bref") : "0";
   String bre_step = (request.getParameter("bre_step")!=null) ? request.getParameter("bre_step") : "0";
   String bre_level = (request.getParameter("bre_level")!=null) ? request.getParameter("bre_level") : "0";
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Biz Partner Main</title>
 <!-- Bootstrap -->
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
<!-- BIZMAIN CSS -->
<link href="<%=ctxPath%>/resources/css/bizMain.css" rel="stylesheet">
<!-- 체크박스 라디오버튼 CSS -->
<link href="<%=ctxPath%>/resources/css/icheck-material.css" rel="stylesheet" type="text/css">

    <!-- switchery-->
    <link rel="stylesheet" href="<%=ctxPath%>/resources/css/switchery.css" />
    <script src="<%=ctxPath%>/resources/js/switchery.js"></script>
    <!-- 폰트부분 -->
    <link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter&display=swap" rel="stylesheet">
    <!-- 아이콘 폰트-->
    <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
    <script src='https://code.jquery.com/jquery-3.4.0.js'></script>


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
            <button
               class="MuiButtonBase-root MuiButton-root jss154 cart-select-button false MuiButton-text"
               tabindex="0" type="button" id="cart-selector">
               <span class="MuiButton-label"><svg width="20" height="24"
                     viewBox="0 0 22 26" fill="none">
               <path fill-rule="evenodd" clip-rule="evenodd"
                        d="M7 2H15V6H7V2ZM5 2V6H0V23C0 24.6569 1.34315 26 3 26H19C20.6569 26 22 24.6569 22 23V6H17V2L15 0H7L5 2ZM9.80583 21.1304L9.69579 15.4386C10.356 15.3595 10.7961 14.8325 10.7961 14.2001V10.4055C10.7961 10.1947 10.6311 10.0366 10.411 10.0366C10.1909 10.0366 10.0259 10.1947 10.0259 10.4055V13.5149C10.0259 13.594 9.97087 13.673 9.86084 13.673H9.44822C9.3657 13.673 9.28317 13.6203 9.28317 13.5149V10.4055C9.28317 10.1947 9.11812 10.0366 8.89806 10.0366C8.67799 10.0366 8.51295 10.1947 8.51295 10.4055V13.5149C8.51295 13.594 8.45793 13.673 8.3479 13.673H7.93528C7.85275 13.673 7.77023 13.6203 7.77023 13.5149V10.4055C7.77023 10.1947 7.60518 10.0366 7.38511 10.0366C7.16505 10.0366 7 10.1947 7 10.4055V14.2001C7 14.8588 7.49515 15.3859 8.15534 15.4386L8.04531 21.1304C8.0178 21.6047 8.43042 22 8.92557 22C9.42071 22 9.80583 21.6047 9.80583 21.1304ZM14.0146 16.8352H14.6472C15.1149 16.8352 15.4725 16.4663 15.5 16.0446L15.39 14.5163C15.3074 13.4359 15.0599 12.3818 14.6472 11.3805C14.3447 10.669 13.6845 10.142 12.8867 10.0102C12.6942 9.95751 12.5016 10.1156 12.5016 10.3264L12.3641 21.1304C12.3366 21.6047 12.7492 22 13.2443 22C13.7395 22 14.1246 21.6047 14.1246 21.1304L14.0146 16.8352Z"></path></svg></span><span
                  class="MuiTouchRipple-root"></span>
            </button>
         </div>
      </div>

   </header>
	<section id="home">
	<img>
	</section>
    <!-- NAVIGATOR 버튼부분 -->
    <nav>
        <div class="biz_container" id="container_nav">
            <div id="bizBtnWrap">
                <button class="nav_btn"><span>주문조회</span></button>
                <button class="nav_btn" data-toggle="modal" data-target="#exampleModal"><span>공지사항</span></button>
                <button class="nav_btn"><span>판매액조회</span></button>
            </div>
            <div id="openBtnWrap">
                <span id="openSwitch">
                    <!-- 오픈 스위치 -->
                    <input type="checkbox" class="js-switch" id="store_open_switch" checked />
                </span>
            </div>

        </div>
    </nav>
  <!-- SECTION 3-1 Store_info -->
   <div id="store_info">
      <c:if test="${not empty storeVo }">
         <div class="container" id="container_store_info">
            <!--매장 이름-->
            <h1>${storeVo.store_name}</h1>
            <span id="store_description"> <!-- 매장 설명-->
               ${storeVo.store_description}
            </span> <span> <!-- 최근 게시판부분-->
             <c:if test="${not empty dboardList}">
                   <c:forEach items="${dboardList }" var="bvo" varStatus="s">
                      <div class="bossFinalNotice">${bvo.bcontent }</div>
                   </c:forEach>
                </c:if>
            </span>
         </div>
      </c:if>
   </div>

   <!-- SECTION 3-2 menu_info -->
   <section id="menu_info">
      <div class="container" id="container_menu_info">
         <c:if test="${not empty sortList }">
            <c:forEach items="${sortList}" var="sortList" varStatus="s">
               <div class="category">
                  <div class="category_name">
                     <h2>${sortList[0].menu_category}</h2>
                  </div>
                  <div class="category_products">
                     <c:if test="${not empty sortList}">
                        <c:forEach items="${sortList}" var="menuVo" varStatus="s">
                           <div class="product_card" onclick="clickProductCard(this);">
                              <div class="product_card_detail">
                                 <div class="product_name">
                                    <p>
                                       <span>${menuVo.menu_name}</span>&nbsp;&nbsp;
                                       <button class="sold_out_btn">Sold out</button>
                                    </p>
                                 </div>
                                 <div class="product_desc">${menuVo.menu_description}</div>
                                 <div class="product_price">
                                    <p><fmt:formatNumber value="${menuVo.menu_price}" pattern="#,###" />원</p>
                                 </div>
                              </div>
                              <div class="product_card_image">
                                 <img
                                    src="<%=ctxPath %>${menuVo.menu_img }"
                                    alt="Affogato">
                              </div>
                           </div>
                        </c:forEach>
                     </c:if>
                  </div>
                  <!--category 끝 -->
               </div>
            </c:forEach>
         </c:if>
      </div>
   </section>
                
                <!-- modal -->
               
               <!-- Modal Basic -->
            <div class="modal fade" id="exampleModal" tabindex="-1"
               role="dialog" aria-labelledby="exampleModalLabel"
               aria-hidden="true">
               <div class="modal-dialog modal-size" role="document">
                  <div class="modal-content modal-size">

                     <!-- modal-header -->
                     <div class="modal-header">
                        <button type="button" class="close" data-dismiss="modal"
                           aria-label="Close">
                           <span aria-hidden="true">&times;</span>
                        </button>
                        <div class="header-title"
                           style="font-weight: bold; font-size: 20px;">
                           <p>NOTICE</p>
                        </div>
                     </div>

                     <!-- modal-body -->
                     <div class="modal-body">
                        <div id="notice-table-container">
                           <div id="notice-table-body">
                              <!-- 테이블 th 부분 -->
                              <div class="notice-table-th">
                                 <div class="th-text-wrap">
                                    <div class="th-no">
                                       <span>NO.</span>
                                    </div>
                                    <div class="th-content">
                                       <span>CONTENT</span>
                                    </div>
                                    <div class="th-date">
                                       <span>DATE</span>
                                    </div>
                                 </div>

                                 <!-- 삭제버튼크기만큼 위치를 잡아줌 -->
                                 <div class="th-btn"></div>
                              </div>
                                 <c:if test="${not empty dboardAllList}">
          <c:forEach items="${dboardAllList}" var="vo" varStatus="s"> 
                              <div id="table-tr-wrap">
                                 <!-- 테이블 tr 부분 데이터 갯수만큼 출력 -->
                                 <div class="notice-table-tr">
                                    <div class="th-text-wrap">
                                       <div class="td-no">
                                          <span>${vo.bno }</span>
                                       </div>
                                       <div class="td-content">
                                          <span>${vo.bcontent }</span>
                                       </div>
                                       <div class="td-date">
                                          <span>${vo.bdate }</span>
                                       </div>
                                    </div>
                                    <div class="th-btn">
                                       <button class="rowDeleteBtn" onclick="deleteRow(this);">
                                          <span>✖</span>
                                       </button>
                                    </div>
                                 </div>
                                 </div>
                                 </c:forEach>
                                 </c:if>
                                 
                           <!-- notice-table-container-->
                        </div>
                        <!-- notice table list & btn -->
                       
                        <div id="insert-inputbox">
                           <div id="inputtextinput">
                               <form enctype="multipart/form-data"   method="post" action="<%=request.getContextPath()%>/boardInsert.lo"   onsubmit="return writefrm_submit();">
<c:if test="${not empty storeVo }">
      <table border="1">
         <tr style="display: none">
            <td><input type="text" name="bno" value="<%=bno%>">   <!-- 0은 새글, 그외 댓글인 경우는 읽고 있던 글의 bno를 넣어주기로 함. -->
      <input type="text" name="bref" value="<%=bref%>">
      <input type="text" name="bre_step" value="<%=bre_step%>">
      <input type="text" name="bre_level" value="<%=bre_level%>">
      <input type="text" name="bsubject" value="<%=bno %>">
      <input type="text" name="bwriter" value="${storeVo.store_name}">
      </td>
         </tr>
         <tr>
            <td><input type="text" name ="bcontent" id="bcontent" style="padding: 5px;" placeholder="내용을 입력해주세요."></td>
         
         
            <td colspan="1">
               <input type="submit" id="btn-add-row" value="추가">
            </td>
         </tr>
      </table>
      </c:if>


   </form>
                           </div>
                         
                        </div>
                        <!-- modal-footer -->
                        <div class="modal-footer">
                           <br>
                          
                           <button type="button" class="btnChk" id="signin_modify" name="signin_modify">수정</button>
                           <button type="button" class="btnChk" id="signin_cancel" name="signin_cancel">취소</button>
                        </div>
                        <!-- modal body 끝 -->

                            </div>
                        </div>
                    </div>
                </div>

            </div>
        </div>
    </section>
  <!-- FOOTER -->
   <footer>
      <div class="container">
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
               <p>We believe that time is precious. We strive to create
                  beautiful technology that helps you save time and make ordering
                  easy, both sides of the counter. Order from JABA with the best
                  selection of local cafes.</p>
               <div class="legal">
                  <div>
                     <div class="legal__copyright">© 2020 JABA Technologies Pty
                        Ltd</div>
                     <ul class="legal__links">
                        <li><a
                           class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
                           href="/legal/privacy-policy">Privacy Policy</a></li>
                        <li><a
                           class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
                           href="/legal/terms-and-conditions">Terms of Use</a></li>
                        <li><a
                           class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
                           href="https://help.bopple.com/" target="_blank"
                           rel="noopener noreferrer">Help Centre</a></li>
                        <li><a
                           class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary"
                           href="https://customer-contact-help.bopple.com" target="_blank"
                           rel="noopener noreferrer">Leave Feedback</a></li>
                     </ul>
                  </div>
               </div>
            </div>
         </div>
      </div>

   </footer>
    <!-- switchery -->
    <script>
        // switchery 
        var elem = document.querySelector('.js-switch');
        var init = new Switchery(elem);
    </script>
    <!-- 버튼 누르면 한 행 추가 삭제  -->
    <script>

        function getBoardId() {
            if ($('#notice-table-body > #table-tr-wrap .notice-table-tr:last > .th-text-wrap > .td-no > span').text() == '') {
                return 1;
                // 임시로 나중에 수정해야함. 현재 게시글번호는 string 인데 불러와야함 
            } else {
                return parseInt($('#notice-table-body > #table-tr-wrap .notice-table-tr:first > .th-text-wrap > .td-no > span').text()) + 1;
            }
        }

        $('#btn-add-row').click(function () {
            // 현재 날짜 구하기 
            var time = new Date().toLocaleTimeString();
            var date = new Date();
            var currDate = date.getFullYear() + '-' + (date.getMonth() + 1) + '-' + date.getDate() + ' ' + date.getHours() + ':' + date.getMinutes() + ':' + date.getSeconds();
            var boardId = getBoardId();
            var boardContent = $('#boardContentInput').val();
            $('#notice-table-body #table-tr-wrap').prepend('<div class="notice-table-tr"><div class="th-text-wrap"><div class="td-no"><span>' + boardId + '</span></div><div class="td-content"><span>' + boardContent + '</span></div><div class="td-date"><span>' + currDate + '</span></div></div><div class="th-btn"><button class="rowDeleteBtn" onclick="deleteRow(this);"><span>x</span></button></div></div>');
            $('#boardContentInput').val('');
        });

        // 행삭제 
        function deleteRow(obj) {
            $(obj).parent().parent().remove();
        }
            // 스크립트 공격대비해야함 .
            
       
       
    </script>
    <!-- 게시판에 글 추가 -->
    <script type="text/javascript">
   function writefrm_submit(){
      //document.getElementById("bwriter");
      // 유효성 체크 부분 이부분에 넣어 줌
      // 유효성에 문제가 있으면 return false;
      // 유효성에 문제가 없다면 
      return true;
   }
</script>



 <script>
   // 메뉴가격 전역변수
   var menu_price = 0;
   var currunetMenuPrice = 0;
   var num = 1;

   function clickProductCard(obj){
         var aa = $(obj).children("div").children(".product_name").children().children("span").text();
         currentMenuPrice = 0;
         num = 1;
        // 메뉴 모달창 하단 - + 버튼
         $.ajax({
             url: "<%=ctxPath%>/menu/selectMenu.do",
            data : {
               menu_name : aa
            },
            success : function(res) {
               console.log("현재 res값은 " + res);
               menu_price = parseInt(res,10);
               currunetMenuPrice = parseInt(res,10);
               
               /*                console.log($("#custom-add-price").text);
                $("#custom-add-price").html(currunetMenuPrice); 확인요망 */
                // 모달부분 jstl 부분 reload 시켜주기위해서 load
                $(".header-title").load(location.href + " .header-title");
                $(".header-subtitle").load(location.href + " .header-subtitle");
                $(".header-image").load(location.href + " .header-image");
                $(".modal-body").load(location.href + " .modal-body");
                $(".product-modal__actions").load(location.href + " .product-modal__actions");

                /* $("#custom-add-price").html(currunetMenuPrice);
                $(".modal-footer").load(location.href + " .modal-footer"); */

            }
         });

      }

   function QuantityDownFunc(){
               var stat = $('#numberUpDown').text();
               num = parseInt(stat, 10);
               num--;
               if (num <= 0) {
                  num = 1;
               }
               //$("#custom-add-price").text(num * menu_price);
               $('#numberUpDown').text(num);
               var sum = currunetMenuPrice;
               var count = $(".chkbox").length;
               for(var i=0; i < count; i++ ){
                   if( $(".chkbox")[i].checked == true ){
                    sum += parseInt($(".chkbox")[i].value);
                   }
               }
               sum = sum * num;
               //html 을 text로
               $("#custom-add-price").text(sum);
   }
   
   function QuantityUpFunc(){
               var stat = $('#numberUpDown').text();
               num = parseInt(stat, 10);
               num++;
               //$("#custom-add-price").text(num * menu_price);
               $('#numberUpDown').text(num);
               var sum = currunetMenuPrice;
               var count = $(".chkbox").length;
               for(var i=0; i < count; i++ ){
                   if( $(".chkbox")[i].checked == true ){
                    sum += parseInt($(".chkbox")[i].value);
                   }
               }
               sum = sum * num;
               //html 을 text로
               $("#custom-add-price").text(sum);
   }
   
   // 체크박스 선택 시 합계 금액 바꿔주는 메소드
     function itemSum(){
       $('#numberUpDown').text(num);
       var sum = currunetMenuPrice;
       var count = $(".chkbox").length;
       for(var i=0; i < count; i++ ){
           if( $(".chkbox")[i].checked == true ){
            sum += parseInt($(".chkbox")[i].value);
           }
       }
        var stat = $('#numberUpDown').text();
       
       //html 을 text로
       var r = sum * stat;
       $("#custom-add-price").text(sum * stat);
    } 
      
   </script>
   <script>
   //addorder 버튼 클릭시 작동하는 function()
   function addOrder(){
         console.log("order버튼클릭"); 
         console.log(parseInt($("#custom-add-price").text()));
         console.log(parseInt($("#numberUpDown").text()));
         var order_quantity = parseInt($("#numberUpDown").text());
         
         // user_id, menuVo.menuid값를 가지고 ajax 통신 -- data 부분 없어도 될것같음, 세션에 다 저장되어있기때문에
         $.ajax({
            url: "<%=ctxPath%>/order/insertOrder.do",
            data : {
               quantity : order_quantity
            },
            method: "post",
            success : function(res){
               var orderStatus = "OrderFail";
               if(res == orderStatus){
                  alert("로그인이 필요합니다.");
               }else{
                  // 커스텀부분 추가
                  // for문이 돌아가면서 체크된 커스텀만큼 customCheckInsert를 함
                        customCheckAjax(res);
               }
            }
         });
         console.log("닫는버튼 부분");
         document.getElementById("CustomCloseBtn").click();
        
   }

   // session 에 orderVo 가 저장된 상태 
   // custom_check 테이블에 custom_check_id를 시퀀스로 생성하고 ㄷ
   function customCheckAjax(res){
      console.log("버튼클릭시 ajax 잘 동작함");
      // for문이 돌아가면서 체크된 커스텀만큼 customCheckInsert를 함
       var count = $(".chkbox").length;
      for(var i=0; i < count; i++ ){
           if( $(".chkbox")[i].checked == true ){
            var customCheckName = $(".chkbox").eq(i).next().text();

            $.ajax({
               url: "<%=ctxPath%>/order/insertCustomCheck.do",
               async:false,
                data : {
                   customCheckName : customCheckName
                },
                method : "post",
                success : function(res){
                   console.log("커스텀체크부분 ajax 통신 잘됨");
                }
            });
           }
       }
      cartAjax(res);
   }
   
   // cartNo 를 1증가시키고 해당 cartNo로 cart에 추가
   function cartAjax(res){
     var totalPrice = (parseInt($("#custom-add-price").text()));
     console.log("총가격 !!  : " + (parseInt($("#custom-add-price").text())));
      $.ajax({
          url: "<%=ctxPath%>/cart/insertCart.do",
        data : {
           cart_total_price : totalPrice
        },
        method : "post",
        success : function(res){
           console.log("cart부분 ajax제대로 동작");
        }
      });
   }
   </script>
   <script type="text/javascript" id="rendered-js">
   // 클릭시 장바구니 슬라이드바가 열리게 함
      $("#cart-selector").click(function() {
         $("#cart-menu,.page_cover,html").addClass("open");
         window.location.hash = "#open";
         $.ajax({
             url: "<%=ctxPath%>/cart/selectCart.do",
             async:false,
             data : {
             },
             method : "post",
             success : function(res){
                console.log("ajax통신 잘됨");
               // 클릭되면 슬라이드바 안쪽에 있는애들이 refresh 되어야함 
               $(".order-details h3").load(location.href + " .order-details h3");
               $(".order-items").load(location.href + " .order-items");
               $(".order-actions").load(location.href + " .order-actions");
             }
         });
      });

      window.onhashchange = function() {
         if (location.hash != "#open") {
            $("#cart-menu,.page_cover,html").removeClass("open");
         }
      };
      
      // checkOutBtn 클릭시 checkout 페이지로 이동
      function checkOutBtnFnc(){
         location.href="<%=ctxPath%>/payment/checkout.do";
      }
      
      // 장바구니 delete
      function deleteCart(obj){
         var orderId = $(obj).attr("id");
         var menuName = $(obj).prev().children(".name").text();
          var result = confirm("카트에서 " + menuName + "를 삭제하시겠습니까 ?");
          if(result)
          {
         $.ajax({
            url : "<%=ctxPath%>/cart/deleteCart.do",
               data:   {orderId : orderId},
               method: "post",
               success: function(){
                // 내가 X를 클릭한 cart-order-item만 remove 시키고 싶은데..
               $(obj).parent().remove();
               $("#cart-menu,.page_cover,html").addClass("open");
               window.location.hash = "#open";
               $.ajax({
                   url: "<%=ctxPath%>/cart/selectCart.do",
                   async:false,
                   data : {
                   },
                   method : "post",
                   success : function(res){
                      console.log("ajax통신 잘됨");
                     // 클릭되면 슬라이드바 안쪽에 있는애들이 refresh 되어야함 
                     $(".order-details h3").load(location.href + " .order-details h3");
                     $(".order-items").load(location.href + " .order-items");
                     $(".order-actions").load(location.href + " .order-actions");
                   }
               });
            }
         });
          }
          else
          {
             console.log("카트에서 삭제를 취소");
          }  
      }

   // 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
     $("#logoutBtn").on("click",function(){
         $.ajax({
            url:"<%=ctxPath%>/client/clientLogout.do",
            data:   {},
            success: function(){
               $("#logoutBtn").hide();
               location.href="../";
            }
         });
         });
</script>
  <script>
      // 페이지 로딩되었을때 로그인이 되어있는지 확인
      $(document).ready(function(){
         $.ajax({
            url:"../client/loginCheck.do",
            data:{ },
            success: function(res1){
               if(res1 == 'KeepLogin'){
                  $("#cart-selector").hide();
                  $("#logoutBtn").show();
               }
            }
         });
      });
   </script>
   <script>
   // 매장 상태 on / off 버튼
   $(document).ready
   </script>
</body>
</html>