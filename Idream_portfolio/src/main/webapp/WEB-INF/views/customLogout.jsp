<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se" %>
    
<!DOCTYPE html>
<html>
<head>
<title>customLogout jsp 소스 코딩</title>
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/footer.css">
<link rel="stylesheet" href="../resources/css/font.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<!-- Page737 아래 소스 코딩 시작 : 부트스트랩 테마의 로그인 페이지를 수정해서
                             customLogout 페이지를 제작합니다.-->
<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">

<!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
<!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
<!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->
<!-- Page737 아래 소스 코딩 끝 -->

</head>
<body>
<header>
      <div class="inner">
         <nav class="navbar">
            <a href="/index" class="logo"> <img src="../resources/img/logo.png"
               alt="I dream" />
            </a>
            <ul class="navbar__menu">
               <li><a href="/direction">찾아오시는 길</a></li>
               <li><a href="/questions">Q&A</a></li>
               <li><a href="/userlist/hu1">후원하기</a></li>
               <se:authorize access="isAnonymous()">
               <li><a href="/user/signup">회원가입</a></li>
               <li><a href="/customLogin">로그인</a></li>
               </se:authorize>
               <se:authorize access="isAuthenticated()">
               <li><a href="/customLogout">로그아웃</a>
               </se:authorize>
            </ul>

            <a href="#" class="navbar__toggleBtn"><i class="fas fa-bars"></i></a>
         </nav>
      </div>
      <!--BADGES-->
      <!-- End Channel Plugin -->
   </header>
   <div class="container">
		<div class="row">
			<div class="col-md-4 col-md-offset-4">
				<div class="login-panel panel panel-default">
					<div class="panel-heading">
						<h3 class="panel-title">Logout Page</h3>
					</div>
					<div class="panel-body">
						<form role="form" method='post' action="/logout.do">
							<fieldset>
								
								<!-- Change this to a button or input when using this as a form -->
								<a href="index.html" class="btn btn-lg btn-success btn-block">Logout</a>
							</fieldset>
							<input type="hidden" name="${_csrf.parameterName}"
								value="${_csrf.token}" />
						</form>
					</div>
				</div>
			</div>
		</div>
	</div>
<footer>
      <div class="inner">
         <div class="btn-group">
            <a href="/direction" class="btn btn--white">찾아오시는 길</a> <a
               href="/inquiry/list" class="btn btn--white">문의하기</a> <a
               href="/tip/list" class="btn btn--white">제보하기</a>
         </div>
         <div class="info">
            <span>사업자번호 123-45-678901</span> <span>(주)아이찾기 프로젝트</span> <span>TEL
               : 02) 1234-5678 / FAX : 02) 1234-5678</span> <span>사이트 관리자 : 김아무개</span>
         </div>
         <p class="copyright">
            &copy; <span class="this-year"></span> Find Child Company. All
            Rights Reserved.
         </p>
      </div>
   </footer>
	<!-- jQuery -->
	<script src="/resources/vendor/jquery/jquery.min.js"></script>

	<!-- Bootstrap Core JavaScript -->
	<script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

	<!-- Metis Menu Plugin JavaScript -->
	<script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

	<!-- Custom Theme JavaScript -->
	<script src="/resources/dist/js/sb-admin-2.js"></script>
	
	<script>
	
	$(".btn-success").on("click", function(e){
		
		e.preventDefault();
		$("form").submit();
		
	});
	
	<c:if test="${param.logout != null}">
    <script>
    $(document).ready(function(){
    	alert("로그아웃하였습니다.");
    });
    </script>
</c:if>  
	
	</script>     
    <!-- Page737 아래 소스 코딩 끝 -->
    
</body>
</html>
