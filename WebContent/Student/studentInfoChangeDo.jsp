<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title></title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
	String thisid=(String)request.getParameter("id");
    String password=(String)request.getParameter("password");
    String name=(String)request.getParameter("name");
    String sex=(String)request.getParameter("sex");
    String age=(String)request.getParameter("age");
    String academy=(String)request.getParameter("academy");

    request.getSession();
    String sql="update student set name = "+"'"+name+"',sex="+"'"+sex+"',password="+"'"+password+"',academy="+"'"+academy+"',age="+"'"+age+"'"+"where id ="+"'"+thisid+"'";
    db.execQuery(sql);//执行
    out.print("<script language='javaScript'> alert('修改成功,请重新登录');</script>");
    response.setHeader("refresh", "0;url=../Login/studentLogin.jsp");
%>
</body>
</html>
