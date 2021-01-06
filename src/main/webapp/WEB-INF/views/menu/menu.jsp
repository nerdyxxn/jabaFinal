<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
   String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>store_menu</title>
<script src='https://code.jquery.com/jquery-3.4.0.js'></script>
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
<!-- MENU CSS -->
<link href="<%=ctxPath%>/resources/css/menu.css" rel="stylesheet">
<!-- 체크박스 라디오버튼 CSS -->
<link href="<%=ctxPath%>/resources/css/icheck-material.css" rel="stylesheet" type="text/css">

<script>
   $(function() {
      $(window).scroll(function() {
         var navbar = $(this).scrollTop();
         var $header = $('header');
         if (navbar > 0) {
            $header.addClass('activated');
         } else {
            $header.removeClass('activated');
         }
         $(".search-term").click(function() {
            $("#hidden_term").attr("style", "visibility:visible")
         })
         $(".hidden_term_close").click(function() {
            $("#hidden_term").attr("style", "visibility:hidden")
         })

      })
   })
   
   // sold-out 버튼 기본값 hide로 세팅
   $(document).ready(function () {
       $('.sold_out_btn').hide();
   });
   
   // 메뉴 카드 클릭 시 모달창 오픈
   $(document).ready(
         function() {
            $(".product_card").click(
                  function() {
                     $('div.modal').modal();
                  });
         });
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

</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="header_container">
			<div class="logo" >
				<a href="<%=ctxPath%>/index.jsp"><img src="<%=ctxPath%>/resources/images/clogo1.png" style="width:30px; height:30px;"></a>
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
	<!-- SECTION -->
	<section id="home">
		<img>

	</section>
	<!-- SECTION 2 -->
	<section id="search" class="mini">
		<div class="container">
			<div class="mini_row">
				<div class="time">
					<button>Pick up, ASAP</button>
				</div>
				<div class="search_loc">
					<button>AVENUE</button>
				</div>
				<div class="search-term">
					<button
						class="MuiButtonBase-root MuiIconButton-root search-term__icon  MuiIconButton-sizeSmall jss263"
						tabindex="0" type="button">
						<span class="MuiIconButton-label"> <svg
								class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
								aria-hidden="true" role="presentation">
            <path
									d="M15.5 14h-.79l-.28-.27C15.41 12.59 16 11.11 16 9.5 16 5.91 13.09 3 9.5 3S3 5.91 3 9.5 5.91 16 9.5 16c1.61 0 3.09-.59 4.23-1.57l.27.28v.79l5 4.99L20.49 19l-4.99-5zm-6 0C7.01 14 5 11.99 5 9.5S7.01 5 9.5 5 14 7.01 14 9.5 11.99 14 9.5 14z">
            </path>
            </svg>
						</span>
						<div class="MuiTouchRipple-root"></div>
					</button>
				</div>
				<div id="hidden_term">
					<button class="hidden_term_all">
						<div id="hidden_input">
							<input type="text" placeholder="Acai or Latte">
						</div>
						<button class="hidden_term_close">X</button>
					</button>

				</div>
			</div>
		</div>
	</section>
	<!-- SECTION 3 -->
	 <!-- SECTION1 Store_info -->
   <section id="store_info">
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
   </section>
	<!-- SECTION2 menu_info -->
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
												<p>${menuVo.menu_price}원</p>
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
	<!-- Modal Basic -->
	<div class="modal fade" id="exampleModalCenter" tabindex="-1"
		role="dialog" aria-labelledby="exampleModalCenterTitle"
		aria-hidden="true">
		<div class="modal-dialog modal-dialog-centered" role="document">
			<div class="modal-content modal-dialog-centered" id="mmmaaa">
				<!-- modal-header -->
				<div class="modal-header">
					<button type="button" class="close" data-dismiss="modal"
						aria-label="Close" id="CustomCloseBtn">
						<span aria-hidden="true">&times;</span>
					</button>

					<!-- 서블릿에서 가져온 메뉴 이름 출력하기 -->
					<div class="header-details">
						<div class="header-content">
							<div>
								<p class="header-title">${menuVo.menu_name }</p>
							</div>
							<div class="header-subtitle ">
								<p>${menuVo.menu_description }</p>
							</div>
						</div>
						<div class="header-image">
							<img
								src="<%=ctxPath %>${menuVo.menu_img }"
								alt="Aussie">
						</div>
					</div>
				</div>


				<!-- modal-body -->
				<div class="modal-body">
					<!-- 커스텀 리스트 반복 -->
					<c:if test="${not empty sortCustomList }">
						<c:forEach items="${sortCustomList}" var="sortCustomList"
							varStatus="s">
							<div class="category">
								<div class="checkbox-title">
									<p>${sortCustomList[0].custom_category}</p>
								</div>
								<div class="custom-content custom-grid">
									<c:if test="${not empty sortCustomList }">
										<c:forEach items="${sortCustomList}" var="sortCustomList"
											varStatus="s2">
											<div class="icheck-material-teal">
												<input type="checkbox" id="custom1${s.count }${s2.count }"
													class="chkbox" name="teal"
													value="${sortCustomList.custom_price}" onclick="itemSum();" />
												<label for="custom1${s.count }${s2.count }"
													class="customClick">${sortCustomList.custom_name}</label>
												<div>
													<span class="custom-charge">+</span><span
														class="custom-charge-jstl">${sortCustomList.custom_price}</span><span
														class="custom-charge"> 원</span>
												</div>
											</div>
										</c:forEach>
									</c:if>
								</div>
							</div>
						</c:forEach>
					</c:if>
				</div>
				<!-- modal-footer -->
				<div class="modal-footer product-modal__actions">
					<div class="quantity">
						<button
							class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorPrimary Mui-disabled Mui-disabled"
							tabindex="-1" type="button" id="decreaseQuantity"
							onclick="QuantityDownFunc();">
							<span class="MuiIconButton-label"><svg
									class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
									aria-hidden="true" role="presentation">
                           <path d="M19 13H5v-2h14v2z"></path>
                        </svg></span>
						</button>
						<span class="quantity__number" id="numberUpDown">1</span>
						<button
							class="MuiButtonBase-root MuiIconButton-root MuiIconButton-colorPrimary"
							tabindex="0" type="button" id="increaseQuantity"
							onclick="QuantityUpFunc();">
							<span class="MuiIconButton-label"><svg
									class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
									aria-hidden="true" role="presentation">
                           <path d="M19 13h-6v6h-2v-6H5v-2h6V5h2v6h6v2z"></path>
                        </svg></span><span class="MuiTouchRipple-root"></span>
						</button>
					</div>
					<div class="add-to-order">
						<button type="button" class="btnChk" id="addorder" name="addorder"
							onclick="addOrder();">
							<div>ADD TO ORDER</div>
							<div>
								<span id="custom-add-price">${menuVo.menu_price }</span><span>원</span>
							</div>
							<!-- 금액 부분에 기본적으로 선택한 메뉴의 가격이 출력되고, 체크박스 선택시 합산이 되어야 함! -->
						</button>
					</div>
				</div>
			</div>
		</div>
	</div>


	<!-- 장바구니 슬라이드 바 -->
	<div class="order-container">
		<div onclick="history.back();" class="page_cover"></div>
		<div id="cart-menu" class="cart-menu menu-container">
			<!-- X 버튼  -->
			<div onclick="history.back();" class="close"></div>
			<!-- header -->
			<div class="order-details">
				<h3>${storeVo.store_name}</h3>
				<div class="order-drawer-fulfilment">
					<button
						class="MuiButtonBase-root MuiButton-root jss135 MuiButton-text"
						tabindex="0" type="button">
						<span class="MuiButton-label">Pick up, ASAP</span><span
							class="MuiTouchRipple-root"></span>
					</button>
				</div>
			</div>
			<!-- body -->
			<div class="order-items" id="order-items">
				<!--  반복시작 -->
				<c:if test="${not empty cartList }">
					<c:forEach items="${cartViewVoList}" var="cartViewVoList"
						varStatus="s">
						<div class="cart-order-item" id="cart-order-item">
							<div id="cart-order-item__quantity">${cartViewVoList.order_quantity }</div>
							<div id="cart-order-item__details">
								<div class="name">${cartViewVoList.menu_name }</div>
								<div class="modifiers">
									<ul>
										<c:forEach items="${cartViewList[s.count-1]}"
											var="cartViewList" varStatus="s1">
											<li>${cartViewList }</li>
										</c:forEach>
									</ul>
									<div class="price">${cartViewVoList.cart_total_price }</div>
								</div>
							</div>
							<button id="MuiIconButton-sizeSmall"
								class="MuiButtonBase-root MuiIconButton-root cart-order-item__remove MuiIconButton-sizeSmall"
								tabindex="0" type="button">
								<span class="MuiIconButton-label"><svg
										class="MuiSvgIcon-root" focusable="false" viewBox="0 0 24 24"
										aria-hidden="true" role="presentation">
                        <path
											d="M19 6.41L17.59 5 12 10.59 6.41 5 5 6.41 10.59 12 5 17.59 6.41 19 12 13.41 17.59 19 19 17.59 13.41 12z"></path></svg></span><span
									class="MuiTouchRipple-root"></span>
							</button>
						</div>
					</c:forEach>
				</c:if>
				<!--  반복끝 -->
			</div>

			<!-- footer -->
			<div class="order-actions">
				<div class="order-actions__totals">
					<div class="total">
						<span>Total</span><span>${total_price }원</span>
					</div>
				</div>
				<button
					class="MuiButtonBase-root MuiButton-root checkout loader MuiButton-contained MuiButton-containedPrimary MuiButton-fullWidth"
					tabindex="0" type="button" id="checkOutBtn" onclick="checkOutBtnFnc();">
					<span class="MuiButton-label MuiButton-contained">Go to
						Checkout</span><span class="MuiTouchRipple-root"></span>
				</button>
			</div>
		</div>
	</div>


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
					<strong>JABA connects customers with popular cafe brands.</strong>
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
	<script>
   // 메뉴가격 전역변수
   var menu_price = 0;
   var currunetMenuPrice = 0;

   function clickProductCard(obj){
         var aa = $(obj).children("div").children(".product_name").children().children("span").text();
        // 메뉴 모달창 하단 - + 버튼
         $.ajax({
            url: "<%=ctxPath%>/menu/menuDetailView.do",
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
                $(".modal-footer").load(location.href + " .modal-footer");
 /*                $("#custom-add-price").html(currunetMenuPrice);
                $(".modal-footer").load(location.href + " .modal-footer"); */

            }
         });

      }

   function QuantityDownFunc(){
               var stat = $('#numberUpDown').text();
               var num = parseInt(stat, 10);
               num--;
               if (num <= 0) {
                  num = 1;
               }
               //$("#custom-add-price").text(num * menu_price);
               $('#numberUpDown').text(num);
   }
   
   function QuantityUpFunc(){
               var stat = $('#numberUpDown').text();
               var num = parseInt(stat, 10);
               num++;
               //$("#custom-add-price").text(num * menu_price);
               $('#numberUpDown').text(num);
   }
   
   // 체크박스 선택 시 합계 금액 바꿔주는 메소드
     function itemSum(){
       var sum = currunetMenuPrice;
       var count = $(".chkbox").length;
       for(var i=0; i < count; i++ ){
           if( $(".chkbox")[i].checked == true ){
            sum += parseInt($(".chkbox")[i].value);
           }
       }
       //html 을 text로
       $("#custom-add-price").text(sum);
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
            url: "<%=ctxPath%>/order/orderInsert.do",
            data : {
               quantity : order_quantity
            },
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
               url: "<%=ctxPath%>/menu/customChekcInsert.do",
               async:false,
                data : {
                   customCheckName : customCheckName
                },
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
	  var totalPrice = (parseInt($("#custom-add-price").text()) * parseInt($("#numberUpDown").text()));
	  console.log("총가격 !!  : " + (parseInt($("#custom-add-price").text()) * parseInt($("#numberUpDown").text())));
      $.ajax({
          url: "<%=ctxPath%>/cart/cartInsert.do",
        data : {
        	cart_total_price : totalPrice
        },
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
             url: "<%=ctxPath%>/cart/cartList.do",
             async:false,
             data : {
             },
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
    	  location.href="<%=ctxPath%>/checkout.jsp";
      }
   // 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
	  $("#logoutBtn").on("click",function(){
	      $.ajax({
	         url:"<%=ctxPath%>/client/clientLogout.do",
	         data:   {},
	         success: function(){
	            $("#logoutBtn").hide();
	         }
	      });
   		});
</script>
</body>
</html>