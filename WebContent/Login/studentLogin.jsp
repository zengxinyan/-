<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>学生登录界面</title>
</head>
<body>
    <center>
        <h1 style="color:red">学生登录</h1>
            <form action="studentLoginCheck.jsp" method="post">
                <table border="0">
                    <tr>
                        <td>学号：</td>
                        <td><input type="text" name="username"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password">
                        </td>
                    </tr>
                </table>
            <br>
                <input type="submit" value="登录">
                <input type="button" value="返回" onclick="location.href='http://localhost:8080/work/index.jsp'" />
                <input type="button" value="注册" onclick="location.href='http://localhost:8080/work/Login/studentRegister.jsp'" />
            </form>
            
    </center>
</body>
</html>