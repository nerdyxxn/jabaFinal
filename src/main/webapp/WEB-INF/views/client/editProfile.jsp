<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core"%>
<%
	String ctxPath = request.getContextPath();

%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>JABA</title>
<meta name="viewport"
	content="width=device-width,initial-scale=1,maximum-scale=1,minimal-ui" />
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
<!-- editProfile CSS -->
<link href="<%=ctxPath%>/resources/css/editProfile.css" rel="stylesheet">

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
</script>

</head>
<body>
	<!-- HEADER -->
	<header>
		<div class="header_container">
			<div class="logo">
				<a href="<%=ctxPath%>/index.jsp"><img src="<%=ctxPath%>/resources/images/clogo1.png" style="width:53px; height:41px;"></a>
			</div>
			<div class="menu">
			</div>
		</div>

	</header>
	<!-- NAVIGATOR -->
	<nav></nav>
	<!-- SECTION -->
	<section id="home">
		<div class="container" style="text-align: left; padding: 0px 20px;">
			<p style="font-size: 35px; color: white; margin-top: 30px;">
				My account
				</p>
		</div>
	</section>


	<!-- SECTION -->
	<section id="info">
		<div class="container">
			<div class="category">
				<p><a href="./My_account_profile.jsp" class="profile" style="text-decoration: none; color: grey;">Profile</a></p>
				<br>
				<p><a href="./My_account_password.jsp" class="password" style="text-decoration: none; color: grey;">Password</a>
				</p>
			</div>
			<div class="list" style="width: 500px;">
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Name</p>
					<input type="text" class="signin-input" id="name_profile" name="name_profile" style="height: 38px; padding: 15px 18px;" value="${client.client_name }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Email Address</p>
					<input type="text" class="signin-input" id="email_profile" name="email_profile" style="height: 38px; padding: 15px 18px;" readonly="readonly" value="${client.client_id }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Mobile number</p>
					<input type="text" class="signin-input" id="mobile_profile" name="mobile_profile" style="height: 38px;  padding: 15px 18px; " value="${client.client_phone }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Date of Birth</p>
					<input type="text" class="signin-input" id="birthday_profile"
						name="birthday_profile" style="height: 38px; padding: 15px 18px;" value="${client.client_birth }">
				</div>

				<br>
				<div class="text-box">
					<p style="font-weight: bold; margin: 0 0 8px;">Gender</p>
					<select name="gender" class="signin-input" id="gender_profile" name="gender_profile" style="height: 38px; padding: 9px;">
					<option value=""></option> 
					<option value="1" <c:if test="${client.client_gender eq 1}">selected</c:if>>남</option>
					<option value="2" <c:if test="${client.client_gender eq 2}">selected</c:if>>여</option>
					<option value="3">선택 안함</option>
					</select>
										
				</div>
			<br>
			<button type="button" class="btnChk" id="btn_save" name="btn_save"
				style="font-weight: normal;">SAVE</button>
			</div>
		</div>
	</section>


	<!-- ASIDE -->
	<aside></aside>

	<!-- FOOTER -->
	<footer>
		<div class="container">
			<div class="row">
				<div class="footer_logo">
					<img src="<%=ctxPath%>/resources/images/clogo1.png" style="width:53px; height:41px;">
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
	// birth 에 숫자만 들어가야함
		$("#btn_save").click(function(){
			// 숫자확인 정규표현식
			var regExp = /^[0-9]*$/
			var birth = $("#birthday_profile").val();
			if(!regExp.test(birth)){
				alert("Date of Birth는 숫자만입력하세요.");
			}else{
				$.ajax({
		            url:"member/myPageUpdate.do",
		            async:false,
		            data:{ 
		            	user_name: $("#name_profile").val(),
		            	user_phone: $("#mobile_profile").val(),
		            	user_birth: $("#birthday_profile").val(),
		            	user_gender: $("#gender_profile").val(),
		            },
		            success: function(res1){
		            	alert("프로필 정보가 수정되었습니다.");
		            }
				});
			}
		});
	
	
	</script>
</body>
</html>