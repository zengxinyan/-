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
    String[] cId=new String[10];
    String[] name=new String[10];
    int[] credit=new int[10];
    int[] score=new int[10];
    int cnt=0;
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from student_course where studentId="+"'"+id+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    while(rs.next())
    {
    	cId[cnt] = (String) rs.getObject("courseId");
    	cnt++;
    }
    
    int cnt1=0;
	for(int i=0;i<cnt;i++)
	{
		sql = "select * from course where id="+"'"+cId[i]+"' and class = '必修'";//定义一个查询语句
		rs = db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			name[cnt1] = (String) rs.getObject("name");
			credit[cnt1++] = rs.getInt("credit");
		}
	}
    for(int i=0;i<cnt1;i++)
    {
    	sql = "select * from grade where studentId="+"'"+id+"' and courseId = '"+cId[i]+"'";//定义一个查询语句
		rs = db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			score[i] = rs.getInt("tolScore");
		}
    }
%>
<center>
	<h1 style="color:red">必修课程</h1>    
	  <% for(int i=0;i<cnt1;i++){ %>
		<p>课程：<%=name[i] %>  学分：<%=credit[i] %>  成绩：<%=score[i] %></p>
	  <% } %>
		<input type="button" value="返回" onclick="location.href='studentHome.jsp'" />
</center>
</body>
</html>