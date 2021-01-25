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
    <title>JABA-QNA</title>
    <!-- Favicons -->
    <link href="<%=ctxPath%>/resources/images/favi.jpg" rel="icon">
    <script src='https://code.jquery.com/jquery-3.4.0.js'></script>
    <!-- Bootstrap -->
    <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/css/bootstrap.min.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.5.1/jquery.min.js"></script>
    <script src="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.1/js/bootstrap.min.js"></script>
    <!-- datepicker -->
    <link rel="stylesheet" href="//code.jquery.com/ui/1.12.1/themes/base/jquery-ui.css">
    <script src="https://code.jquery.com/jquery-1.12.4.js"></script>
    <script src="https://code.jquery.com/ui/1.12.1/jquery-ui.js"></script>
    <script src="./jquery-ui-1.12.1/datepicker-ko.js"></script>
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
    <!-- QNA CSS -->
    <link href="<%=ctxPath%>/resources/css/qna.css" rel="stylesheet">

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
            })
        });
        
        // 페이지 로딩되었을때 로그인이 되어있는지 확인
        $(document).ready(function() {
            $.ajax({
                url: "<%=ctxPath%>/client/loginCheck.do",
                data: {},
                success: function(res1) {
                    if (res1 == 'KeepLogin') {
                        $("#logoutBtn").show();
                    }
                }
            });
        });
    </script>

    <!-- Q&A JS -->
    <script>
        // html dom 이 다 로딩된 후 실행된다.
        $(document).ready(function() {
            // faq-item class를 클릭했을때
            $(".faq-item").click(function() {
                var a = $(this).find("div.answer");

                // answer 가 화면상에 보일때는 위로 보드랍게 접고 아니면 아래로 보드랍게 펼치기
                if (a.is(":visible")) {
                    a.slideUp();
                } else {
                    a.slideDown();
                }
            });
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
            <div class="menu">
                <button id="logoutBtn">LOGOUT</button>
            </div>
        </div>
    </header>

    <!-- SECTION -->
    <section id="home">
    </section>

    <!-- TITLE-SECTION -->
    <div>
        <div id="titleInfo">
            <div class="container" id="container_titleInfo">
                <h1>QNA</h1>
            </div>
        </div>
    </div>

    <!-- SECTION -->
    <section id="faq">
        <div class="container">
            <c:if test="${not empty qnaList}">
                <c:forEach items="${qnaList}" var="qnaList" varStatus="s">
                    <div class="faq-item">
                        <div class="question">
                            <div class="desc">
                                <div class="q"></div>
                                <div class="name">${qnaList.qna_title }</div>
                            </div>
                            <div class="control"></div>
                        </div>
                        <div class="answer">
                            <div class="a"></div>
                            <p>${qnaList.qna_content }</p>
                        </div>
                    </div>
                </c:forEach>
            </c:if>
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
                                <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="/legal/privacy-policy">Privacy Policy</a></li>
                                <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="/legal/terms-and-conditions">Terms of Use</a></li>
                                <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="https://help.bopple.com/" target="_blank" rel="noopener noreferrer">Help Centre</a></li>
                                <li><a class="MuiTypography-root MuiLink-root MuiLink-underlineNone MuiTypography-colorPrimary" href="https://customer-contact-help.bopple.com" target="_blank" rel="noopener noreferrer">Leave Feedback</a></li>
                            </ul>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </footer>
    <script>
        // 로그아웃 버튼 눌렀을때 버튼 hide 와 로그아웃 동작
        $("#logoutBtn").on("click", function() {
            $.ajax({
                url: "<%=ctxPath%>/client/clientLogout.do",
                data: {},
                success: function() {
                    $("#logoutBtn").hide();
                    location.href = "<%=ctxPath%>/";
                }
            });
        });
    </script>
</body>

</html>