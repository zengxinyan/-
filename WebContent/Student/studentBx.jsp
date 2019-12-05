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
    String sql="select * from student_course where studentId="+"'"+id+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    if(rs.next())
    {
    	String cId = (String) rs.getObject("courseId");
    	sql="select * from course where id="+"'"+cId+"'";//定义一个查询语句
    	rs=db.executeQuery(sql);//运行上面的语句
    	if(rs.next())
    	{
        	out.print(rs.getObject("name"));
        	out.print(rs.getObject("credit"));
    	}
    }
    else 
    {
        out.print("课表为空");
    }
    
%>
<p><%=id %></p>
</body>
</html>