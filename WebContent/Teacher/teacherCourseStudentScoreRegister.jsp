<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>登记成绩</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String courseId=(String)request.getParameter("courseId");
    String studentId=(String)request.getParameter("studentId");
    String teacherId=(String)request.getParameter("teacherId");
    String studentName=(String)request.getParameter("studentName");
    
%>
 <center>
        <h1 style="color:red">登记成绩</h1>
        <form action="scoreRegisterCheck.jsp?teacherId=<%=teacherId%>&courseId=<%=courseId%>&studentId=<%=studentId%>" method="post">
        	<table>
        		<tr>
        			<td>平时成绩</td>
        			<td><input type="text" name="nomalScore"></td>
        		</tr>
        		<tr>
        			<td>考勤成绩</td>
        			<td><input type="text" name="attenScore"></td>
        		</tr>
        		<tr>
        			<td>期末成绩</td>
        			<td><input type="text" name="finalScore"></td>
        		</tr>
        	</table>
        	<button type="submit">登记</button>
			<input type="button" value="返回" onclick="location.href='teacherCourseStudent.jsp?teacherId=<%=teacherId%>&courseId=<%=courseId%>&name=${courseName}>'" />
		</form>
</center>
</body>
</html>