<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教师信息修改</title>
</head>
<body>
    <center>
    	<% String id=(String)request.getParameter("id");%>
        <h1 style="color:red">修改信息</h1>
            <form action="teacherInfoChangeDo.jsp?id=<%=id %>" method="post">
                <table border="0">
                	<tr>
                        <td>工号：</td>
                        <td><%=id %></td>
                    </tr>
                    <tr>
                        <td>姓名：</td>
                        <td><input type="text" name="name"></td>
                    </tr>
                    <tr>
                        <td>密码：</td>
                        <td><input type="text" name="password">
                        </td>
                    </tr>
                    <tr>
                        <td>学院：</td>
                        <td><input type="text" name="academy">
                        </td>
                    </tr>
                    <tr>
                        <td>性别：</td>
                        <td><input type="text" name="sex">
                        </td>
                    </tr>
                    <tr>
                        <td>年龄：</td>
                        <td><input type="text" name="age">
                        </td>
                    </tr>
                </table>
            <br>
          
                <button type="submit">修改</button>
                <input type="button" value="返回" onclick="location.href='teacherInfo.jsp?id=<%=id %>'" />
            </form>
            
    </center>
</body>
</html>