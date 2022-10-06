<%@ page language="java" contentType="text/html; charset=UTF-8"
   pageEncoding="UTF-8"%>
   <%@ taglib prefix="se" uri="http://www.springframework.org/security/tags" %>
   
<!DOCTYPE html>
<html lang="ko">
<head>
<meta charset="UTF-8">
<meta http-equiv="X-UA-Compatible" content="IE=edge">
<meta name="viewport" content="width=device-width, initial-scale=1.0">
<title>회원가입</title>
<link rel="stylesheet" href="../resources/css/signup.css">
<link rel="stylesheet" href="../resources/css/font.css">
<link rel="stylesheet" href="../resources/css/header.css">
<link rel="preconnect" href="https://fonts.googleapis.com">
<link rel="preconnect" href="https://fonts.gstatic.com" crossorigin>
<link href="https://fonts.googleapis.com/css2?family=Jua&display=swap" rel="stylesheet">
<script src="https://kit.fontawesome.com/3624917c4f.js" crossorigin="anonymous"></script>
<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
<script>
   //본 예제에서는 도로명 주소 표기 방식에 대한 법령에 따라, 내려오는 데이터를 조합하여 올바른 주소를 구성하는 방법을 설명합니다.
   function sample4_execDaumPostcode() {
      new daum.Postcode(
            {
               oncomplete : function(data) {
                  // 팝업에서 검색결과 항목을 클릭했을때 실행할 코드를 작성하는 부분.

                  // 도로명 주소의 노출 규칙에 따라 주소를 표시한다.
                  // 내려오는 변수가 값이 없는 경우엔 공백('')값을 가지므로, 이를 참고하여 분기 한다.
                  var roadAddr = data.roadAddress; // 도로명 주소 변수
                  var extraRoadAddr = ''; // 참고 항목 변수

                  // 법정동명이 있을 경우 추가한다. (법정리는 제외)
                  // 법정동의 경우 마지막 문자가 "동/로/가"로 끝난다.
                  if (data.bname !== '' && /[동|로|가]$/g.test(data.bname)) {
                     extraRoadAddr += data.bname;
                  }
                  // 건물명이 있고, 공동주택일 경우 추가한다.
                  if (data.buildingName !== '' && data.apartment === 'Y') {
                     extraRoadAddr += (extraRoadAddr !== '' ? ', '
                           + data.buildingName : data.buildingName);
                  }
                  // 표시할 참고항목이 있을 경우, 괄호까지 추가한 최종 문자열을 만든다.
                  if (extraRoadAddr !== '') {
                     extraRoadAddr = ' (' + extraRoadAddr + ')';
                  }

                  // 우편번호와 주소 정보를 해당 필드에 넣는다.
                  document.getElementById('sample4_postcode').value = data.zonecode;
                  document.getElementById("sample4_roadAddress").value = roadAddr;
                  document.getElementById("sample4_jibunAddress").value = data.jibunAddress;

                  // 참고항목 문자열이 있을 경우 해당 필드에 넣는다.
                  if (roadAddr !== '') {
                     document.getElementById("sample4_extraAddress").value = extraRoadAddr;
                  } else {
                     document.getElementById("sample4_extraAddress").value = '';
                  }

                  var guideTextBox = document.getElementById("guide");
                  // 사용자가 '선택 안함'을 클릭한 경우, 예상 주소라는 표시를 해준다.
                  if (data.autoRoadAddress) {
                     var expRoadAddr = data.autoRoadAddress
                           + extraRoadAddr;
                     guideTextBox.innerHTML = '(예상 도로명 주소 : '
                           + expRoadAddr + ')';
                     guideTextBox.style.display = 'block';

                  } else if (data.autoJibunAddress) {
                     var expJibunAddr = data.autoJibunAddress;
                     guideTextBox.innerHTML = '(예상 지번 주소 : '
                           + expJibunAddr + ')';
                     guideTextBox.style.display = 'block';
                  } else {
                     guideTextBox.innerHTML = '';
                     guideTextBox.style.display = 'none';
                  }
               }
            }).open();
   }
</script>
</head>
<style>
</style>
<body>
   <header>
      <div class="inner">
         <nav class="navbar">
            <a href="/index" class="logo"> <img src="../resources/img/logo.png"
               alt="I dream" />
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
   </header>
   <div class="container">
      <div>
         <div class="col-md-offset-3">
            <div class="panel panel-primary">
               <div class="panel-body">
                  <form method="post" name="join" id="join" action="/user/signup">
                     <input type="hidden" name="${_csrf.parameterName}"
                        value="${_csrf.token}" />
                     <div class="form-group">
                        <label for="ID">아이디<span id="idError"></span></label> <input
                           type="text" id="ID" class="form-control int check"
                           name="userid" maxlength="20" placeholder="아이디를 입력하세요.">
                     </div>
                     <div class="form-group">
                        <label for="pw">비밀번호<span id="pwError"></span></label> <input
                           type="password" id="pw" class="form-control int check"
                           name="userpw" maxlength="20" placeholder="비밀번호를 입력하세요">
                     </div>
                     <div class="form-group">
                        <label for="pwCheck">비밀번호 재확인<span id="pwCheckError"></span></label>
                        <input type="password" id="pwCheck"
                           class="form-control int check" name="userpw" maxlength="20"
                           placeholder="비밀번호를 다시 입력하세요">
                     </div>
                     <div class="form-group">
                        <label for="name">성명<span id="nameError"></span></label> <input
                           type="text" id="name" class="form-control int check"
                           name="userName" maxlength="20" placeholder="이름을 입력하세요">
                     </div>
                     <div class="form-group">
                        <label for="name">전화번호("-" 제외)<span id="phoneNumError"></span></label>
                        <input type="text" id="phoneNum" class="form-control int check"
                           name="phone_num" maxlength="20" placeholder="전화번호를 입력하세요">
                     </div>
                     <div class="form-group" id="address">
                        <label for="emailaddr">자택주소<span id="addressError"></span></label><br />
                        <input type="text" id="sample4_postcode"
                           class="d_form mini line addressCheck form-control"
                           placeholder="우편번호"> <input type="button"
                           id="addressButton" class="d_form mini form-control"
                           onclick="sample4_execDaumPostcode()" value="우편번호 찾기" readonly><br />
                        <input type="text" id="sample4_roadAddress"
                           class="d_form mini line form-control" placeholder="도로명주소"
                           name="address1"> <input type="text"
                           id="sample4_jibunAddress" class="d_form mini line form-control"
                           placeholder="지번주소" name="address2"><br /> <span
                           id="guide" style="color: #999; display: none"></span> <input
                           type="text" id="sample4_detailAddress"
                           class="d_form mini line addressCheck form-control"
                           placeholder="상세주소" name="address3"> <input type="text"
                           id="sample4_extraAddress" class="d_form mini line form-control"
                           placeholder="참고주소">
                     </div>
                     <div class="form-group">
                        <label for="email">이메일<span id="emailError"></span></label><br />
                        <input type="text" id="email" maxlength="20"
                           class="check form-control" name="email" placeholder="이메일">
                        <select id="email_Select" class="form-control">
                           <option>이메일 선택</option>
                           <option>naver.com</option>
                           <option>gmail.com</option>
                           <option>daum.net</option>
                           <option>hanmail.net</option>
                           <option>hotmail.com</option>
                           <option>nate.com</option>
                           <option>yahoo.co.kr</option>
                           <option>empas.com</option>
                           <option>freechal.com</option>
                           <option>lycos.co.kr</option>
                           <option>korea.com</option>
                           <option>hanmir.com</option>
                           <option>dreamwiz.com</option>
                           <option>paran.com</option>
                        </select>
                     </div>
                     <div class="form-group">
                        <label class="list"> 개인정보 수집/이용동의<span id="consentError"></span>
                        </label>
                        <div id="informationConsent" class="form-control">
                           <span id="consentBox"> <label>개인정보 처리방침<span
                                 id="consentError"></span>
                           </label><br /> 제1조(개인정보의 처리목적) 은(는) 다음의 목적을 위하여 개인정보를 처리합니다. 처리하고 있는
                              개인정보는 다음의 목적 이외의 용도로는 이용되지 않으며, 이용 목적이 변경되는 경우에는 개인정보 보호법
                              제18조에 따라 별도의 동의를 받는 등 필요한 조치를 이행할 예정입니다. 1. 홈페이지 회원 가입 및 관리 회원
                              가입의사 확인, 회원제 서비스 제공에 따른 본인 식별․인증, 회원자격 유지․관리, 제한적 본인확인제 시행에 따른
                              본인확인, 서비스 부정이용 방지, 만 14세 미만 아동의 개인정보 처리시 법정대리인의 동의여부 확인, 각종
                              고지․통지, 고충처리 등을 목적으로 개인정보를 처리합니다. 2. 재화 또는 서비스 제공 물품배송, 서비스 제공,
                              계약서․청구서 발송, 콘텐츠 제공, 맞춤서비스 제공, 본인인증, 연령인증, 요금결제․정산, 채권추심 등을
                              목적으로 개인정보를 처리합니다. 3. 고충처리 민원인의 신원 확인, 민원사항 확인, 사실조사를 위한 연락․통지,
                              처리결과 통보 등의 목적으로 개인정보를 처리합니다.
                           </span>
                        </div>
                        <div class="text-center">
                           <label class="select"><input type="radio" id="check"
                              name="check" value="동의">동의</label> <label class="select"><input
                              type="radio" id="noneCheck" name="check" value="비동의"
                              checked="checked">비동의</label>
                        </div>
                     </div>
                     <div class="form-group text-center">
                        <button type="submit" class="btn btn-primary btn-lg"
                           id="btnJoin">회원가입</button>
                     </div>
                  </form>
               </div>
            </div>
         </div>
      </div>
   </div>
   <script src="../resources/js/header.js"></script>
</body>
</html>