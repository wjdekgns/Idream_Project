<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
</div>
        <!-- /#page-wrapper -->

    </div>
   <!--FOOTER-->
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
    <!-- /#wrapper -->

    <!-- jQuery -->
    <!-- 
    <script src="/resources/vendor/jquery/jquery.min.js"></script>
     -->

    <!-- Bootstrap Core JavaScript -->
    <script src="/resources/vendor/bootstrap/js/bootstrap.min.js"></script>

    <!-- Metis Menu Plugin JavaScript -->
    <script src="/resources/vendor/metisMenu/metisMenu.min.js"></script>

    <!-- DataTables JavaScript -->
    <script src="/resources/vendor/datatables/js/jquery.dataTables.min.js"></script>
    <script src="/resources/vendor/datatables-plugins/dataTables.bootstrap.min.js"></script>
    <script src="/resources/vendor/datatables-responsive/dataTables.responsive.js"></script>

    <!-- Custom Theme JavaScript -->
    <script src="/resources/dist/js/sb-admin-2.js"></script>

    <!-- Page-Level Demo Scripts - Tables - Use for reference -->
    <script>
    $(document).ready(function() {
        $('#dataTables-example').DataTable({
            responsive: true
        });
    // 아래 jQuery 소스 코드는 jQuery 교체 후 모바일 크기에서 새로 고침 할 경우에 메뉴가 펼쳐지는 문제 해결을 위한 소스 코드 삽입 입니다.
    $(".slidebar-nav")
    	.attr("class", "slidebar-nav navbar-collapse collapse")
    	.attr("aria-expanded", 'false')
    	.attr("style", "height:1px");
    });   
    
    </script>

</body>

</html>
