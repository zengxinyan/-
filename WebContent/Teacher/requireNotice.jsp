<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>发布公告</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String courseId=(String)request.getParameter("courseId");
    String teacherId=(String)request.getParameter("teacherId");
    
%>
 <center>
        <h1 style="color:red">发布公告</h1>
        <form action="requireNoticeCheck.jsp?teacherId=<%=teacherId%>&courseId=<%=courseId%>" method="post">
        	<table>
        		<tr>
        			<td>课程公告</td>
        			<td><input type="text" name="courseNotice"></td>
        		</tr>
        	</table>
        	<button type="submit">发布</button>
			<input type="button" value="返回" onclick="location.href='teacherCourse.jsp?teacherId=<%=teacherId%>'" />
		</form>
</center>
</body>
</html>