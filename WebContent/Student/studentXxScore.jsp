<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生成绩</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String courseId=(String)request.getParameter("courseId");
    String studentId=(String)request.getParameter("studentId");
    String teacherId=(String)request.getParameter("teacherId");
    //String studentName=(String)request.getParameter("studentName");
    
    int nomalScore=0, attenScore=0, finalScore=0, tolScore=0;
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from grade where studentId="+"'"+studentId+"'"+ " and courseId = "+"'"+courseId+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    if(rs.next())
    {
    	nomalScore = rs.getInt("nomalScore");
    	attenScore = rs.getInt("attenScore");
    	finalScore = rs.getInt("finalScore");
    	tolScore = rs.getInt("tolScore");
    }
    
%>
 <center>
        <h1 style="color:red">学生成绩</h1>
        	<table>
        		<tr>
        			<td>平时成绩</td>
        			<td>考勤成绩</td>
        			<td>期末成绩</td>
        			<td>总成绩</td>
        			<td></td>
        		</tr>
        	    <tr>
        			<td><%=nomalScore %></td>
        			<td><%=attenScore %></td>
        			<td><%=finalScore %></td>
        			<td><%=tolScore %></td>
        		</tr>
        	</table>
        	
			<input type="button" value="返回" onclick="location.href='studentXx.jsp?id=<%=studentId%>'" />
			
</center>
</body>
</html>