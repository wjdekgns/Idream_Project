<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>

<!-- Page719 아래 1줄 소스 코딩 추가 -->
<!-- register jsp 와 같이 스프링 시큐리티의 영향을 받는 JSP 파일에는 반드시
         시큐리티 관련 태그 라이브러리를 설정하도록 주의합니다. -->
<%@ taglib uri="http://www.springframework.org/security/tags" prefix="sec" %>

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
   
    <!-- inquiry 실종 아동 제보 CSS -->
	<link href="../resources/boardcss/inquiry.css" rel="stylesheet">

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

    <div id="wrapper" class="inquiry_wrapper">

        <!-- Navigation -->
        

        <div id="page-wrapper" class="inquiry_page">
        
        <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<div class="row">
  <div class="col-lg-12">
    <h1 class="page-header" style="text-align: center;">글 수정하기</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">글 수정 페이지입니다.</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

      <form role="form" action="/inquiry/modify" method="post">
      
      <!-- Page719 아래 1줄 소스 코딩 추가 : 스프링 시큐리티를 사용할 때 post방식의
        전송은 반드시 CSRF 토큰을 사용하도록 추가해야만 합니다. form 태그 내에 CSRF 토큰의 값을
        input type hidden 형식으로 아래와 같이 추가해 줍니다.  -->
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
      
      <!-- Page 319 위에 modify jsp 소스 코딩 시작 : 앞서 get jsp 소스 재사용 -->      
      <input type='hidden' name='pageNum' value='<c:out value="${cri.pageNum}"/>'>
	  <input type='hidden' name='amount' value='<c:out value="${cri.amount}"/>'>      
      <!-- Page 319 위에 modify jsp 소스 코딩 끝 : 앞서 get jsp 소스 재사용 -->
      
      <!-- Page346 수정/삭제 페이지에서 검색 처리 소스 추가 코딩 시작 -->
      <input type='hidden' name='type' value='<c:out value="${cri.type}"/>'>
      <input type='hidden' name='keyword' value='<c:out value="${cri.keyword}"/>'>      
      <!-- Page346 수정/삭제 페이지에서 검색 처리 소스 추가 코딩 끝 -->
      
	<div class="form-group" style="display: none;">
		  <label>번호</label> 
		  <input class="form-control" name='qno' 
		  value='<c:out value="${board.qno}" />' readonly="readonly">
		</div> 

		<div class="form-group">
		  <label>제목</label> 
		  <input class="form-control" name='title'
		  value='<c:out value="${board.title}" />' >
		</div>

		<div class="form-group">
		  <label>내용</label>		  
		  <textarea class="form-control" rows="30" name='content' >
		  	<c:out value="${board.content}" />
		  </textarea>
		</div>

		<div class="form-group">
		  <label>작성자</label> 
		  <input class="form-control" name='writer'
	   value='<c:out value="${board.writer}" />'  readonly="readonly">            
		</div>

		<div class="form-group">
		
		  <label>등록일</label> 
		  <input class="form-control inquiryregDate" style="width: 31%; display: inline-block !important;" name='regDate'
		  value="<fmt:formatDate pattern="yyyy/MM/dd"  value="${board.regdate}" />"    readonly="readonly">            

		  <label>수정일</label> 
		  <input class="form-control inquiryupdateDate" style="width: 31%; display: inline-block !important;" name='updateDate'
		  value="<fmt:formatDate pattern="yyyy/MM/dd"  value="${board.updateDate}" />"      readonly="readonly">
		              
		</div>



</form>


      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->   
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->


<!-- Page584 화면에서 첨부파일 수정 프론트엔트 코딩 시작 -->
<div class='bigPictureWrapper'>
  <div class='bigPicture'>
  </div>
</div>

<style>
.uploadResult {
  width:100%;
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
  width: 100%;
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

      <div class="panel-heading">첨부파일</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' mulinquiryle="mulinquiryle">
        </div>
        
        <div class='uploadResult'> 
          <ul style="padding-left: 0">
          
          </ul>
        </div>
      </div>
      <!--  end panel-body -->  
    </div>   
    <!--  end panel-body -->
    
    <!-- Page719 아래 7줄 소스 코딩 추가 : 앞서 조회와 마찬가지로 현재 로그인한 사용자가
         게시물의 작성자인 경우에만 수정과 삭제가 가능하도록 제어합니다.  -->
<sec:authentication property="principal" var="pinfo"/>
<sec:authorize access="isAuthenticated()">
<button type="submit" data-oper='list' class="btn btn-info" style="float: right;">목록</button>
<c:if test="${pinfo.username eq board.writer}">
  <button type="submit" data-oper='modify' class="btn btn-default" style="float: right; margin: 0 5px;">글수정</button>
  <button type="submit" data-oper='remove' class="btn btn-danger" style="float: right; margin: margin: 0 0 0 5px;">글삭제</button>
</c:if>
</sec:authorize>
  
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- Page584 화면에서 첨부파일 수정 프론트엔트 코딩 끝 -->

<!-- Page590 소스 코딩할 때 아래 script 태그 소스는 주석 처리해 줍니다. (시작) -->
<script type="text/javascript">
$(document).ready(function() {
	var formObj = $("form");
	
	$('button').on("click", function(e) {
		// form 태그의 모든 버튼은 기본적으로 submit으로 처리하기 때문에
		// e.preventDefault()로 기본 동작을 막고 마지막에 직접 submit()을 수행합니다.
		e.preventDefault();
		// 자바스크립트에서는 button 태그의 'data-oper' 속성을 이용해서
		// 원하는 기능을 동작하도록 처리합니다.
		var operation = $(this).data("oper");
		
		console.log(operation);
		
		if(operation === 'remove'){
			formObj.attr("action", "/inquiry/remove");
		} else if(operation === 'list'){
			// move to list
			// 수정된 내용은 클릭한 버튼이 List인 경우 action 속성과 method 속성을
			// 변경합니다. '/notice/list'로의 이동은 아무런 파라미터가 없기 때문에
			// form 태그의 모든 내용은 삭제한 상태에서 submit()을 진행합니다.			
		   formObj.attr("action", "/inquiry/list").attr("method", "get");
		    
		// Page 321 수정/삭제 페이지에서 목록 페이지로 이동 처리
		// 페이지 이동의 마지막은 수정/삭제를 취소하고 다시 목록 페이지로 이동하는 것입니다.
		// 목록 페이지는 오직 pageNum과 amount만을 사용하므로 form 태그의
		// 다른 내용들은 삭제하고 필요한 내용만을 다시 추가하는 형태가 편리합니다.
		// 만일 사용자가 'List' 버튼을 클릭한다면 form 태그에서 필요한 부분만 잠시
		// 복사(clone)해서 보관해 두고, form 태그 내의 모든 내용은 지워버립니다(empty)
		// 이후에 다시 필요한 태그들만 추가해서 '/notice/list'를 호출하는 형태를 이용합니다.
			// Page 321 자바스크립트 소스 추가 시작
			var pageNumTag = $("input[name='pageNum']").clone();
			var amountTag = $("input[name='amount']").clone();			
		    // Page 321 자바스크립트 소스 추가 끝
		    
		    // Page 347 자바스크립트 소스 추가 시작
		    var keywordTag = $("input[name='keyword']").clone();
		    var typeTag = $("input[name='type']").clone();
		    // Page 347 자바스크립트 소스 추가 끝
		    
		    formObj.empty();	
		    
		    // Page 321 자바스크립트 소스 추가 시작
		    formObj.append(pageNumTag);
		    formObj.append(amountTag);
		    // Page 321 자바스크립트 소스 추가 끝
		    
		    // Page 347 자바스크립트 소스 추가 시작
		    formObj.append(keywordTag);
		    formObj.append(typeTag);
		    // Page 347 자바스크립트 소스 추가 끝
		    
		}
		formObj.submit();		
	});
});

</script>
<!-- Page590 소스 코딩할 때 아래 script 태그 소스는 주석 처리해 줍니다. (끝) -->

<!-- Page590 script 태그 소스 코딩 시작 -->
<script type="text/javascript">
$(document).ready(function() {


	  var formObj = $("form");

	  $('button').on("click", function(e){
	    
	    e.preventDefault(); 
	    
	    var operation = $(this).data("oper");
	    
	    console.log(operation);
	    
	    if(operation === 'remove'){
	      formObj.attr("action", "/inquiry/remove");
	      
	    }else if(operation === 'list'){
	      //move to list
	      formObj.attr("action", "/inquiry/list").attr("method","get");
	      
	      var pageNumTag = $("input[name='pageNum']").clone();
	      var amountTag = $("input[name='amount']").clone();
	      var keywordTag = $("input[name='keyword']").clone();
	      var typeTag = $("input[name='type']").clone();      
	      
	      formObj.empty();
	      
	      formObj.append(pageNumTag);
	      formObj.append(amountTag);
	      formObj.append(keywordTag);
	      formObj.append(typeTag);	  
	      
	    }else if(operation === 'modify'){
	        
	        console.log("submit clicked");
	        
	        var str = "";
	        
	        $(".uploadResult ul li").each(function(i, obj){
	          
	          var jobj = $(obj);
	          
	          console.dir(jobj);
	          
	          str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	          str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	          
	        });
	        formObj.append(str).submit();
        }
    
	    formObj.submit();
	  });

});
</script>
<!-- Page590 script 태그 소스 코딩 끝 -->


<!-- Page584 jQuery의 $(document).ready()를 이용해서 첨부파일을 보여주는 소스 코딩 시작 -->
<script>

$(document).ready(function() {
  (function(){
    
    var qno = '<c:out value="${board.qno}"/>';
    
    $.getJSON("/inquiry/getAttachList", {qno: qno}, function(arr){
    
      console.log(arr);
      
      var str = "";


      $(arr).each(function(i, attach){
          
          //image type
          if(attach.fileType){
            var fileCallPath =  encodeURIComponent( attach.uploadPath+ "/s_"+attach.uuid +"_"+attach.fileName);
            
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str +=" data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' "
            str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/display?fileName="+fileCallPath+"'>";
            str += "</div>";
            str +"</li>";
          }else{
              
            str += "<li data-path='"+attach.uploadPath+"' data-uuid='"+attach.uuid+"' "
            str += "data-filename='"+attach.fileName+"' data-type='"+attach.fileType+"' ><div>";
            str += "<span> "+ attach.fileName+"</span><br/>";
            str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' "
            str += " class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
            str += "<img src='/resources/img/attach.png'></a>";
            str += "</div>";
            str +"</li>";
          }
       });

      
      $(".uploadResult ul").html(str);
      
    });//end getjson
  })();//end function
  
  
  $(".uploadResult").on("click", "button", function(e){
	    
    console.log("delete file");
      
    if(confirm("Remove this file? ")){
    
      var targetLi = $(this).closest("li");
      targetLi.remove();

    }
  });  
  
  var regex = new RegExp("(.*?)\.(exe|sh|zip|alz)$");
  var maxSize = 5242880; //5MB
  
  function checkExtension(fileName, fileSize){
    
    if(fileSize >= maxSize){
      alert("파일 사이즈 초과");
      return false;
    }
    
    if(regex.test(fileName)){
      alert("해당 종류의 파일은 업로드할 수 없습니다.");
      return false;
    }
    return true;
  }
  
//725 아래 2줄 소스 코딩 추가
//form 태그를 이용하는 방식 이외에 많이 사용되는 Ajax를 이용하는 경우에는
//스프링 시큐리티가 적용되면 POST, PUT, PATCH, DELETE와 같은 방식으로
//데이터를 전송하는 경우에는 반드시 추가적으로 X-CSRF-TOKEN과 같은 헤더 정보를
//추가해서 CSRF 토큰값을 전달하도록 처리해 줘야만 합니다.
//Ajax는 Javascript를 이용하기 때문에 브라우저에서 CSRF 토큰과 관련된 값을
//아래와 같이 변수로 선언하고, 전송 시 포함시켜주는 방식으로 소스 코딩해 줍니다.
var csrfHeaderName ="${_csrf.headerName}"; 
var csrfTokenValue="${_csrf.token}";
  
  $("input[type='file']").change(function(e){

    var formData = new FormData();
    
    var inputFile = $("input[name='uploadFile']");
    
    var files = inputFile[0].files;
    
    for(var i = 0; i < files.length; i++){

      if(!checkExtension(files[i].name, files[i].size) ){
        return false;
      }
      formData.append("uploadFile", files[i]);
      
    }
    
    $.ajax({
      url: '/uploadAjaxAction',
      processData: false, 
      contentType: false,data: 
      formData,type: 'POST',
   	  // Page725 아래 2줄 소스 코딩 추가 : 기존 코드에 위에 2개 변수를 추가해 줍니다.
      // Ajax로 데이터를 전송할 때에는 beforeSend를 이용해서 추가적인 헤더를 지정해서
      // 전송 처리 합니다.
      beforeSend: function(xhr) {
  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	},
	    dataType:'json',
        success: function(result){
          console.log(result); 
		  showUploadResult(result); //업로드 결과 처리 함수 

      }
    }); //$.ajax
    
  });    

  function showUploadResult(uploadResultArr){
	    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
		
		if(obj.image){
			var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
			str += "<li data-path='"+obj.uploadPath+"'";
			str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
			str +" ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' "
			str += "data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/display?fileName="+fileCallPath+"'>";
			str += "</div>";
			str +"</li>";
		}else{
			var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);			      
		    var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
		      
			str += "<li "
			str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			str += "<span> "+ obj.fileName+"</span>";
			str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' " 
			str += "class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
			str += "<img src='/resources/img/attach.png'></a>";
			str += "</div>";
			str +"</li>";
		}

    });
    
    uploadUL.append(str);
  }
  
});

</script>
<!-- Page584 jQuery의 $(document).ready()를 이용해서 첨부파일을 보여주는 소스 코딩 끝 -->
  


<script src="../resources/js/header.js"></script>

<%@include file="../includes/footer.jsp"%>
