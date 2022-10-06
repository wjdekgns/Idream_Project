<%@ page language="java" contentType="text/html; charset=UTF-8"
	pageEncoding="UTF-8"%>
<!-- Page671 JSP에서 로그인한 사용자 정보 보여주기  : 아래 2줄 tablib 구문 추가 -->
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="se"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<meta name="viewport" content="width=device-width, initial-scale=1">
<title>Insert title here</title>

<link rel="stylesheet" href="../resources/css/header.css">
<link rel="stylesheet" href="../resources/css/footer.css">
<link rel="stylesheet" href="../resources/css/font.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>

<!-- Bootstrap Core CSS -->
<link href="/resources/vendor/bootstrap/css/bootstrap.min.css"
	rel="stylesheet">

<!-- MetisMenu CSS -->
<link href="/resources/vendor/metisMenu/metisMenu.min.css"
	rel="stylesheet">

<!-- DataTables CSS -->
<link
	href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css"
	rel="stylesheet">

<!-- DataTables Responsive CSS -->
<link
	href="/resources/vendor/datatables-responsive/dataTables.responsive.css"
	rel="stylesheet">

<!-- Custom CSS -->
<link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

<!-- Custom Fonts -->
<link href="/resources/vendor/font-awesome/css/font-awesome.min.css"
	rel="stylesheet" type="text/css">
<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script type="text/javascript">
	$(document).ready(function() {

		var actionForm = $("#actionForm");

		$(".paginate_button a").on("click", function(e) {

			e.preventDefault();

			console.log('click');
			// }); Page 312 위에 자바스크립트 소스 코딩 끝

			// Page 312 아래 자바스크립트 소스 코딩 시작
			actionForm.find("input[name='pageNum']").val($(this).attr("href"));
			actionForm.submit(); // actionForm 자체를 submit() 처리 시켜줍니다.
		});
		// Page 312 아래 자바스크립트 소스 코딩 끝						

		// Page 342 자바스크립트 소스 코딩 시작
		var searchForm = $("#searchForm");

		$("#searchForm button").on("click", function(e) {
			if (!searchForm.find("option:selected").val()) {
				alert("검색 종류를 선택해 주시기 바랍니다!");
				return false;
			}

			if (!searchForm.find("input[name='keyword']").val()) {
				alert("키워드를 입력해 주시기 바랍니다!");
				return false;
			}

			// 여러 문제들 중에서 검색 버튼을 클릭하면 검색은
			// 1페이지를 하도록 수정 처리합니다.
			searchForm.find("input[name='pageNum']").val("1");
			// 브라우저에서 검색 버튼을 클릭하면 form 태그의
			// 전송은 막고, 페이지의 번호는 1이 되도록 처리합니다.
			// 화면에서 키워드가 없다면 검색을 하지 않도록 제어합니다.
			e.preventDefault();
			searchForm.submit();
		});
	});
	// Page 342 자바스크립트 소스 코딩 끝
</script>
<style>
	.row {
		width: 80%;
		margin: 0 auto;
	}
</style>
</head>
<body>

<header>
		<div class="inner">
			<nav class="navbar">
				<a href="/index" class="logo"> <img
					src="../resources/img/logo.png" alt="I dream" />
				</a>
				<ul class="navbar__menu">
				<se:authorize access="hasRole('ROLE_ADMIN')">
				<li><a href="/userlist/admin">회원정보</a></li>
				</se:authorize>
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
		<!-- End Channel Plugin -->
	</header>


	<div class="row">
		<div class="col-lg-12">
			<h1 class="page-header">회원정보</h1>
		</div>
		<!-- /.col-lg-12 -->
	</div>
	<!-- /.row -->

	<div class="row" style="width: 100%;">
		<div class="col-lg-12">
			<div class="panel panel-default">

				<!-- Page250 위에 jsp 소스 코딩 시작 -->
				<div class="panel-heading">
					회원정보 리스트
				</div>
				<!-- Page250 위에 jsp 소스 코딩 끝 -->
				<!-- 목록 페이지 상단에 게시판 등록 작업 버튼 생성해 줌 -->
				<!-- /.panel-heading -->
				<div class="panel-body">
					<!-- Page 237 소스 코딩 시작 -->
					<table class="table table-striped table-bordered table-hover">
						<thead>
							<tr>
								<th>아이디</th>
								<th>이름</th>
								<th>전화번호</th>
								<th>이메일</th>
								<th>등록일</th>
							</tr>
						</thead>
						<c:forEach items="${admin}" var="member">
							<tr>
								<td><c:out value="${member.userid}" /></td>
								<td><c:out value="${member.userName}" /></td>
								<td><c:out value="${member.phone_num}" /></td>
								<td><c:out value="${member.email}" /></td>

								<td><fmt:formatDate pattern="yyyy-MM-dd"
										value="${member.regDate}" /></td>
							</tr>
						</c:forEach>
					</table>
					<!-- Page 237 소스 코딩 끝 -->

					<!-- Page 340 jsp 소스 코딩 시작, Page 343 jsp 소스 코딩 수정 시작 -->
					<!-- 화면에서 검색 기능 구현할 때 다음의 사항들을 주의해서 개발해 주시기 바랍니다.
				첫번째로 페이지 번호가 파라미터로 유지되었던 것처럼 검색 조건과 키워드 역시 항상 화면 이동 시 같이 전송되어야 합니다.
				두번째로 화면에서 검색 버튼을 클릭하면 새로 검색을 한다는 의미이므로
				1페이지로 이동합니다.
				세번째로 한글의 경우 GET방식으로 이동하는 경우 문제가 생길 수 있으므로
				주의해야 합니다. -->
					<div class="row">
						<div class="col-lg-12">
							<form id="searchForm" action="/userlist/admin" method="get">
								<select name="type">
									<option value=""
										<c:out value="${pageMaker.cri.type == null ? 'selected' : '' }"/>>--</option>
									<option value="UNPE"
										<c:out value="${pageMaker.cri.type eq 'UNPE' ? 'selected' : '' }"/>>전체</option>
									<option value="U"
										<c:out value="${pageMaker.cri.type eq 'U' ? 'selected' : '' }"/>>아이디</option>
									<option value="N"
										<c:out value="${pageMaker.cri.type eq 'N' ? 'selected' : '' }"/>>이름</option>
									<option value="P"
										<c:out value="${pageMaker.cri.type eq 'P' ? 'selected' : '' }"/>>전화번호</option>
									<option value="E"
										<c:out value="${pageMaker.cri.type eq 'E' ? 'selected' : '' }"/>>이메일</option>
									<option value="UN"
										<c:out value="${pageMaker.cri.type eq 'UN' ? 'selected' : '' }"/>>아이디
										or 이름</option>
									<option value="UP"
										<c:out value="${pageMaker.cri.type eq 'UE' ? 'selected' : '' }"/>>아이디
										or 이메일</option>
									<option value="UNE"
										<c:out value="${pageMaker.cri.type eq 'UNE' ? 'selected' : '' }"/>>아이디
										or 이름 or 이메일</option>
								</select> <input type="text" name="keyword"
									value="<c:out value = "${pageMaker.cri.keyword}"/>" /> <input
									type="hidden" name="pageNum"
									value="<c:out value = "${pageMaker.cri.pageNum}"/>" /> <input
									type="hidden" name="amount"
									value="<c:out value = "${pageMaker.cri.amount}"/>" />
								<button class="btn btn-default">Search Now!</button>
							</form>
						</div>
					</div>
					<!-- Page 340 jsp 소스 코딩 끝, Page 343 jsp 소스 코딩 수정 끝 -->

					<!-- Page308 소스 코딩 시작 : Page310 진행할 때 주석 처리함 -->
					<!-- http://localhost:port번호/notice/list?pageNum=5 : 하단 Next 버튼 확인 -->
					<!-- http://localhost:port번호/notice/list?pageNum=5&amount=20 : 하단 페이지 전체 확인 -->
					<%-- 
				<div class='pull-right'>
					<ul class="pagination">
						            <c:if test="${pageMaker.prev}">
              <li class="paginate_button previous"><a href="#">Previous</a>
              </li>
            </c:if>

            <c:forEach var="num" begin="${pageMaker.startPage}"
              end="${pageMaker.endPage}">
              <li class="paginate_button"><a href="#">${num}</a></li>
            </c:forEach>

            <c:if test="${pageMaker.next}">
              <li class="paginate_button next"><a href="#">Next</a></li>
            </c:if>
            --%>
					<!-- Page308 소스 코딩 끝 : Page310 진행할 때 주석 처리함 -->

					<!-- Page310 위에 소스 코딩 시작 -->
					<div class='pull-right'>
						<ul class="pagination">

							<c:if test="${pageMaker.prev}">
								<li class="paginate_button previous"><a
									href="${pageMaker.startPage -1}">Previous</a></li>
							</c:if>

							<c:forEach var="num" begin="${pageMaker.startPage}"
								end="${pageMaker.endPage}">
								<li class="paginate_button  ${pageMaker.cri.pageNum == num ? "active" : ""} ">
									<a href="${num}">${num}</a>
								</li>
							</c:forEach>

							<c:if test="${pageMaker.next}">
								<li class="paginate_button next"><a
									href="${pageMaker.endPage +1 }">Next</a></li>
							</c:if>
							<!-- Page310 위에 소스 코딩 끝 -->

						</ul>
					</div>
					<!--  end Pagination -->
				</div>

				<!-- Page 311 위에 소스 코딩 시작 -->
				<form id='actionForm' action="/userlist/admin" method='get'>
					<input type='hidden' name='pageNum'
						value='${pageMaker.cri.pageNum}'> <input type='hidden'
						name='amount' value='${pageMaker.cri.amount}'>
					<!-- form 종료 태그 : Page 311 위에 소스 코딩 끝 -->

					<!-- Page 344 중간 jsp 소스 코딩 추가 시작 : 소스 문제 없는데 붉은색 표시나면 구문 잘라내기 후에 다시 붙여넣기 저장해 보시기 바랍니다. -->
					<!-- 다음의 구문 코딩 후에 웹브라우저 실행해서, 검색 이후에 페이지를 이동해서 동일한
			     검색 조건과 키워드가 유지되는지 확인 바랍니다. -->
					<input type='hidden' name='type'
						value='<c:out value="${pageMaker.cri.type}"/>'> <input
						type='hidden' name='keyword'
						value='<c:out value="${pageMaker.cri.keyword}"/>'>
					<!-- Page 344 중간 jsp 소스 코딩 추가 끝 -->

				</form>

				<!-- Page 248 소스 코딩 시작 -->
				<!-- Modal  추가 -->
				<div class="modal fade" id="myModal" tabindex="-1" role="dialog"
					aria-labelledby="myModalLabel" aria-hidden="true">
					<div class="modal-dialog">
						<div class="modal-content">
							<div class="modal-header">
								<button type="button" class="close" data-dismiss="modal"
									aria-hidden="true">&times;</button>
								<h4 class="modal-title" id="myModalLabel">Modal title</h4>
							</div>
							<div class="modal-body">처리가 완료되었습니다.</div>
							<div class="modal-footer">
								<button type="button" class="btn btn-default"
									data-dismiss="modal">Close</button>
								<button type="button" class="btn btn-primary"
									data-dismiss="modal">Save changes</button>
							</div>
						</div>
						<!-- /.modal-content -->
					</div>
					<!-- /.modal-dialog -->
				</div>
				<!-- /.modal -->
				<!-- Page 248 소스 코딩 끝 -->

			</div>
			<!--  end panel-body -->
		</div>
		<!-- end panel -->
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
<script src="../resources/js/header.js"></script>
</body>

</html>