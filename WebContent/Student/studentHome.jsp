<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=ISO-8859-1">
<title>学生主页</title>
</head>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<body>
    <center>
        <h1 style="color:red">学生主页</h1>      
                <table border="0">
                    <tr>
                        <td>学生:${name}</td>
                        <td>学号:${id}</td>
                        <td>学院:${academy}</td>
                        <td>学分:${tolCredit}分</td>
                    </tr>
                    <tr>
                    <td>查看课程:</td>
                    <td><a href="studentBx.jsp?id=${id}">必修</a></td>
                    <td><a href="studentXx.jsp?id=${id}">选修</a></td>
                    </tr>
                    <tr>
                        <td><a href="studentInfo.jsp?id=${id}">个人信息</a></td>
                    </tr>
                </table>
                <input type="button" value="退出" onclick="location.href='../Login/studentLogin.jsp'" />
    </center>
</body>
</html>