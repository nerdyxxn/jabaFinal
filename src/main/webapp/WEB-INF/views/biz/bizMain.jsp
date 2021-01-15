<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();
%>
<!-- board INPUT을 위함 -->
<%
   String bno = (request.getParameter("bno") != null) ? request.getParameter("bno") : "0";
String bref = (request.getParameter("bref") != null) ? request.getParameter("bref") : "0";
String bre_step = (request.getParameter("bre_step") != null) ? request.getParameter("bre_step") : "0";
String bre_level = (request.getParameter("bre_level") != null) ? request.getParameter("bre_level") : "0";
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>Biz Partner Main</title>
<!-- Bootstrap -->
<link rel="stylesheet"
   href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
<script
   src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
<script
   src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
<!-- RESET -->
<link href="<%=ctxPath%>/resources/css/html5_reset.css" rel="stylesheet">
<!-- FONT -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap"
   rel="stylesheet">
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<!-- HEADER CSS -->
<link href="<%=ctxPath%>/resources/css/header.css" rel="stylesheet">
<!-- SECTION CSS -->
<link href="<%=ctxPath%>/resources/css/section.css" rel="stylesheet">
<!-- FOOTER CSS -->
<link href="<%=ctxPath%>/resources/css/footer.css" rel="stylesheet">
<!-- BIZMAIN CSS -->
<link href="<%=ctxPath%>/resources/css/bizMain.css" rel="stylesheet">
<!-- 체크박스 라디오버튼 CSS -->
<link href="<%=ctxPath%>/resources/css/icheck-material.css"
   rel="stylesheet" type="text/css">

<!-- switchery-->
<link rel="stylesheet" href="<%=ctxPath%>/resources/css/switchery.css" />
<script src="<%=ctxPath%>/resources/js/switchery.js"></script>
<!-- 폰트부분 -->
<link
   href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap"
   rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Inter&display=swap"
   rel="stylesheet">
<!-- 아이콘 폰트-->
<link rel="stylesheet"
   href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>


</head>

<body>
   <!-- HEADER -->
   <header>
      <div class="header_container">
         <div class="logo">
            <a href="<%=ctxPath%>/"> <img
               src="<%=ctxPath%>/resources/images/clogo1.png"
               style="width: 30px; height: 30px;">
            </a>
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
            <button class="nav_btn">
               <span>주문조회</span>
            </button>
            <button class="nav_btn" data-toggle="modal"
               data-target="#exampleModal">
               <span>공지사항</span>
            </button>
            <button class="nav_btn">
               <span>판매액조회</span>
            </button>
         </div>
         <div id="openBtnWrap">
            <span id="openSwitch"> <c:if test="${not empty storeVo}">
                  <c:if test="${biz.store_status == 1 }">
                     <!-- 오픈 스위치 -->
                     <input type="checkbox" class="js-switch" id="store_open_switch"
                        checked />
                  </c:if>
                  <c:if test="${biz.store_status == 2 }">
                     <!-- 오픈 스위치 -->
                     <input type="checkbox" class="js-switch" id="store_open_switch" />
                  </c:if>
               </c:if>
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
            </span> <span> <!-- 최근 게시판부분--> <c:if test="${not empty boardList}">
                  <div class="bossFinalNotice">${boardList[0].store_board_title }</div>
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
                           <c:if test="${menuVo.menu_available == 1 }">
                              <div class="product_card">
                           </c:if>
                           <c:if test="${menuVo.menu_available == 2}">
                              <div class="product_card" style="opacity: 0.3;">
                           </c:if>
                           <div class="product_card_detail">
                              <div class="product_name">
                                 <p>
                                    <span>${menuVo.menu_name}</span>&nbsp;&nbsp;
                                    <button class="sold_out_btn">Sold out</button>
                                    <input type="hidden" id="${menuVo.menu_id}"
                                       value="${menuVo.menu_available}">
                                 </p>
                              </div>
                              <div class="product_desc">${menuVo.menu_description}</div>
                              <div class="product_price">
                                 <p>
                                    <fmt:formatNumber value="${menuVo.menu_price}"
                                       pattern="#,###" />
                                    원
                                 </p>
                              </div>
                           </div>
                           <div class="product_card_image">
                              <img src="<%=ctxPath %>${menuVo.menu_img }" alt="Affogato">
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
   <div class="modal fade" id="exampleModal" tabindex="-1" role="dialog"
      aria-labelledby="exampleModalLabel" aria-hidden="true">
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
                     <c:if test="${not empty boardList}">
                        <c:forEach items="${boardList}" var="boardList" varStatus="s">
                           <div id="table-tr-wrap">
                              <!-- 테이블 tr 부분 데이터 갯수만큼 출력 -->
                              <div class="notice-table-tr">
                                 <div class="th-text-wrap">
                                    <div class="td-no">
                                       <span>${boardList.board_no }</span>
                                    </div>
                                    <div class="td-content">
                                       <span>${boardList.store_board_title }</span>
                                    </div>
                                    <div class="td-date">
                                       <span>${boardList.store_board_time }</span>
                                    </div>
                                 </div>
                                 <div class="th-btn">
                                    <button class="rowDeleteBtn" onclick="deleteBoard(this);" id="${boardList.board_no }">
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
                        <form enctype="multipart/form-data" method="post"
                           action="<%=ctxPath%>/biz/board/insertBizBoard.do"
                           onsubmit="return writefrm_submit();">
                              <table border="1">
                           <c:if test="${not empty boardList }">
                                 <tr style="display: none">
                                    <td><input type="text" name="bno" value="<%=bno%>">
                                       <input type="text" name="bsubject" value="<%=bno%>">
                                       <input type="text" name="bwriter"
                                       value="${storeVo.store_name}"></td>
                                 </tr>
                           </c:if>
                                 <tr>
                                    <td><input type="text" name="store_board_title"
                                       id="store_board_title" style="padding: 5px;"
                                       placeholder="내용을 입력해주세요."></td>


                                    <td colspan="1"><input type="button" id="btn-add-row"
                                       value="추가"></td>
                                 </tr>
                              </table>


                        </form>
                     </div>

                  </div>
                  <!-- modal-footer -->
                  <div class="modal-footer">
                     <br>

                     <button type="button" class="btnChk" id="signin_modify"
                        name="signin_modify">수정</button>
                     <button type="button" class="btnChk" id="signin_cancel"
                        name="signin_cancel">취소</button>
                  </div>
                  <!-- modal body 끝 -->

               </div>
            </div>
         </div>
      </div>

   </div>
   <!-- FOOTER -->
   <footer>
      <div class="container">
         <div class="row">
            <div class="footer_logo">
               <img src="<%=ctxPath%>/resources/images/clogo1.png"
                  style="width: 30px; height: 30px;">
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
<script type="text/javascript" id="rendered-js">
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
   function clickProductCard(obj){
         var aa = $(obj).children("div").children(".product_name").children().children("span").text();
      }
      
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
   // 매장 상태 on / off 버튼
   $(document).ready(function(){
      $("#store_open_switch").change(function(){
         var store_status;
          if($("#store_open_switch").is(":checked")){
              store_status = 1;
          }else{
              store_status = 2;
           }
         $.ajax({
             url:"<%=ctxPath%>/biz/openClose.do",
             data:{ 
                store_status : store_status
             },
             success: function(res){
                
             }
        }); 
      });
   });
   $(".sold_out_btn").on("click",function(){
      var soldOutCheck = $(this).parent().parent().parent().parent().css("opacity");
      if(soldOutCheck == "0.3"){
         $(this).parent().parent().parent().parent().css("opacity","1");
      }else{
         $(this).parent().parent().parent().parent().css("opacity","0.3");
      }
      var menu_id = $(this).next().attr("id");
      var menu_available = $(this).next().attr("value");
      // ajax menu_available cloum 을 바꿔줌 
         $.ajax({
             url:"<%=ctxPath%>/biz/soldOut.do",
             data:{ 
                menu_id : menu_id,
                menu_available : menu_available
             },
             success: function(res){
             }
         });
      if (menu_available == 1) {
         $(this).next().val(2);
      } else {
         $(this).next().val(1);
      }
   });
   
   
   </script>
<script>
$("#btn-add-row").on("click", function(){
    var store_board_title = $("#store_board_title").val();
    console.log("삽입 버튼 작동");
    alert(store_board_title);
         $.ajax({
             url:"<%=ctxPath%>/biz/board/insertBizBoard.do",
             data:{
          	   store_board_title : store_board_title
             },
             method: "POST",
             success: function(res){
                if(res=="insertSuccess"){
                   console.log("삽입 성공");
                   //모달 일부 새로고침 
                   //$(".th-btn").load(location.href + " .th-btn");
                   $("#table-tr-wrap").load(location.href + " #table-tr-wrap");
                   //$(".notice-table-tr").load(location.href + " .notice-table-tr");
                   //$(".th-text-wrap").load(location.href + " .th-text-wrap");
                       //$(".td-no").load(location.href + " .td-no");
                       //$(".td-content").load(location.href + " .td-content");
                       //$(".td-date").load(location.href + " .td-date");
                       //$(".th-btn").load(location.href + " .th-btn");
                } else {
                   alert("게시글 삽입 실패");
                   }
                }
             });
 });
</script>

   <script>
      function deleteBoard(obj){
         var board_no = $(obj).attr("id");
         alert(board_no);
         $.ajax({
            url:"<%=ctxPath%>/biz/board/deleteBizBoard.do",
            data:{
               board_no : board_no
            },
            method: "POST",
            success: function(res){
               if(res=="deleteSuccess"){
                  console.log("삭제 성공");
                  //모달 일부 새로고침 
                  //$(".th-btn").load(location.href + " .th-btn");
                  $("#table-tr-wrap").load(location.href + " #table-tr-wrap");
                  //$(".notice-table-tr").load(location.href + " .notice-table-tr");
                  //$(".th-text-wrap").load(location.href + " .th-text-wrap");
                      //$(".td-no").load(location.href + " .td-no");
                      //$(".td-content").load(location.href + " .td-content");
                      //$(".td-date").load(location.href + " .td-date");
                      //$(".th-btn").load(location.href + " .th-btn");
               } else {
                  alert("게시글 삭제 실패");
                  }
               }
            });
      };
   </script>
</body>
</html>