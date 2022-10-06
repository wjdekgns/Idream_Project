<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- Page716 아래 1줄 소스 코딩 추가 -->
<!-- register jsp 와 같이 스프링 시큐리티의 영향을 받는 JSP 파일에는 반드시
         시큐리티 관련 태그 라이브러리를 설정하도록 주의합니다. -->
<!DOCTYPE html>
<html lang="ko">
<head>
    <meta charset="utf-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1">
    <meta name="description" content="">
    <meta name="author" content="">

    <title>SB Admin 2 - Bootstrap Admin Theme</title>
    <link rel="stylesheet" href="../resources/css/footer.css">
    <link rel="stylesheet" href="../resources/css/header.css">
   <link rel="stylesheet" href="../resources/css/font.css">
   <link rel="preconnect" href="https://fonts.googleapis.com">
   <link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
   <link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
   <script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
   
 	<!-- Button CSS -->
   <link href="/resources/boardcss/button.css" rel="stylesheet">
   
   <!-- missing 공지사항 CSS -->
   <link href="../resources/boardcss/missing.css" rel="stylesheet">

    <!-- Bootstrap Core CSS -->
    <link href="/resources/vendor/bootstrap/css/bootstrap.min.css" rel="stylesheet">

    <!-- MetisMenu CSS -->
    <link href="/resources/vendor/metisMenu/metisMenu.min.css" rel="stylesheet">

    <!-- DataTables CSS -->
    <link href="/resources/vendor/datatables-plugins/dataTables.bootstrap.css" rel="stylesheet">

    <!-- DataTables Responsive CSS -->
    <link href="/resources/vendor/datatables-responsive/dataTables.responsive.css" rel="stylesheet">

    <!-- Custom CSS -->
    <link href="/resources/dist/css/sb-admin-2.css" rel="stylesheet">

    <!-- Custom Fonts -->
    <link href="/resources/vendor/font-awesome/css/font-awesome.min.css" rel="stylesheet" type="text/css">

    <!-- HTML5 Shim and Respond.js IE8 support of HTML5 elements and media queries -->
    <!-- WARNING: Respond.js doesn't work if you view the page via file:// -->
    <!--[if lt IE 9]>
        <script src="https://oss.maxcdn.com/libs/html5shiv/3.7.0/html5shiv.js"></script>
        <script src="https://oss.maxcdn.com/libs/respond.js/1.4.2/respond.min.js"></script>
    <![endif]-->

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
    <div id="wrapper" class="missing_wrapper">

        <!-- Navigation -->
        

        <div id="page-wrapper" class="missing_page">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>

<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header">실종 아동 등록</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">실종 아동 등록 게시물</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
      
        <div class="form-group">
          <label>번호</label> <input class="form-control" name='bno'
             value='<c:out value="${board.bno}" />' readonly="readonly">
          <label>제목</label> <input class="form-control" name='title'
             value='<c:out value="${board.title}" />' readonly="readonly">
        <table id="miss_table">
        <tr>
           <td><label>이름</label> <input class="form-control" name='htype' value='<c:out value="${board.htype}" />'
             readonly="readonly"></td>
        
          <td><label>나이</label> <input class="form-control" name='age' value='<c:out value="${board.age}" />'
             readonly="readonly"></td>
        
         <td> <label>국적</label> <input class="form-control" name='country' value='<c:out value="${board.country}" />'
             readonly="readonly"></td>
        </tr>
        <tr>
          <td><label>키</label> <input class="form-control" name='cm' value='<c:out value="${board.cm}" />'
             readonly="readonly"></td>
        
          <td><label>몸무게</label> <input class="form-control" name='kg' value='<c:out value="${board.kg}" />'
             readonly="readonly"></td>
        
          <td><label>체격</label> <input class="form-control" name='tong' value='<c:out value="${board.tong}" />'
             readonly="readonly"></td>
        </tr>
        <tr>
          <td><label>얼굴형</label> <input class="form-control" name='face' value='<c:out value="${board.face}" />'
             readonly="readonly"></td>
        
          <td colspan="2"><label>두발 색상 및 형태</label> <input class="form-control" name='hcolor' value='<c:out value="${board.hcolor}" />'
             readonly="readonly"></td>
        </tr>
        <tr>
          <td colspan="3"><label>착의 의상</label> <input class="form-control" name='outfit' value='<c:out value="${board.outfit}" />'
             readonly="readonly"></td>
        </tr>
        <tr>
          <td><label>발생 일시</label> <input class="form-control" name='aday' value='<c:out value="${board.aday}" />'
             readonly="readonly"></td>
        
          <td colspan="2"><label>발생 장소</label> <input class="form-control" name='aplace' value='<c:out value="${board.aplace}" />'
             readonly="readonly"></td>
        </tr>
          </table>
             
             <label>내용</label>
          <textarea class="form-control" rows="20" name='content'
            readonly="readonly"><c:out value="${board.content}" /></textarea>
            
            <label>작성자</label> <input class="form-control" name='writer' value='<c:out value="${board.writer}" />'
             readonly="readonly">
        </div>
     
        
        <!-- Page717 소스 코딩할 때 아래 1줄 소스는 주석 처리 해줌. -->
<!-- 
<button data-oper='modify' class="btn btn-default" onclick="location.href='/board/modify?bno=<c:out value="${board.bno}" /> '">Modify 수정!</button>
 -->        
        <!-- Page717 아래 6줄 소스 코딩 추가 : 게시물 조회와 로그인 처리 적용 -->
        <!-- sec authentication 태그를 매번 이용하는 것은 불편하기 때문에
        로그인과 관련된 정보인 principal은 JSP 내에서  pinfo 이름의 변수(var)로 사용하도록 합니다. sec authorize는 인증 받은 사용자만이 영향을 받기 위해서 지정하고, 내부에서는
        username과 게시물의 writer가 일치하는지를 확인해서 Modify 버튼을 추가합니다.
        실행 확인은 웹프로젝트 실행 후 게시물 작성 계정의 경우, 본인 게시물의 경우에는
        Modify 버튼과 List 버튼이 보이지만, 본인이 작성하지 않은 게시물의 경우에는
        List 버튼만 보이는 것을 확인해 봅니다.
        -->
        <sec:authentication property="principal" var="pinfo"/>
        <sec:authorize access="isAuthenticated()">
        <c:if test="${pinfo.username eq board.writer}">
        <button data-oper='modify' class="btn btn-default">수정</button>
        </c:if>
        </sec:authorize>




<button data-oper='list' class="btn btn-info" onclick="location.href='/missing/list'">목록</button>

<!-- page 317 jsp 소스 코딩 시작 : Page345 조회 페이지에서 검색 처리 jsp 소스 추가 코딩 시작 -->
<form id='operForm' action="/missing/modify" method="get">
   <input type='hidden' id='bno' name='bno' value='<c:out value="${board.bno}"/>'>
   <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
   <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>
   <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>
   <input type='hidden' name='type' value='<c:out value="${cri.type}"/>   '>
<!-- page 317 jsp 소스 코딩 끝 : Page345 조회 페이지에서 검색 처리 jsp 소스 추가 코딩 끝 -->

</form>
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->

<!-- Page414 댓글 목록 처리 get jsp 소스 코딩 시작  -->
<!-- 댓글 목록 처리 : 댓글의 목록 처리를 위해서는 별도의 div 태그를 생성해서 처리해야 합니다.
          게시글과 관련된 화면 아래쪽에 div 태그를 추가합니다. 추가하는 div태그에는 나중에 화면의
          모습을 파악할 수 있도록 간단한 텍스트 등을 구성해 봅니다. -->
<div class='row' style="margin-bottom: 20px;">
  <div class="col-lg-12">    
    <!-- /.panel -->
    <div class="panel panel-default">
    
       <!-- Page 419 코딩할 때 아래 .panel-heading 영역을 주석 처리해 줍니다. -->
       <!-- 
          <div class="panel-heading">
           <i class="fa fa-comments fa-fw"></i> Reply
         </div>
          -->

<!-- Page572 ~ 573까지 소스 코딩 시작 -->
<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult {
  width:100%;
  background-color: gray;
}
.uploadResult ul{
  display:flex;
  flex-flow: row;
  justify-content: center;
  align-items: center;
}
.uploadResult ul li {
  list-style: none;
  padding: 10px;
  align-content: center;
  text-align: center;
}
.uploadResult ul li img{
  width: 100px;
}
.uploadResult ul li span {
  color:white;
}
.bigPictureWrapper {
  position: absolute;
  display: none;
  justify-content: center;
  align-items: center;
  top:0%;
  width:100%;
  height:100%;
  background-color: gray; 
  z-index: 100;
  background:rgba(255,255,255,0.5);
}
.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}

.bigPicture img {
  width:600px;
}

</style>



<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">Files</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        
        <div class='uploadResult'> 
          <ul>
          </ul>
        </div>
      </div>
      <!--  end panel-body -->
    </div>
    <!--  end panel-body -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- Page572 ~ 573까지 소스 코딩 끝 -->
          
          <!-- Page 419 댓글 목록 상단 오른쪽에 버튼을 하나 추가해서
                     사용자들이 새로운 댓글을 추가할 수 있도록 준비합니다. -->                     
               <div class="panel-heading">
               <!-- Page718 아래 1줄 소스 수정 코딩 sec authorize 적용해서
                    로그인한 사용자만이 조회 화면에서 댓글 추가 버튼을 볼 수 있도록 수정 코딩해 줍니다.
                    즉 로그인한 사용자는 댓글을 작성할 수 있는 New Reply 버튼이 보여지는데
                    로그인하지 않은 사용자는 New Reply 버튼이 보이지 않게 됩니다  -->
                  <i class="fa fa-comments fa-fw"></i> 댓글 <sec:authorize access="isAuthenticated()">
                     <button id="addReplyBtn" class="btn btn-primary btn-xs pull-right">댓글 쓰기</button></sec:authorize>
               </div>
                         
      
         <!-- /.panel-heading -->
         <div class="panel-body">  
             <!-- 댓글의 목록은 ul 태그 내에 li 태그를 이용해서 처리합니다.
                  각 li 태그는 하나의 댓글을 의미하므로 수정이나 삭제 시 이를 클릭하게 됩니다.
                  수정이나 삭제 시에는 반드시 댓글 번호(rno)가 필요하므로 'data-rno' 속성을
                  이용해서 이를 처리합니다. -->      
             <ul class="chat">
                <!-- start reply -->
                <!-- Page439 코딩할 때 아래 li 태그 주석 처리함 -->
                <!-- 
                <li class="left clearfix" data-rno='12'>
                   <div>
                   <div class="header">
                      <strong class="primary-font">user00</strong>
                      <small class="pull-right text-muted">2022-07-31 13:20</small>
                   </div>
                   <p>Good job!</p>
                   </div>
                </li>
                 -->
            <!-- Page414 댓글 목록 처리 get jsp 소스 코딩 끝 -->
           </ul>
       </div>
       <!-- /.panel .chat-panel -->
                 <!-- Page439 get jsp 소스 추가 내용 -->
                 <div class="panel-footer"></div>
        </div>   
  </div>
  <!-- ./ end row -->
</div>

<!-- Page420~Page421 get jsp 내의 모달창 소스 코딩 시작 -->
<!-- 댓글의 추가는 모달창을 이용해서 진행합니다. -->
<!-- Modal -->
      <div class="modal fade" id="myModal" tabindex="-1" role="dialog"
        aria-labelledby="myModalLabel" aria-hidden="true">
        <div class="modal-dialog">
          <div class="modal-content">
            <div class="modal-header">
              <button type="button" class="close" data-dismiss="modal"
                aria-hidden="true">&times;</button>
              <h4 class="modal-title" id="myModalLabel">댓글 쓰기</h4>
            </div>
            <div class="modal-body">
              <div class="form-group">
                <label>내용</label> 
                <input class="form-control" name='reply' value='New Reply!!!!'>
              </div>      
              <div class="form-group">
                <label>작성자</label>
                <input class="form-control" name='replyer' value='replyer' readonly="readonly">
              </div>
              <div class="form-group">
                <label>Reply Date</label> 
                <input class="form-control" name='replyDate' value='2018-01-01 13:13'>
              </div>
      
            </div>
<div class="modal-footer">
        <button id='modalModBtn' type="button" class="btn btn-warning">수정</button>
        <button id='modalRemoveBtn' type="button" class="btn btn-danger">삭제</button>
        <button id='modalRegisterBtn' type="button" class="btn btn-primary">등록</button>
        <button id='modalCloseBtn' type="button" class="btn btn-default" data-dismiss="modal">닫기</button>
      </div>          </div>
          <!-- /.modal-content -->
        </div>
        <!-- /.modal-dialog -->
      </div>
      <!-- /.modal -->
<!-- Page420~Page421 get jsp 내의 모달창 소스 코딩 끝 -->


<script type="text/javascript" src="/resources/js/missingreply.js"></script>

<script>
// 특정 게시물의 댓글 관련 이벤트 처리 : 게시글의 조회 페이지가 열리면 자동으로 댓글 목록을 가져와서
// li 태그를 구성해야 합니다. 이에 대한 처리는 $(documnet).ready() 내에서 이루어지게 합니다.
// Page415 이벤트 처리를 위한 자바스크립트 소스 코딩 시작
$(document).ready(function() {
   var bnoValue = '<c:out value="${board.bno}"/>';
   var replyUL = $(".chat");
   
   // showList() 메서드는 페이지 번호를 파라미터로 받도록 하며,
   // 만일 파라미터가 없는 경우에는 자동으로 1페이지가 되도록 설정합니다.
   // 웹브라우저에서 DOM 처리가 끝나면 자동으로 showList() 메서드가 호출되면서
   // ul 태그 내에 내용으로 처리됩니다. 만약 1페이지가 아닌 경우라면
   // 기존 ul태그에 li태그들이 추가되는 형태입니다.
   showList(1);
   
   // Page438 : showList() 함수는 파라미터로 전달되는 page 변수를 이용해서
   //           원하는 댓글 페이지를 가져오게 됩니다.
   function showList(page) {
      
      // Page 438 아래 구문 1줄을 추가 코딩함
      console.log("show list " + page);
      
       /* Page 438 코딩할 때 아래 getList() 메서드는 주석 처리해 줍니다.
      replyService.getList({bno:bnoValue, page: page|| 1}, function(list) {
         var str = "";
         if(list == null || list.length == 0){
            replyUL.html("");
            return;
         }
         */
         // Page 438 getList() 메서드 소스 코딩
         replyService.getList({bno:bnoValue, page: page|| 1}, function(replyCnt, list) {
            console.log("replyCnt : " + replyCnt);
            console.log("list : " + list);
            console.log(list);
            
         // 위에서 showList() 함수가 파라미터로 전달되는 page 변수를
         // 이용해서 원하는 댓글 페이지를 가져오게 되면, 이때, 만약
         // page 번호가 '-1'로 전달되면 마지막 페이지를 찾아서 다시 호출하게 됩니다.         
            if(page == -1){
               pageNum = Math.ceil(replyCnt/10.0);
               showList(pageNum);
               return;
            }
            var str = "";
            
            if(list == null || list.length == 0){
               // Page 438 소스 코딩할 때 아래 1줄 구문은 주석 처리함
               // replyUL.html("");
               return;
            }
            
            
         for(var i = 0, len = list.length || 0; i < len; i++){
            str += "<li class='left clearfix' data-rno='" + list[i].rno + "'>";
            str +=" <div><div class='header'><strong class='primary-font'>"+ list[i].replyer+"</strong>";
            // Page418~Page419 소스 코딩할 때 아래 내용은 주석 처리해 줍니다.
            /*
            str +=" <small class='pull-right text-muted'>" + list[i].replyDate+"</small></div>";
            */
            
            // Page418~Page419 get.jsp 소스 코딩 수정 적용 시작            
            str +=" <small class='pull-right text-muted'>" + replyService.displayTime(list[i].replyDate) + "</small></div>";            
            // Page418~Page419 get.jsp 소스 코딩 수정 적용 끝
            
            str +=" <p>" + list[i].reply + "</p></div></li>";
         }
         replyUL.html(str);
         
         // Page441 아래 1줄 소스 추가함.
         showReplyPage(replyCnt);
         
      }); // end function
   } // end showList

   // Page440 get jsp 소스 코딩 : 앞서 div class='panel-footer'에 댓글
   // 페이지 번호를 출력하는 로직인 showReplyPage() 메서드를 정의해 줍니다.
   var pageNum = 1;
   var replyPageFooter = $(".panel-footer");
   
   function showReplyPage(replyCnt) {
      var endNum = Math.ceil(pageNum/10.0) * 10;
      var startNum = endNum - 9;      
      var prev = startNum != 1;
      var next = false;
      
      if(endNum * 10 >= replyCnt){
         endNum = Math.ceil(replyCnt/10.0);
      }
      
      if(endNum * 10 < replyCnt){
         next = true;
      }
      
      var str = "<ul class='pagination pull-right'>";
      
      if(prev){
         str += "<li class='page-item'><a class='page-link' href='"+(startNum -1)+"'>Previous</a></li>";
      }
      for(var i = startNum; i <= endNum; i++){
         var active = pageNum == i? "active" : "";
         str += "<li class='page-item " + active + " '><a class='page-link' href='" + i + "'>" + i +"</a></li>";
      }
      if(next){
         str += "<li class='page-item'><a class='page-link' href='" +(endNum + 1) + "'>Next</a></li>";
      }
      str += "</ul></div>";
      console.log(str);      
      replyPageFooter.html(str);
      }
   // Page 441 : 마지막 처리는 replyPageFooter를 활용해서 
   //            페이지의 번호를 클릭했을 때 새로운 댓글을 가져오도록 합니다.
   replyPageFooter.on("click", "li a", function(e) {
      // 댓글의 페이지 번호는 a 태그 내에 존재하므로 이벤트 처리에서는
      // a 태그의 기본 동작을 제한하고(preventDefault()) 댓글 페이지 번호를
      // 변경한 후에 해당 페이지의 댓글을 가져오도록 합니다.
      e.preventDefault();
      console.log("page click");
      var targetPageNum = $(this).attr("href");
      console.log("targetPageNum : " + targetPageNum);
      
      pageNum = targetPageNum;
      showList(pageNum);
   });
   
// Page415 이벤트 처리를 위한 자바스크립트 소스 코딩 끝
// Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 시작
// 새로운 댓글의 추가 시, 버튼 이벤트 처리 : 댓글 목록 상단의 'New Reply'를 클릭하면
// 화면에서는 모달창을 보여줘서 처리합니다. 모달과 관련된 객체들은 여러 함수에서 사용할 것이므로
// 바깥쪽으로 빼두어 매번 jQuery를 호출하지 않도록 합니다.
   var modal = $(".modal");
   var modalInputReply = modal.find("input[name='reply']");
   var modalInputReplyer = modal.find("input[name='replyer']");
   var modalInputReplyDate = modal.find("input[name='replyDate']");
   
   var modalModBtn = $('#modalModBtn');
   var modalRemoveBtn = $('#modalRemoveBtn');
   var modalRegisterBtn = $('#modalRegisterBtn');
   
   // 사용자가 'New Reply' 버튼을 클릭하면 입력에 필요없는 항목들은 안 보이게 처리하고,
   // 모달창을 보이게 합니다.
   $("#addReplyBtn").on("click", function(e) {
      modal.find("input").val("");
      // Page728 아래 1줄 소스 코딩 추가
      // 댓글을 보여주는 모달창에는 현재 로그인한 사용자의 이름으로  replyer 항목이
      // 고정되도록 수정합니다.
      modal.find("input[name='replyer']").val(replyer);
      
      // 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
      modalInputReplyDate.closest("div").hide();
      // 아래 hide() 메서드가 포함된 구문을 주석 처리 후 실행 확인해 보시기 바랍니다.
      modal.find("button[id != 'modalCloseBtn']").hide();
      
      modalRegisterBtn.show();
      $(".modal").modal("show");
   });
   // Page422 get jsp 자바스크립트 내에 댓글 추가 시작 시 버튼 이벤트 처리 소스 코딩 끝
   
   // Page728 아래 2줄 소스 코드 추가
   // 아래 ajaxSend() 메서드를 이용한 코드는 모든 Ajax 전송 시 CSRF 토큰을 같이
   // 전송하도록 세팅되기 때문에 매번 Ajax 사용시 beforeSend를 호출해야 하는
   // 번거로움을 줄일 수 있습니다.
    $(document).ajaxSend(function(e, xhr, options) { 
        xhr.setRequestHeader(csrfHeaderName, csrfTokenValue); 
      });    
   
   // Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 시작
   // 새로운 댓글의 추가는 필요한 댓글의 내용(Reply)과 댓글의 작성(Replyer) 항목만으로
   // 추가해서 모달창 아래쪽의 'Register' 버튼을 클릭해서 처리하게 합니다.
   modalRegisterBtn.on("click", function(e) {
      var reply = {
            reply : modalInputReply.val(),
            replyer : modalInputReplyer.val(),
            bno:bnoValue
      };
      // 댓글이 정상적으로 추가되면 경고창(alert)을 이용해서 성공했다는 사실을 알려주고,
      // 등록한 내용으로 다시 등록할 수 없도록 입력항목을 비우고 모달창을 닫아줍니다.
      replyService.add(reply, function(result) {
         alert(result);
         modal.find("input").val("");
         modal.modal("hide");
         // 댓글이 정상적으로 처리되었지만 목록 자체는 갱신된 적이 없으므로
         // 화면에서 새로 등록된 댓글이 보이지 않습니다. 이러한 문제 때문에
         // 댓글을 추가한 후에는 다시 댓글의 목록(showList(1)) 갱신 처리를 해줍니다.
         // 아래와 같이 showList(1)을 추가해 줘서 댓글이 추가된 후
         // 그 사이에 추가되었을지 모르는 새로운 댓글도 가져오도록 합니다.
         // 웹프로젝트 실행 후 New Reply!!! 버튼 클릭하고, 댓글 입력 후
         // 댓글 리스트 하단에 댓글 추가 내용과 우측 댓글 추가 시간을 확인하시기 바랍니다.
      // showList(1); // 옆에 showList(1)은 Page439 적용 시 주석 처리 합니다.
         showList(-1); // Page438, Page439 : 위에서 사용자가 새로운 댓글을
                       // 추가하면 showList(-1);을 호출하여 우선 전체 댓글의
                    // 숫자를 파악하게 합니다. 이후에 다시 마지막 페이지를 호출해서
                    // 이동시키는 방식으로 동작하게 됩니다. 이러한 방식은 여러 번
                    // 서버를 호출해야 하는 단점이 있기는 하지만, 댓글의 등록 행위가
                    // 댓글 조회나 페이징에 비해서 적기 때문에 심각한 문제는 아닙니다.
      });
   });
   // Page 423 : 댓글 등록 및 목록 갱신 소스 코딩 끝
   
   // Page 425 : 댓글 조회 클릭 이벤트 처리
   // 특정한 댓글 조회 클릭 이벤트 처리
   // Ajax로 댓글을 조회한 후 수정/삭제를 처리하게 합니다.
   // 댓글을 가져온 후에는 필요한 항목들을 채우고 수정과 삭제가 필요한 댓글 번호(rno)는
   // 'data-rno' 속성을 만들어서 추가해 둡니다.
   $(".chat").on("click", "li", function(e) {
      var rno = $(this).data("rno");
      replyService.get(rno, function(reply) {
         modalInputReply.val(reply.reply);
         modalInputReplyer.val(reply.replyer);
         modalInputReplyDate.val(replyService.displayTime(reply.replyDate)).attr("readonly", "readonly");
         modal.data("rno", reply.rno);
         modal.find("button[id != 'modalCloseBtn']").hide();
         modalModBtn.show();
         modalRemoveBtn.show();
         
         $(".modal").modal("show");
      });
   });
   
   // Page426~ Page427 댓글의 수정 이벤트 처리
   // 댓글의 수정 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
   // 댓글의 수정은 댓글(reply)만 수정이 가능합니다. 왜냐하면 ReplyMapper.xml에서
   // update 처리가 댓글(reply)만 수정 적용하게 되어 있기 때문입니다.
   modalModBtn.on("click", function(e) {
      
      // Page733 아래 1줄 소스 코딩 추가
      var originalReplyer = modalInputReplyer.val();
      
      // Page733 코딩할 때, 아래 1줄 소스 주석 처리
      // var reply = {rno:modal.data("rno"), reply: modalInputReply.val()};
      
      // Page733 코딩할 때, 아래 14줄 소스 코딩 추가
      var reply = {
         rno : modal.data("rno"),
         reply : modalInputReply.val(),
         replyer : originalReplyer};
      if(!replyer){
         alert("로그인 후 수정이 가능합니다!");
         modal.modal("hide");
         return;
      }
      console.log("Original Replyer : " + originalReplyer);
      if(replyer != originalReplyer){
         alert("자신이 작성한 댓글만 수정이 가능합니다!");
         modal.modal("hide");
         return;
      }
      
      replyService.update(reply, function(result) {
         alert(result);
         modal.modal("hide");         
         // Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
         // showList(1);
         showList(pageNum); // Page442 showList() 메서드를 호출할 때
      });                  // 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
   });
   // Page427 댓글의 삭제 이벤트 처리
   // 댓글의 삭제 시 작업이 모두 끝나면, 다시 댓글 목록을 갱신해 줘야 합니다.
   // 댓글 삭제 역시 모달창에 있는 'data-rno'값을 이용해서 처리합니다.
   modalRemoveBtn.on("click", function(e) {
      var rno = modal.data("rno");
      
      // Page730 아래 소스 코딩 시작 : 댓글의 삭제 시 기존에는 rno와 같이 댓글 번호만을
      // 전송했지만, 원래 댓글의 작성자를 같이 전송하도록 수정 코딩합니다.
      console.log("RNO: " + rno);
         console.log("REPLYER: " + replyer);
           // 만약에 replyer가 없다면
           if(!replyer){
              alert("로그인후 삭제가 가능합니다.");
              modal.modal("hide");
              return;
           }
           
           var originalReplyer = modalInputReplyer.val();
           
           // originalReplyer : 댓글의 원래 작성자
           console.log("Original Replyer: " + originalReplyer);
           
           // 만약에 originalReplyer(댓글의 원래 작성자)가 replyer와 다르다면 
           if(replyer != originalReplyer){
              alert("자신이 작성한 댓글만 삭제가 가능합니다.");
              modal.modal("hide");
              return;
           }
         // Page730 아래 소스 코딩 끝
      
       // Page730 소스 코딩할 때 아래 1줄 소스는 주석 처리함 
      // replyService.remove(rno, function(result) {      
      // Page730 소스 코딩할 때 아래 1줄 소스 추가 코딩
      replyService.remove(rno, originalReplyer, function(result) {
         alert(result);
         modal.modal("hide");
         // Page442 페이징이 적용된 댓글의 수정할 때 아래 1줄 코딩은 주석 처리해줌.
         // showList(1);
         showList(pageNum); // Page442 showList() 메서드를 호출할 때
                            // 현재 보고 있는 댓글 페이지의 번호를 호출합니다.
      });
   });
   
   var replyer = null;
    
   <sec:authorize access="isAuthenticated()">
    
    replyer = '<sec:authentication property="principal.username"/>';   
    
   </sec:authorize>
 
    var csrfHeaderName ="${_csrf.headerName}"; 
    var csrfTokenValue="${_csrf.token}";
   
   
});

</script>



<script type="text/javascript">
   //Page404 연습할때 아래 구문은 주석 처리합니다.
   // $(document).ready(function () {
      // console.log(replyService);
   // });
   
   console.log("====================");
   console.log("Javascript TEST");
   
   var bnoValue = '<c:out value = "${board.bno}" />';
   
   // Page 407 소스 코딩할 때 아래 내용은 주석 처리해 줍니다.   
   /*
   replyService.add(
      {reply: "Javascript TEST", replyer: "tester", bno: bnoValue}
      ,
      function(result) {
         alert("RESULT : " + result);
      }
   );
   */   
   
   // Page 407 getList() 메서드 자바스크립트 소스 코딩 시작
   // Page 409 댓글 삭제 확인할 때 아래 소스는 주석 처리 바랍니다.
   /*
   replyService.getList({bno:bnoValue, page:1}, function(list) {
            for(var i = 0, len = list.length || 0; i < len; i++){
               console.log(list[i]);
            }
         });
   */
   // Page 407 getList() 메서드 자바스크립트 소스 코딩 끝
   
   // Page 409 댓글 삭제 테스트 : sqldeveloper 이용해서
   // select * from tbl_reply; 검색해서 특정 번호를 확인해 봅니다.
   // 여기서는 RNO 칼럼 23번 댓글을 삭제해 봅니다.
   // Page 409 댓글 삭제 코딩할 때, getList() 메서드는 주석 처리 바랍니다.
   // Page 411 댓글 수정 코딩할 때, 아래 remove 메서드는 주석 처리 바랍니다.
   // Page 409 댓글 삭제 테스트 소스 코딩 시작   
   /*
   replyService.remove(23, function(count) {
      console.log(count);
      if(count === "success"){
         alert("REMOVED");
         }
      }, function(err) {
         alert('ERROR가 발생했습니다!');
      });   
   */
   // Page 409 댓글 삭제 테스트 소스 코딩 끝
   
   // Page410 : SQLDEVELOPER 데이터베이스에서 RNO 22번 댓글을 수정해 보겠습니다.
   // 웹프로젝트 구동 후 http://localhost:9005/board/list 웹 주소 입력 
   // 'board/list' 웹에서 임의의 특정글 제목 클릭하면 get 페이지 열리면서,
   // update alert "수정이 제대로 처리 되었습니다!" 메시지 나타나면 정상 동작입니다.
   // 그리고, SQLDEVELOPER 데이터베이스에서 RNO 22번 댓글이 제대로 수정되었는지
   // 확인해 보시기 바랍니다.   
   // Page 413 소스 코딩할 때 아래 update() 메서드 소스는 주석 처리를 해줍니다.
   /* 
   replyService.update({
      rno : 22,
      bno : bnoValue,
      reply : "＠-＠ 댓글 수정입니다!"      
      }, function(result) {
         alert("수정이 제대로 처리 되었습니다!");
      });   
   */
   
   // Page 413 소스 코딩 : 댓글 번호 22번(특정 댓글) 조회 확인을 합니다.
   // SQLDEVELOPER 데이터베이스에서 RNO 22번 댓글 내용을 확인해 봅니다.
   // 웹프로젝트 구동 후 http://localhost:9005/board/list 웹 주소 입력 
   // 'board/list' 웹에서 임의의 특정글 제목 클릭하면 get 페이지 열리는데,
   // 개발자도구(F12) - 콘솔(Console)탭에서 console log로 표현된
   // 22번 댓글 내용을 확인해 봅니다.
   // 아래 get() 메서드는 테스트용이었기 때문에, 실행 결과 확인 후 주석 처리 줍니다.
   /*
   replyService.get(22, function(data) {
      console.log(data);
   });
   */
   
</script>

<script type="text/javascript">

   $(document).ready(function() {
      var operForm = $("#operForm");
      
      // 사용자가 버튼을 클릭하면 operForm이라는 id를 가진 form 태그를 전송하게 합니다.
      $("button[data-oper='modify']").on("click", function(e) {
      
         // 사용자가 수정 버튼을 클릭하는 경우에는 bno 값을 같이 전달하고,
         // form 태그를 submit 처리 합니다.
         operForm.attr("action", "/missing/modify").submit();
      });
      // 만일 사용자가 list로 이동하는 경우에는 아직 아무런 데이터도 필요하지 않으므로
      // form 태그 내의 bno 태그를 지우고 submit을 통해서 리스트 페이지로 이동합니다.
      $("button[data-oper='list']").on("click", function(e) {
         operForm.find("#bno").remove();
         operForm.attr("action", "/missing/list")
         operForm.submit();
      });      
   });

</script>

<script>
// Page570~Page571 소스 코딩 시작
$(document).ready(function(){
     
     (function(){
     
       var bno = '<c:out value="${board.bno}"/>';
       
         $.getJSON("/missing/getAttachList", {bno: bno}, function(arr){
       
         console.log(arr);
         
         // Page574 소스 코딩 시작
         var str = "";
          
          $(arr).each(function(i, attach){
          
            //image type
            if(attach.fileType){
              var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
              
              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
              str += "<img src='/display?fileName="+fileCallPath+"'>";
              str += "</div>";
              str +"</li>";
            }else{
                
              str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
              str += "<span> "+ attach.fileName+"</span><br/>";
              str += "<img src='/resources/img/attach.png'></a>";
              str += "</div>";
              str +"</li>";
            }
          });
          
          $(".uploadResult ul").html(str);
        });//end getjson
        // Page574 소스 코딩 끝         

    })(); // end function
    // Page570~Page571 소스 코딩 끝.
   
     // Page575 첨부파일 클릭 시 이벤트 처리 소스 코딩 시작
     $(".uploadResult").on("click","li", function(e){
         
          console.log("view image");
          
          var liObj = $(this);
          
          var path = encodeURIComponent(liObj.data("path")+"/" + liObj.data("uuid")+"_" + liObj.data("filename"));
          
          if(liObj.data("type")){
            showImage(path.replace(new RegExp(/\\/g),"/"));
          }else {
            //download 
            self.location ="/download?fileName="+path
          }
          
          
        });
        
        function showImage(fileCallPath){
             
          alert(fileCallPath);
          
          // Page576 첨부파일 이미지를 클릭하면 화면에 이미지를 보여줍니다.
          $(".bigPictureWrapper").css("display","flex").show();
          
          $(".bigPicture")
          .html("<img src='/display?fileName="+fileCallPath+"' >")
          .animate({width:'100%', height: '100%'}, 1000);
           }
          // Page575 첨부파일 클릭 시 이벤트 처리 소스 코딩 끝

        // Page577 화면에 표시된 이미지를 클릭하면 화면 표시 이미지가 사라집니다.
        $(".bigPictureWrapper").on("click", function(e){
          $(".bigPicture").animate({width:'0%', height: '0%'}, 1000);
          setTimeout(function(){
            $('.bigPictureWrapper').hide();
          }, 1000);
        });
   
   });


</script>

<script src="../resources/js/header.js"></script>
<%@include file="../includes/footer.jsp"%>