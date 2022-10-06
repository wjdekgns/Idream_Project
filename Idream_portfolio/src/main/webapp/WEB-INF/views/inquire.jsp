<%response.setHeader("Access-Control-Allow-Origin","*"); %>
<%@ page language="java" contentType="text/html; charset=UTF-8" 
    pageEncoding="UTF-8"%> 
<%@page import="java.net.URL"%>
<%@page import="java.net.URLConnection"%>
<%@page import="java.io.InputStreamReader"%>
<%@page import="java.io.BufferedReader"%>
<%@page import="java.net.MalformedURLException"%>
<%@page import="java.io.IOException"%>
<%@page import="java.io.OutputStreamWriter"%>

<!DOCTYPE html PUBLIC "-//W3C//DTD XHTML 1.0 Transitional//EN" "http://www.w3.org/TR/xhtml1/DTD/xhtml1-transitional.dtd">
<html xmlns="http://www.w3.org/1999/xhtml" xml:lang="ko" lang="ko">
<head> 
<script src="https://code.jquery.com/jquery-1.9.1.min.js"></script>
<script>
$(document).ready(function() {
     $("form").attr("method", "get");
});
</script>
<!-- <script>
$.ajax({
	  type: 'POST',
	  url: "https://www.safe182.go.kr/api/lcm/findChildListT.do",
	  data: data,
	  success: success,
	  dataType: dataType
});
</script> -->
<title>실종검색 템플릿</title>
<meta
  http-equiv="Content-Security-Policy"
  content="upgrade-insecure-requests"
/>
</head> 
<body> 

<%

   request.setCharacterEncoding("UTF-8");

   String esntlId = "10000486";
   String authKey = "3b1da20c64994256";
   String rowSize = "10";
   String returnURL = "/inquire";
   String nowPage = request.getParameter("nowPage") == null ? "" : (String) request.getParameter("nowPage");
   String[] writngTrgetDscds = request.getParameterValues("writngTrgetDscds");
   String sexdstnDscd = request.getParameter("sexdstnDscd") == null ? "" : (String) request.getParameter("sexdstnDscd");
   String nm = request.getParameter("nm") == null ? "" : (String) request.getParameter("nm");
   String detailDate1 = request.getParameter("detailDate1") == null ? "" : (String) request.getParameter("detailDate1");
   String detailDate2 = request.getParameter("detailDate2") == null ? "" : (String) request.getParameter("detailDate2");
   String age1 = request.getParameter("age1") == null ? "" : (String) request.getParameter("age1");
   String age2 = request.getParameter("age2") == null ? "" : (String) request.getParameter("age2");
   String etcSpfeatr = request.getParameter("etcSpfeatr") == null ? "" : (String) request.getParameter("etcSpfeatr");
   String occrAdres = request.getParameter("occrAdres") == null ? "" : (String) request.getParameter("occrAdres");
   
   String urlStr = "https://www.safe182.go.kr/api/lcm/findChildListT.do";
   
   String params = "esntlId=";
   params += esntlId;
   params += "&authKey=";
   params += authKey;
   params += "&rowSize=";
   params += rowSize;
   params += "&returnURL=";
   params += returnURL;
   params += "&nowPage=";
   params += nowPage;
   
   if(writngTrgetDscds != null){
      for(int i=0; i<writngTrgetDscds.length; i++){
         params += "&writngTrgetDscds=";
         params += writngTrgetDscds[i];   
      }
   }
   
   params += "&sexdstnDscd=";
   params += sexdstnDscd;
   params += "&nm=";
   params += nm;
   params += "&detailDate1=";
   params += detailDate1;
   params += "&detailDate2=";
   params += detailDate2;
   params += "&age1=";
   params += age1;
   params += "&age2=";
   params += age2;
   params += "&etcSpfeatr=";
   params += etcSpfeatr;
   params += "&occrAdres=";
   params += occrAdres;
   
   //System.out.println(urlStr+"?"+params);
   
   URL url;
   URLConnection connection;
   OutputStreamWriter wr = null;
   InputStreamReader isr = null;
   BufferedReader br = null;
   String strHTML = "";
   
   try{
   
      url = new URL(urlStr);
      connection = url.openConnection();
      connection.setDoOutput(true);
      
      wr = new OutputStreamWriter(connection.getOutputStream(), "utf-8");
      wr.write(params);
      wr.flush();
      
      isr = new InputStreamReader(connection.getInputStream(), "utf-8");
      br = new BufferedReader(isr);
      String buf = "";
   
      while(true){
          buf = br.readLine();
          if(buf == null){
             break;
          }else{
             strHTML += (buf + "\n");
          }
       }
   
    } catch(MalformedURLException e){
       e.printStackTrace();
    } catch(IOException ioe){
       ioe.printStackTrace();
    } finally {
       wr.close();
       isr.close();
       br.close();
    }
    
    if(strHTML.indexOf("message") > -1){
       
       out.print("<script type='text/javascript'>\n");
       out.print("var resultStr = '" + strHTML.replace("\n", "") + "';\n");
       out.print("var jsonObject = jQuery.parseJSON(resultStr);\n");
       out.print("var _result = jsonObject.result;\n");
       out.print("var _message = jsonObject.message;\n");
       out.print("alert('result : ' + _result + ', message : ' + _message);\n");
       out.print("history.back();\n");
       out.print("</script>");
       
    } else {
       out.print(strHTML);       
    }
%>

</body> 
</html> 