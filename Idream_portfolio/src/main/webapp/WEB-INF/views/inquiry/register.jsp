<%@ page language="java" contentType="text/html; charset=UTF-8"
  pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt"%>
<%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>


<!-- Page713 아래 1줄 소스 코딩 추가 -->
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
<style>
.uploadResult {
	width: 100%;
}

.uploadResult ul {
	display: flex;
	flex-flow: row;
	justify-content: center;
	align-items: center;
}

.uploadResult ul li {
	list-style: none;
	padding: 10px;
}

.uploadResult ul li img {
	width: 100%;
}
</style>

<style>

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
}

.bigPicture {
  position: relative;
  display:flex;
  justify-content: center;
  align-items: center;
}
</style>

<!-- Page555 style 태그 끝 -->
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
    <h1 class="page-header">문의하기 등록</h1>
  </div>
  <!-- /.col-lg-12 -->
</div>
<!-- /.row -->

<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">실종아동찾기센터의 새로운 소식과 정보 등을 안내해드립니다.</div>
      <!-- /.panel-heading -->
      <div class="panel-body">

        <form role="form" action="/inquiry/register" method="post">
        
        <!-- Page714 아래 1줄 소스 코딩 추가 : 스프링 시큐리티를 사용할 때 post방식의
        전송은 반드시 CSRF 토큰을 사용하도록 추가해야만 합니다. form 태그 내에 CSRF 토큰의 값을
        input type hidden 형식으로 아래와 같이 추가해 줍니다.  -->
         <input type="hidden" name="${_csrf.parameterName}" value="${_csrf.token}"/>
        
          <div class="form-group">
            <label>제목</label> <input class="form-control" name='title'>
          </div>

          <div class="form-group">          
            <label>작성자</label>
             <input class="form-control" name='writer' value='<sec:authentication property="principal.username"/>' readonly="readonly">
          </div>
          
          <div class="form-group">
            <label>내용</label>
            <textarea class="form-control" rows="30" name='content'></textarea>
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

<!-- Page554 기존 게시물의 제목이나 내용을 입력하는 부분 아래쪽에 새로운 div 태그를 추가함 -->
<!-- Page554 File Attach 소스 코딩 시작 -->
<div class="row">
  <div class="col-lg-12">
    <div class="panel panel-default">

      <div class="panel-heading">첨부파일</div>
      <!-- /.panel-heading -->
      <div class="panel-body">
        <div class="form-group uploadDiv">
            <input type="file" name='uploadFile' mulinquiryle>
        </div>
        
        <div class='uploadResult'> 
          <ul style="padding: 0px">
          
          </ul>
        </div>
        
        
      </div>
      <!--  end panel-body -->

    </div>
    <!--  end panel-body -->
    <div>
          <button type="submit" class="btn btn-default" style="float: right;">글등록</button>
        </div>
        <!-- <div>
          <button type="reset" class="btn btn-default" style="float: right;">글 새로고침</button>
        </div> -->
  </div>
  <!-- end panel -->
</div>
<!-- /.row -->
<!-- Page554 File Attach 소스 코딩 끝 -->

<script>
// Page556 Javascript 처리 : 가장 먼저 'Submit Button'을 클릭했을 때 첨부파일 관련된
// 처리를 할 수 있도록 기본 동작을 막는 작업부터 시작합니다.
$(document).ready(function(e) {
	var formObj = $("form[role='form']");
	$("button[type='submit']").on("click", function(e) {
		e.preventDefault();
		console.log("submit clicked");
		
		// 아래 Page564 소스 코딩 추가 (시작)
		var str = "";
	    
	    $(".uploadResult ul li").each(function(i, obj){
	      
	      var jobj = $(obj);
	      
	      console.dir(jobj);
	      console.log("-------------------------");
	      console.log(jobj.data("filename"));
	      
	      // Page564 BoardVO에는 attachList라는 이름의 변수로 첨부파일의 정보를
	      // 수집하기 때문에 <input type='hidden'>의 name은
	      // 'attachList[인덱스번호]'와 같은 이름을 사용하도록 합니다.
	      str += "<input type='hidden' name='attachList["+i+"].fileName' value='"+jobj.data("filename")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uuid' value='"+jobj.data("uuid")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].uploadPath' value='"+jobj.data("path")+"'>";
	      str += "<input type='hidden' name='attachList["+i+"].fileType' value='"+ jobj.data("type")+"'>";
	      
	    });
	    
	    console.log(str);
	    
	    formObj.append(str).submit();
		
	}); // 아래 Page564 소스 코딩 추가 (끝)

// Page556 ~ Page557 소스 코딩 : 첨부된 파일의 처리는 앞서 방식과 동일하지만,
// 섬네일이나 파일 아이콘을 보여주는 부분은 처리하지 않았습니다.
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

// 721 아래 2줄 소스 코딩 추가
// form 태그를 이용하는 방식 이외에 많이 사용되는 Ajax를 이용하는 경우에는
// 스프링 시큐리티가 적용되면 POST, PUT, PATCH, DELETE와 같은 방식으로
// 데이터를 전송하는 경우에는 반드시 추가적으로 X-CSRF-TOKEN과 같은 헤더 정보를
// 추가해서 CSRF 토큰값을 전달하도록 처리해 줘야만 합니다.
// Ajax는 Javascript를 이용하기 때문에 브라우저에서 CSRF 토큰과 관련된 값을
// 아래와 같이 변수로 선언하고, 전송 시 포함시켜주는 방식으로 소스 코딩해 줍니다.
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
    contentType: false,
    // Page722 아래 2줄 소스 코딩 추가 : 기존 코드에 위에 2개 변수를 추가해 줍니다.
    // Ajax로 데이터를 전송할 때에는 beforeSend를 이용해서 추가적인 헤더를 지정해서
    // 전송 처리 합니다.
    beforeSend: function(xhr) {
		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
	},
     
    data: formData,
    type: 'POST',
    dataType:'json',
      success: function(result){
        console.log(result); 
		// Page557 소스 코딩 실행할 때 아래 1줄 소스는 주석 처리함  
        // showUploadResult(result); //업로드 결과 처리 함수
        
        // Page558 showUploadResult 제작 반영 후 아래 1줄 소스 추가
		showUploadResult(result); //업로드 결과 처리 함수
    	}
  	}); //$.ajax
  });

// Page558 showUploadResult 제작 반영 소스 코딩 시작
function showUploadResult(uploadResultArr){
    
    if(!uploadResultArr || uploadResultArr.length == 0){ return; }
    
    var uploadUL = $(".uploadResult ul");
    
    var str ="";
    
    $(uploadResultArr).each(function(i, obj){
    
        // image type
        // Page560 삭제를 위해 업로드된 파일의 경로와 UUID가 포함된 파일 이름이 필요하므로
        // Page561 button 태그에 'data-file'과 'data-type' 정보를 추가함
        if(obj.image){
          var fileCallPath =  encodeURIComponent( obj.uploadPath+ "/s_"+obj.uuid +"_"+obj.fileName);
          // Page563 소스 코딩 할 때 아래 1줄 소스는 주석 처리함
          // str += "<li><div>";
          
          // Page563 아래 3줄 소스 코딩함 : 첨부파일 정보를 태그로 생성할 때 첨부파일과
          // 관련된 정보(data-uuid, data-filename, data-type)를 추가합니다.
          str += "<li data-path='"+obj.uploadPath+"'";
		  str +=" data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"'"
		  str +" ><div>";
          
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='image' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/display?fileName="+fileCallPath+"'>";
          str += "</div>";
          str +"</li>";
        }else{
          var fileCallPath =  encodeURIComponent( obj.uploadPath+"/"+ obj.uuid +"_"+obj.fileName);            
            var fileLink = fileCallPath.replace(new RegExp(/\\/g),"/");
              
          // Page563 소스 코딩 할 때 아래 1줄 소스는 주석 처리함
          // str += "<li><div>";
          
          // Page563 아래 2줄 소스 코딩함 : 첨부파일 정보를 태그로 생성할 때 첨부파일과
          // 관련된 정보(data-uuid, data-filename, data-type)를 추가합니다.
          str += "<li "
		  str += "data-path='"+obj.uploadPath+"' data-uuid='"+obj.uuid+"' data-filename='"+obj.fileName+"' data-type='"+obj.image+"' ><div>";
			
          str += "<span> "+ obj.fileName+"</span>";
          str += "<button type='button' data-file=\'"+fileCallPath+"\' data-type='file' class='btn btn-warning btn-circle'><i class='fa fa-times'></i></button><br>";
          str += "<img src='/resources/img/attach.png'></a>";
          str += "</div>";
          str +"</li>";
        }
    });
    uploadUL.append(str);
  }
  // Page558 showUploadResult 제작 반영 소스 코딩 끝

  // Page560 업로드된 파일의 삭제를 위해 x 모양의 아이콘을 클릭할 때 이루어지는 이벤트 등록
  // 업로드된 파일에 'x'아이콘을 클릭하면 브라우저 콘솔창에 'delete file'이 출력되는 것을
  // 확인해 봅니다.   
  $(".uploadResult").on("click", "button", function(e){
    
    console.log("delete file");
      
    // Page561 'x'아이콘을 클릭하면 서버에서 삭제하도록 이벤트를 처리합니다.
    var targetFile = $(this).data("file");
    var type = $(this).data("type");
    
    var targetLi = $(this).closest("li");
    
    $.ajax({
      url: '/deleteFile',
      data: {fileName: targetFile, type:type},
      // Page723 아래 2줄 소스 코딩 추가 : 기존 코드에 위에 2개 변수를 추가해 줍니다.
      // Ajax로 데이터를 전송할 때에는 beforeSend를 이용해서 추가적인 헤더를 지정해서
      // 전송 처리 합니다.
      beforeSend: function(xhr) {
  		xhr.setRequestHeader(csrfHeaderName, csrfTokenValue);
  	},
      
      dataType:'text',
      type: 'POST',
        success: function(result){
           alert(result);
           
           targetLi.remove();
         }
    }); //$.ajax
   });

  
});


</script>

<script src="../resources/js/header.js"></script>

<%@include file="../includes/footer.jsp"%>
