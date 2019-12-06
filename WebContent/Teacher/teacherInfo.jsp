<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教师信息</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String id=(String)request.getParameter("id");
    String name=null,sex=null,academy=null;
    int age=0;
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from teacher where id="+"'"+id+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    if(rs.next()){
    	 name =(String) rs.getObject("name");
    	 academy =(String) rs.getObject("academy");
    	 sex =(String) rs.getObject("sex");
    	 age =rs.getInt("age");
    }
    else 
    {
        
    }
    
%>
 <center>
        <h1 style="color:red">教师信息</h1>
			<p>姓名：<%=name %></p>
			<p>工号：<%=id %></p>
			<p>学院：<%=academy %></p>
			<p>性别：<%=sex %></p>
			<p>年龄：<%=age %></p>
			<input type="button" value="修改" onclick="location.href='teacherInfoChange.jsp?id=<%=id%>'" />
			<input type="button" value="返回" onclick="location.href='teacherHome.jsp'" />
			
</center>
</body>
</html>