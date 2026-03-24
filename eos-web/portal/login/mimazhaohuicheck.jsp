<%@ page session="true" %><%@ page pageEncoding="UTF-8" %><%@ page contentType="text/html; charset=UTF-8" %><%@page import="java.io.*"%><%
String vcode = request.getParameter("verifyCode");
String verifyCode = "";
vcode = vcode==null?"__":vcode;
Object objverifyCode = session.getAttribute("verifyCode");

verifyCode = objverifyCode==null?"":(String)objverifyCode;

BufferedOutputStream bos = null;
byte[] output = null;
try{
	if(vcode.equals(verifyCode)){
		  bos = new BufferedOutputStream(response.getOutputStream());
		 String retcode="0";
		 output = retcode.getBytes();
	      bos.write(output, 0, output.length);
	}else{
		  bos = new BufferedOutputStream(response.getOutputStream());
		  String retcode="1";
		  output = retcode.getBytes();
	      bos.write(output, 0, output.length);
	}
	out.clear();
	out = pageContext.pushBody();
}catch(Exception ex){
	ex.printStackTrace();
}
finally {

      if (bos != null) bos.close();
}%>