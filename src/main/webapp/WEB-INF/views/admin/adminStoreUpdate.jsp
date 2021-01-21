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
<title>Admin Store page</title>

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
<link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/adminStoreUpdate.css">
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
      <div class="nav notify-row" id="top_menu">
        <!--  notification start -->
        <ul class="nav top-menu">
          <!-- settings start -->
          <li class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-tasks"></i>
              <span class="badge bg-theme">4</span>
              </a>
           <ul class="dropdown-menu extended tasks-bar">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">You have 4 pending tasks</p>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Dashio Admin Panel</div>
                    <div class="percent">40%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-success" role="progressbar" aria-valuenow="40" aria-valuemin="0" aria-valuemax="100" style="width: 40%">
                      <span class="sr-only">40% Complete (success)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Database Update</div>
                    <div class="percent">60%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-warning" role="progressbar" aria-valuenow="60" aria-valuemin="0" aria-valuemax="100" style="width: 60%">
                      <span class="sr-only">60% Complete (warning)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Product Development</div>
                    <div class="percent">80%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-info" role="progressbar" aria-valuenow="80" aria-valuemin="0" aria-valuemax="100" style="width: 80%">
                      <span class="sr-only">80% Complete</span>
                    </div>
                  </div>
                </a>
              </li>
              <li>
                <a href="index.html#">
                  <div class="task-info">
                    <div class="desc">Payments Sent</div>
                    <div class="percent">70%</div>
                  </div>
                  <div class="progress progress-striped">
                    <div class="progress-bar progress-bar-danger" role="progressbar" aria-valuenow="70" aria-valuemin="0" aria-valuemax="100" style="width: 70%">
                      <span class="sr-only">70% Complete (Important)</span>
                    </div>
                  </div>
                </a>
              </li>
              <li class="external">
                <a href="#">See All Tasks</a>
              </li>
            </ul> 
          </li>
          <!-- settings end -->
          <!-- inbox dropdown start-->
          <li id="header_inbox_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-envelope-o"></i>
              <span class="badge bg-theme">5</span>
              </a>
             <ul class="dropdown-menu extended inbox">
              <div class="notify-arrow notify-arrow-green"></div>
              <li>
                <p class="green">You have 5 new messages</p>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="<%=ctxPath%>/resources/images/admin/img/ui-zac.jpg"></span>
                  <span class="subject">
                  <span class="from">Zac Snider</span>
                  <span class="time">Just now</span>
                  </span>
                  <span class="message">
                  Hi mate, how is everything?
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="<%=ctxPath%>/resources/images/admin/img/ui-divya.jpg"></span>
                  <span class="subject">
                  <span class="from">Divya Manian</span>
                  <span class="time">40 mins.</span>
                  </span>
                  <span class="message">
                  Hi, I need your help with this.
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="<%=ctxPath%>/resources/images/admin/img/ui-danro.jpg"></span>
                  <span class="subject">
                  <span class="from">Dan Rogers</span>
                  <span class="time">2 hrs.</span>
                  </span>
                  <span class="message">
                  Love your new Dashboard.
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="photo"><img alt="avatar" src="<%=ctxPath%>/resources/images/admin/img/ui-sherman.jpg"></span>
                  <span class="subject">
                  <span class="from">Dj Sherman</span>
                  <span class="time">4 hrs.</span>
                  </span>
                  <span class="message">
                  Please, answer asap.
                  </span>
                  </a>
              </li>
              <li>
                <a href="index.html#">See all messages</a>
              </li>
            </ul> 
          </li>
          <!-- inbox dropdown end -->
          <!-- notification dropdown start-->
          <li id="header_notification_bar" class="dropdown">
            <a data-toggle="dropdown" class="dropdown-toggle" href="index.html#">
              <i class="fa fa-bell-o"></i>
              <span class="badge bg-warning">7</span>
              </a>
           <ul class="dropdown-menu extended notification">
              <div class="notify-arrow notify-arrow-yellow"></div>
              <li>
                <p class="yellow">You have 7 new notifications</p>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  Server Overloaded.
                  <span class="small italic">4 mins.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-warning"><i class="fa fa-bell"></i></span>
                  Memory #2 Not Responding.
                  <span class="small italic">30 mins.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-danger"><i class="fa fa-bolt"></i></span>
                  Disk Space Reached 85%.
                  <span class="small italic">2 hrs.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">
                  <span class="label label-success"><i class="fa fa-plus"></i></span>
                  New User Registered.
                  <span class="small italic">3 hrs.</span>
                  </a>
              </li>
              <li>
                <a href="index.html#">See all notifications</a>
              </li>
            </ul>
          </li>
        </ul>
        <!--  notification end -->
      </div>
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
						<h3>STORE 상세 페이지 - ${storeDetail.store_name }</h3>
					</div>
					<div class="qna-custom-bar-chart">
						<div class="limiter">
							<div class="container-table100">
								<div class="wrap-table100">
									<div class="table">
										<div class="trow theader" id="theader">
											<div class="cell">TIME</div>
											<div class="cell">IMG</div>
											<div class="cell">DESCRIPTION</div>
										</div>
										<div class="trow">
											<div class="cell" data-title="TIME">
												<input style="background-color: #d6d9dc; color: #565656"
													type="text" name="store_time" id="store_time"
													value="${storeDetail.store_time }" />
											</div>
											<div class="cell" data-title="IMG">
												<input style="background-color: #d6d9dc; color: #565656"
													type="text" name="store_img" id="store_img"
													value="${storeDetail.store_img }" />
											</div>
											<div class="cell" data-title="DESCRIPTION">
												<input style="background-color: #d6d9dc; color: #565656"
													type="text" name="store_description" id="store_description"
													value="${storeDetail.store_description }" />
											</div>
										</div>
									</div>
								</div>
								<div class="btnContainer" style="padding: 10px">
									<input type="button" id="updateStoreBtn" value="완료">
									<input type="button" value="취소" onclick="javascript:location.href='<%=ctxPath%>/admin/store/adminStoreDetail.do?store_name=${storeDetail.store_name }'" />
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
  <script type="application/javascript">
    $(document).ready(function() {
      $("#date-popover").popover({
        html: true,
        trigger: "manual"
      });
      $("#date-popover").hide();
      $("#date-popover").click(function(e) {
        $(this).hide();
      });

    function myNavFunction(id) {
      $("#date-popover").hide();
      var nav = $("#" + id).data("navigation");
      var to = $("#" + id).data("to");
      console.log('nav ' + nav + ' to: ' + to.month + '/' + to.year);
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
   <script type="text/javascript">
  //상태 변경시 ajax
  $("#updateStoreBtn").on("click", function(){
	  var store_time=$("#store_time").val();
	  var store_img=$("#store_img").val();
  	  var store_description=$("#store_description").val();
  	  var store_name = "${storeDetail.store_name}";
  	  console.log(store_name);
  	if(confirm("현재 매장의 정보를 변경하시겠습니까?")){
	  $.ajax({
		 url:"<%=ctxPath%>/admin/store/updateStore.do",
		 method: "POST",
		 data: {

			 store_time : store_time,
			 store_img : store_img,
			 store_description : store_description
		 },
		 success: function(){
			 	location.href="<%=ctxPath%>/admin/store/adminStoreDetail.do?store_name="+store_name;			 
			} 
		 });
	  }
  });
  
  
  </script>
  
  
  
</body>

</html>