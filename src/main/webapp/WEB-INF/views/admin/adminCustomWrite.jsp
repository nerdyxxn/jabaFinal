<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<%
	String ctxPath = request.getContextPath();
%>
<!DOCTYPE html>
<html lang="en">
<head>
<meta charset="utf-8">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<meta name="description" content="">
<meta name="author" content="Dashboard">
<meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
<title>Admin Custom page</title>

<!-- Favicons -->
<link href="img/favicon.png" rel="icon">
<link href="img/apple-touch-icon.png" rel="apple-touch-icon">
<!-- Bootstrap core CSS -->
<link href="<%=ctxPath%>/resources/js/admin/lib/bootstrap/css/bootstrap.css" rel="stylesheet">
<!--external css-->
<link href="<%=ctxPath%>/resources/js/admin/lib/font-awesome/css/font-awesome.css" rel="stylesheet" />
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/admin/css/zabuto_calendar.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/js/admin/lib/gritter/css/jquery.gritter.css" />
<!-- Custom styles for this template -->
<link href="<%=ctxPath%>/resources/css/admin/css/style.css" rel="stylesheet">
<link href="<%=ctxPath%>/resources/css/admin/css/style-responsive.css" rel="stylesheet">
<script src="<%=ctxPath%>/resources/js/admin/lib/chart-master/Chart.js"></script>
<!-- FONT -->
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans&display=swap" rel="stylesheet">
<link href="https://fonts.googleapis.com/css2?family=Noto+Sans+KR&display=swap" rel="stylesheet">


<!--===============================================================================================-->
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/tableUtil.css">
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/adminCustomWrite.css">
<!--===============================================================================================-->
</head>

<body>
  <section id="container">
    <!-- **********************************************************************************************************************************************************
        TOP BAR CONTENT & NOTIFICATIONS
        *********************************************************************************************************************************************************** -->
    <!--header start-->
    <header class="header black-bg">
      <div class="sidebar-toggle-box">
        <div class="fa fa-bars tooltips" data-placement="right" data-original-title="Toggle Navigation"></div>
      </div>
      <!--logo start-->
      <a href="<%=ctxPath%>/admin/adminMain.do" class="logo"><b>JABA</b></a>
      <!--logo end-->
      <div class="top-menu">
        <ul class="nav pull-right top-menu">
          <li><button class="logout" id="logoutBtn">Logout</button></li>
        </ul>
      </div>
    </header>
    <!--header end-->
    <!-- **********************************************************************************************************************************************************
        MAIN SIDEBAR MENU
        *********************************************************************************************************************************************************** -->
    <!--sidebar start-->
    <aside>
      <div id="sidebar" class="nav-collapse ">
        <!-- sidebar menu start-->
        <ul class="sidebar-menu" id="nav-accordion">
           <p class="centered"><img src="<%=ctxPath %>/resources/images/clogo1.png" width="80"></p>
          <h5 class="centered">admin</h5>
          <li class="mt">
            <a href="<%=ctxPath%>/admin/adminMain.do">
              <i class="fa fa-dashboard"></i>
              <span>Main</span>
              </a>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-desktop"></i>
              <span>Client</span>
              </a>
            <ul class="sub">
              <li><a href="<%=ctxPath%>/admin/adminClient.do">전체 회원 정보</a></li>
              <li><a href="<%=ctxPath%>/admin/adminClient.do">회원 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a class="active" href="javascript:;">
              <i class="fa fa-cogs"></i>
              <span>Biz Store</span>
              </a>
            <ul class="sub">
              <li><a href="<%=ctxPath%>/admin/store/selectAdminStore.do">매장 정보</a></li>
              <li><a href="<%=ctxPath%>/admin/store/selectAdminStore.do">매장 선택</a></li>
              <li><a href="<%=ctxPath%>/admin/store/selectAdminStore.do">매장 관리</a></li>
            </ul>
          </li>
          <li class="sub-menu">
            <a href="javascript:;">
              <i class="fa fa-book"></i>
              <span>Q & A</span>
              </a>
            <ul class="sub">
              <li><a href="<%=ctxPath%>/admin/qna/qnaList.do">Q&A 관리</a></li>
            </ul>
          </li>
          <li>
            <a href="https://www.google.com/maps">
              <i class="fa fa-map-marker"></i>
              <span>Google Maps </span>
              </a>
          </li>
        </ul>
        <!-- sidebar menu end-->
      </div>
    </aside>
    <!--sidebar end-->
    <!-- **********************************************************************************************************************************************************
        MAIN CONTENT
        *********************************************************************************************************************************************************** -->
		<!--Qna List-->
		<section id="main-content">
			<section class="wrapper">
				<div class="col-lg-9 main-chart">
					<!--CUSTOM CHART START -->
					<div class="border-head">
						<h3>CUSTOM 추가</h3>
					</div>
					<div class="qna-custom-bar-chart">
						<div class="limiter">
							<div class="container-table100">
								<div class="wrap-table100">
									<div class="table">
										<div class="trow theader" id="theader">
											<div class="cell">NO.</div>
											<div class="cell" id="theaderRow">TITLE</div>
										</div>
										<div class="trow">
											<div class="cell" data-title="NAME">NAME</div>
											<div class="cell"><input type="text" name="custom_name" id="custom_name" />
											</div>
										</div>
										<div class="trow">
											<div class="cell" data-title="PRICE">PRICE</div>
											<div class="cell">
												<input type="text" name="custom_price" id="custom_price" />
											</div>
										</div>
										<div class="trow">
											<div class="cell" data-title="CATEGORY">CATEGORY</div>
											<div class="cell">
												<input type="text" name="custom_category" id="custom_category" />
											</div>
										</div>
									</div>
								</div>
								<div class="btnContainer" style="padding: 10px">
									<input type="button" value="완료" id="addCustomBtn">
									<input type="button" value="돌아가기"
										onclick="javascript:location.href='<%=ctxPath%>/admin/store/adminMenuDetail.do?menu_id=${menuDetail.menu_id }'" />
								</div>
							</div>
						</div>
					</div>
				</div>
			</section>
		</section>
          <!-- /col-lg-3 -->
        <!-- /row -->
      </section>
    <!--main content end-->
    <!--footer start-->
<!--     <footer class="site-footer">
      <div class="text-center">
        <p>
          &copy; Copyrights <strong>Dashio</strong>. All Rights Reserved
        </p>
        <div class="credits">
          
            You are NOT allowed to delete the credit link to TemplateMag with free version.
            You can delete the credit link only if you bought the pro version.
            Buy the pro version with working PHP/AJAX contact form: https://templatemag.com/dashio-bootstrap-admin-template/
            Licensing information: https://templatemag.com/license/
         
          Created with Dashio template by <a href="https://templatemag.com/">TemplateMag</a>
        </div>
        <a href="index.html#" class="go-top">
          <i class="fa fa-angle-up"></i>
          </a>
      </div>
    </footer> -->
    <!--footer end-->
  <!-- js placed at the end of the document so the pages load faster -->
  <script src="<%=ctxPath%>/resources/js/admin/lib/jquery/jquery.min.js"></script>

  <script src="<%=ctxPath%>/resources/js/admin/lib/bootstrap/js/bootstrap.js"></script>
  <script class="include" type="text/javascript" src="<%=ctxPath%>/resources/js/admin/lib/jquery.dcjqaccordion.2.7.js"></script>
  <script src="<%=ctxPath%>/resources/js/admin/lib/jquery.scrollTo.min.js"></script>
  <script src="<%=ctxPath%>/resources/js/admin/lib/jquery.nicescroll.js" type="text/javascript"></script>
  <script src="<%=ctxPath%>/resources/js/admin/lib/jquery.sparkline.js"></script>
  <!--common script for all pages-->
  <script src="<%=ctxPath%>/resources/js/admin/lib/common-scripts.js"></script>
  <script type="text/javascript" src="<%=ctxPath%>/resources/js/admin/lib/gritter/js/jquery.gritter.js"></script>
  <script type="text/javascript" src="<%=ctxPath%>/resources/js/admin/lib/gritter-conf.js"></script>
  <!--script for this page-->
  <script src="<%=ctxPath%>/resources/js/admin/lib/sparkline-chart.js"></script>
  <script src="<%=ctxPath%>/resources/js/admin/lib/zabuto_calendar.js"></script>
  <script type="text/javascript" id="rendered-js">
  // 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
    $("#logoutBtn").on("click",function(){
        $.ajax({
           url:"<%=ctxPath%>/client/clientLogout.do",
           data:   {},
           success: function(){
              $("#logoutBtn").hide();
              location.href = "../../";
           }
        });
        });
  </script>
 
  <script type="text/javascript">
	// menu add btn
	$("#addCustomBtn").on("click", function(){
		var custom_name = $("#custom_name").val();
		var custom_price = $("#custom_price").val();
		var custom_category = $("#custom_category").val();
		var menu_id = "${menuDetail.menu_id}";
		if(confirm("해당 커스텀을 추가하시겠습니까?")){
			
		$.ajax({
			url:"<%=ctxPath%>/admin/store/customAdd.do", 
			method : "POST",
			data : {
				custom_name : custom_name,
				custom_price : custom_price,
				custom_category : custom_category
			}, 
			success : function(){
				console.log("커스텀 추가 성공!");
			 	location.href="<%=ctxPath%>/admin/store/adminMenuDetail.do?menu_id="+menu_id;
			}
		});
		}
	});
	</script>
</body>
</html>
