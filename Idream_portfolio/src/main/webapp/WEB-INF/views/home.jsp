<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page session="false" %>
<html>
<head>
	<title>Home</title>
</head>
<body>
<h1>
	Hello world!  
</h1>

<P>  The time on the server is ${serverTime}. </P>

<!-- Page738 로그인 후 board list 웹페이지로 이동하기 적용 소스 코딩 -->
<!-- 로그인 후에 기본적으로 / 경로로 이동하기 때문에 HomeController에서 지정된
     home jsp 파일로 이동하게 됩니다. 만일 로그인 후 board list 웹페이지로
         이동하고자 한다면 아래와 같이 script 소스 코드를 추가해 줍니다. -->
<script type="text/javascript">
	self.location="/board/list";
</script>

</body>
</html>
