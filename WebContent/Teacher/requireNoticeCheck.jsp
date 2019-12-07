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
    String courseRequire=(String)request.getParameter("courseRequire");
    String courseNotice=(String)request.getParameter("courseNotice");
    String courseId=(String)request.getParameter("courseId");
    String teacherId=(String)request.getParameter("teacherId");
    
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="update teacher_course set notice='"+courseNotice+"' where teacherId="+"'"+teacherId+"'"+ " and courseId = "+"'"+courseId+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    out.print("<script language='javaScript'> alert('发布成功');</script>");
    //response.setHeader("refresh", "0;url=teacherCourseStudentScore.jsp?teacherId="+teacherID);
%>
<input type="button" value="返回" onclick="location.href='teacherCourse.jsp?teacherId=<%=teacherId%>'" />
</body>
</html>