<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%@ taglib prefix="fmt" uri="http://java.sun.com/jsp/jstl/fmt"%>
<%@ taglib prefix="fn" uri="http://java.sun.com/jsp/jstl/functions"%>
<!DOCTYPE html>
<html lang="en">
<%
   String ctxPath = request.getContextPath();
%>
<head>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1.0">
  <meta name="description" content="">
  <meta name="author" content="Dashboard">
  <meta name="keyword" content="Dashboard, Bootstrap, Admin, Template, Theme, Responsive, Fluid, Retina">
  <title>Admin Main page</title>

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

  <!-- =======================================================
    Template Name: Dashio
    Template URL: https://templatemag.com/dashio-bootstrap-admin-template/
    Author: TemplateMag.com
    License: https://templatemag.com/license/
  ======================================================= -->
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
            <a class="active" href="<%=ctxPath%>/admin/adminMain.do">
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
            <a href="javascript:;">
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
    <!--main content start-->
    <section id="main-content">
      <section class="wrapper">
        <div class="row">
          <div class="col-lg-9 main-chart">
            <!--CUSTOM CHART START -->
            <div class="border-head">
              <h3>TOTAL SALES</h3>
            </div>
            <div class="custom-bar-chart">
              <ul class="y-axis">
                <li><span>150.000</span></li>
                <li><span>120.000</span></li>
                <li><span>90.000</span></li>
                <li><span>60.000</span></li>
                <li><span>30.000</span></li>
                <li><span>0</span></li>
              </ul>
              <div class="bar">
                <div class="title">${bizSalesList[6].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[6].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[6].pay_total_price}</div>
              </div>
              <div class="bar ">
                <div class="title">${bizSalesList[5].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[5].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[5].pay_total_price}</div>
              </div>
              <div class="bar ">
                <div class="title">${bizSalesList[4].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[4].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[4].pay_total_price}</div>
              </div>
              <div class="bar ">
                <div class="title">${bizSalesList[3].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[3].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[3].pay_total_price}</div>
              </div>
              <div class="bar">
                <div class="title">${bizSalesList[2].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[2].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[2].pay_total_price}</div>
              </div>
              <div class="bar ">
                <div class="title">${bizSalesList[1].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[1].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[1].pay_total_price}</div>
              </div>
              <div class="bar">
                <div class="title" style="font-weight:bold; color:#090909;">${bizSalesList[0].pay_time}</div>
                <div class="value tooltips" data-original-title="${bizSalesList[0].pay_total_price}" data-toggle="tooltip" data-placement="top">${bizSalesList[0].pay_total_price}</div>
              </div>
            </div>
            <!--custom chart end-->
            <div class="row mt">
              <!-- SERVER STATUS PANELS -->
              <div class="col-md-4 col-sm-4 mb">
                <div class="grey-panel pn donut-chart">
                  <div class="grey-header">
                    <h5>21년 1월 가입한 비즈파트너 수</h5>
                  </div>
                  <canvas id="serverstatus01" height="120" width="120"></canvas>
                  <script>
        			var countTotalBiz = ${countTotalBiz};
        			// 목표치 20이라고치고
                    var doughnutData = [{
                        value: countTotalBiz,
                        color: "#FFA618"
                      },
                      {
                        value: 20-countTotalBiz,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus01").getContext("2d")).Doughnut(doughnutData);
                  </script>
                  <div class="row">
                    <div class="col-sm-6 col-xs-6 goleft">
                      <p><br/>달성률 :</p>
                    </div>
                    <div class="col-sm-6 col-xs-6">
               <c:set var="bizTotal" value="20"/>
               <c:set var="bizTotal" value="${countTotalBiz/bizTotal}"/>
                      <h2><fmt:formatNumber value="${bizTotal}" type="percent"/></h2> 
                    </div>
                  </div>
                </div>
                <!-- /grey-panel -->
              </div>
              <!-- /col-md-4-->
              <div class="col-md-4 col-sm-4 mb">
                <div class="darkblue-panel pn">
                  <div class="darkblue-header">
                    <h5>21년 1월 가입한 회원 수</h5>
                  </div>
                  <canvas id="serverstatus02" height="120" width="120"></canvas>
                  <script>
                  var countTotalClient = ${countTotalClient};
                    var doughnutData = [{
                        value: countTotalClient,
                        color: "#FFA618"
                      },
                      {
                        value: 10-countTotalClient,
                        color: "#fdfdfd"
                      }
                    ];
                    var myDoughnut = new Chart(document.getElementById("serverstatus02").getContext("2d")).Doughnut(doughnutData);
                  </script>
               <c:set var="clientTotal" value="10"/>
               <c:set var="clientTotal" value="${countTotalClient/clientTotal}"/>
                  <p>January 18, 2021</p>
                  <footer>
                    <div class="pull-left">
                      <h5><i class="fa fa-user-circle-o"></i> 목표 : 10명</h5>
                    </div>
                    <div class="pull-right">
                      <h5>1월 가입 인원 : ${countTotalClient}명</h5>
                    </div>
                  </footer>
                </div>
                <!--  /darkblue panel -->
              </div>
              <!-- /col-md-4 -->
              <div class="col-md-4 col-sm-4 mb">
                <!-- REVENUE PANEL -->
                <div class="green-panel pn">
                  <div class="green-header">
                    <h5>JABA 매출액 추이</h5>
                  </div>
                  <div class="chart mt">
                    <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4"
                    data-data="[${bizSalesList[7].pay_total_price}, ${bizSalesList[6].pay_total_price}, ${bizSalesList[5].pay_total_price}, ${bizSalesList[4].pay_total_price}, ${bizSalesList[3].pay_total_price}, ${bizSalesList[2].pay_total_price}, ${bizSalesList[1].pay_total_price}, ${bizSalesList[0].pay_total_price}]"></div>
                  </div>
                    <c:set var="total" value="0"/>
                  <c:forEach items="${bizSalesList}" var="bizSalesList" varStatus="s">
               <c:set var="total" value="${total + bizSalesList.pay_total_price}"/>
            </c:forEach>
                  <p class="mt"><b> <fmt:formatNumber value="${total}" pattern="#,###" />원</b><br/>Month Income</p>
                </div>
              </div>
              <!-- /col-md-4 -->
            </div>
          
              <!-- /col-md-4 -->
            </div>
            <!-- /row -->
          </div>
          <!-- /col-lg-9 END SECTION MIDDLE -->
          <!-- **********************************************************************************************************************************************************
              RIGHT SIDEBAR CONTENT
              *********************************************************************************************************************************************************** -->
          <div class="col-lg-3 ds">
            <!--COMPLETED ACTIONS DONUTS CHART-->
<!--             <div class="donut-main">
              <h4>COMPLETED ACTIONS & PROGRESS</h4>
              <canvas id="newchart" height="130" width="130"></canvas>
              <script>
                var doughnutData = [{
                    value: 70,
                    color: "#4ECDC4"
                  },
                  {
                    value: 30,
                    color: "#fdfdfd"
                  }
                ];
                var myDoughnut = new Chart(document.getElementById("newchart").getContext("2d")).Doughnut(doughnutData);
              </script>
            </div>
            NEW EARNING STATS
            <div class="panel terques-chart">
              <div class="panel-body">
                <div class="chart">
                  <div class="centered">
                    <span>TODAY EARNINGS</span>
                    <strong>$ 890,00 | 15%</strong>
                  </div>
                  <br>
                  <div class="sparkline" data-type="line" data-resize="true" data-height="75" data-width="90%" data-line-width="1" data-line-color="#fff" data-spot-color="#fff" data-fill-color="" data-highlight-line-color="#fff" data-spot-radius="4" data-data="[200,135,667,333,526,996,564,123,890,564,455]"></div>
                </div>
              </div>
            </div> -->
            <!--new earning end-->
           <!-- CALENDAR-->
            <div id="calendar" class="mb">
              <div class="panel green-panel no-margin">
                <div class="panel-body">
                  <div id="date-popover" class="popover top" style="cursor: pointer; disadding: block; margin-left: 33%; margin-top: -50px; width: 175px;">
                    <div class="arrow"></div>
                    <h3 class="popover-title" style="disadding: none;"></h3>
                    <div id="date-popover-content" class="popover-content"></div>
                  </div>
                  <div id="my-calendar"></div>
                </div>
              </div>
            </div>
            <!-- / calendar -->
<!-- USERS ONLINE SECTION -->
            <h4 class="centered mt">TEAM MEMBERS ONLINE</h4>
            <!-- First Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="<%=ctxPath%>/resources/images/admin/img/ys.png" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">SEUNGTAE YOU</a><br/>
                  <muted>github.com/yousth</muted>
                </p>
              </div>
            </div>
            <!-- Second Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="<%=ctxPath%>/resources/images/admin/img/yoon.png" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">YOONSUNG SEOL</a><br/>
                  <muted>github.com/nerdyxxn</muted>
                </p>
              </div>
            </div>
            <!-- Third Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="<%=ctxPath%>/resources/images/admin/img/min.png" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">MINSU KIM</a><br/>
                  <muted>github.com/kms160526</muted>
                </p>
              </div>
            </div>
            <!-- Fourth Member -->
            <div class="desc">
              <div class="thumb">
                <img class="img-circle" src="<%=ctxPath%>/resources/images/admin/img/hj.png" width="35px" height="35px" align="">
              </div>
              <div class="details">
                <p>
                  <a href="#">HYUNJU KIM</a><br/>
                  <muted>github.com/zoey-pepper</muted>
                </p>
              </div>
            </div>
          </div>
          <!-- /col-lg-3 -->
        <!-- /row -->
      </section>
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
  </section>
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

      $("#my-calendar").zabuto_calendar({
        action: function() {
          return myDateFunction(this.id, false);
        },
        action_nav: function() {
          return myNavFunction(this.id);
        }
      });
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
</body>

</html>