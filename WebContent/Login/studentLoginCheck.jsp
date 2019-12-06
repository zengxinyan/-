<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>student</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String username=(String)request.getParameter("username");
    String password=(String)request.getParameter("password");
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from student where id="+"'"+username+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    if(rs.next())
    {
        if(password.equals(rs.getObject("password"))){
        	session.setAttribute("name", rs.getObject("name"));
        	session.setAttribute("id", rs.getObject("id"));
        	session.setAttribute("academy", rs.getObject("academy"));
        	session.setAttribute("tolCredit", rs.getObject("tolCredit"));
            response.sendRedirect("../Student/studentHome.jsp");
        }
        else{
            out.print("<script language='javaScript'> alert('密码错误');</script>");
            response.setHeader("refresh", "0;url=studentLogin.jsp");
        }
    }
    else 
    {
        out.print("<script language='javaScript'> alert('该账户不存在');</script>");
        response.setHeader("refresh", "0;url=studentLogin.jsp");
    }
    
%>
</body>
</html>