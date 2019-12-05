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
                        <td>已修读学分:${tolCredit}分</td>
                    </tr>
                </table>
    </center>
</body>
</html>