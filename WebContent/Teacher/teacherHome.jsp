<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>教师主页</title>
</head>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<body>
    <center>
        <h1 style="color:red">教师主页</h1>      
                <table border="0">
                    <tr>
                        <td>教师:${name}</td>
                        <td>工号:${id}</td>
                        <td>学院:${academy}</td>
                    </tr>
                    <tr>
                        <td><a href="teacherInfo.jsp?id=${id}">个人信息</a></td>
                        <td><a href="teacherCourse.jsp?teacherId=${id}">课程</a></td>
                    </tr>
                    
                </table>
                <input type="button" value="退出" onclick="location.href='../Login/teacherLogin.jsp'" />
    </center>
</body>
</html>