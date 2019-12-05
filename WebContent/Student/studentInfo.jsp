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
    String id=(String)request.getParameter("id");

    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from student where id="+"'"+id+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    if(rs.next())
    {
    	out.print(rs.getObject("name"));
    	out.print(rs.getObject("id"));
        out.print(rs.getObject("sex"));
        out.print(rs.getObject("age"));

    }
    else 
    {
        out.print("<script language='javaScript'> alert('该账户不存在');</script>");
        response.setHeader("refresh", "0;url=studentLogin.jsp");
    }
    
%>
<p><%=id %></p>
</body>
</html>