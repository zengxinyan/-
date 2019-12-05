<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>Insert title here</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String sno=(String)request.getParameter("sno");
    String password=(String)request.getParameter("password");
    String sname=(String)request.getParameter("sname");

    request.getSession();

    String sql="insert into teacher values('"+sno+"','"+sname+"','"+password+"')";
    db.execQuery(sql);//执行
    out.print("<script language='javaScript'> alert('注册成功');</script>");
    response.setHeader("refresh", "0;url=teacherLogin.jsp");
%>
</body>
</html>
