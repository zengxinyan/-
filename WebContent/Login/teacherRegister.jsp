<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教师注册界面</title>
</head>
<body>
    <center>
        <h1 style="color:red">教师注册</h1>
            <form id="indexform" name="indexForm" action="teacherRegisterCheck.jsp" method="post">
                <table border="0">
                    <tr>
                        <td>教工号：</td>
                        <td><input type="text" name="sno"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="password" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="sname">
                        </td>
                    </tr>
                </table>
            <br>
          
                <button type="submit">注册</button>
                <input type="button" value="返回" onclick="location.href='http://localhost:8080/work/Login/teacherLogin.jsp'" />
            </form>
            
    </center>
</body>
</html>