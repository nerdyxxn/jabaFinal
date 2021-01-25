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
    <title>Admin Menu page</title>
    <!-- Favicons -->
    <link href="<%=ctxPath%>/resources/images/favi.jpg" rel="icon">
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
    <link rel="stylesheet" type="text/css" href="<%=ctxPath%>/resources/css/adminMenuDetail.css">
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
                        <h3>MENU 상세 페이지</h3>
                    </div>
                    <div class="qna-custom-bar-chart">
                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table">
                                        <div class="trow theader" id="theader">
                                            <div class="cell">ID</div>
                                            <div class="cell">CATEGORY</div>
                                            <div class="cell">NAME</div>
                                            <div class="cell">PRICE</div>
                                            <div class="cell">DESCRIPTION</div>
                                        </div>
                                        <div class="trow">
                                            <div class="cell" data-title="ID">${menuDetail.menu_id }</div>
                                            <div class="cell" data-title="CATEGORY">
                                                ${menuDetail.menu_category}</div>
                                            <div class="cell" data-title="NAME">
                                                ${menuDetail.menu_name }</div>
                                            <div class="cell" data-title="PRICE">
                                                <fmt:formatNumber value="${menuDetail.menu_price }" pattern="#,###" />
                                            </div>
                                            <div class="cell" data-title="DESCRIPTION">
                                                ${menuDetail.menu_description }</div>
                                        </div>
                                    </div>
                                </div>
                                <div class="btnContainer" style="padding: 10px;">
                                    <input type="button" value="메뉴 정보 변경" onclick="javascript:location.href='<%=ctxPath%>/admin/store/menuUpdateDetail.do'" />
                                    <input type="button" value="커스텀 메뉴 추가" onclick="javascript:location.href='<%=ctxPath%>/admin/store/customWrite.do'" />
                                    <input type="button" value="돌아가기" onclick="javascript:location.href='<%=ctxPath%>/admin/store/adminStoreDetail.do?store_name=${storeDetail.store_name }'" />
                                </div>
                            </div>
                        </div>

                        <div class="limiter">
                            <div class="container-table100">
                                <div class="wrap-table100">
                                    <div class="table">
                                        <div class="trow theader" id="theader">
                                            <div class="cell">ID</div>
                                            <div class="cell">CATEGORY</div>
                                            <div class="cell">NAME</div>
                                            <div class="cell">PRICE</div>
                                        </div>
                                        <c:if test="${ not empty customList}">
                                            <c:forEach items="${customList}" var="customList">
                                                <div class="trow">
                                                    <div class="cell" data-title="ID">
                                                        ${customList.custom_id }</div>
                                                    <div class="cell" data-title="CATEGORY">
                                                        ${customList.custom_category}</div>
                                                    <a href="<%=ctxPath%>/admin/store/customDetail.do?custom_id=${customList.custom_id}">
                                                        <div class="cell" data-title="NAME">
                                                            ${customList.custom_name }</div>
                                                    </a>
                                                    <div class="cell" data-title="PRICE">
                                                        <fmt:formatNumber value="${customList.custom_price }" pattern="#,###" />
                                                    </div>
                                                </div>
                                            </c:forEach>
                                        </c:if>
                                    </div>
                                </div>
                            </div>
                        </div>
                    </div>
                </div>
            </section>
        </section>
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
    <script type="text/javascript" id="rendered-js">
        // 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
        $("#logoutBtn").on("click", function() {
            $.ajax({
                url: "<%=ctxPath%>/client/clientLogout.do",
                data: {},
                success: function() {
                    $("#logoutBtn").hide();
                    location.href = "../../";
                }
            });
        });
    </script>
    <script type="text/javascript">
        //상태 변경시 ajax
        $("#statusChangeBtn")
            .on(
                "click",
                function() {
                    var client_id = "${clientDetail.client_id}";
                    var client_status = "${clientDetail.client_status}";
                    console.log(client_status);
                    $.ajax({
                            url: "<%=ctxPath%>/admin/updateClientStatus.do",
                            method: "POST",
                            data: {
                                client_id: client_id,
                                client_status: client_status
                            },
                            success: function() {
                                if (confirm("현재 회원의 상태를 변경하시겠습니까?")) {
                                    location.href = "<%=ctxPath%>/admin/adminClientDetail.do?client_id=" + client_id;
                                }
                            }
                        });
                });
    </script>
</body>

</html>