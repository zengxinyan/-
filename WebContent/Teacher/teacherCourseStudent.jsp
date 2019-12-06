<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>课程学生</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String courseId=(String)request.getParameter("courseId");
    String courseName=(String)request.getParameter("courseName");
    String teacherId=(String)request.getParameter("teacherId");
    
    String[] studentId = new String[10];
    String[] studentName = new String[10];
    String[] studentAcademy = new String[10];
    int[] studentScore = new int[10];
    int cnt=0;
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from student_course where courseId="+"'"+courseId+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    while(rs.next())
    {
    	studentId[cnt++] = (String) rs.getObject("studentId");
    }
    
    for(int i=0;i<cnt;i++)
    {
    	sql="select * from student where id="+"'"+studentId[i]+"'";//定义一个查询语句
    	rs=db.executeQuery(sql);//运行上面的语句
    	if(rs.next())
    	{
    		studentName[i] = (String) rs.getObject("name");
    		studentAcademy[i] = (String) rs.getObject("academy");
    	}
    }
    for(int i=0;i<cnt;i++)
    {
    	sql="select * from grade where studentId="+"'"+studentId[i]+"'"+ " and courseId = "+"'"+courseId+"'";//定义一个查询语句
    	rs=db.executeQuery(sql);//运行上面的语句
    	if(rs.next())
    	{
    		studentScore[i] = rs.getInt("tolScore");
    	}
    }
    
%>
 <center>
        <h1 style="color:red">课程学生</h1>
        	<table>
        		<tr>
        			<td>学号</td>
        			<td>姓名</td>
        			<td>学院</td>
        			<td>成绩</td>
        			<td></td>
        		</tr>
        	    <%for(int i=0;i<cnt;i++){ %>
        	    <tr>
        			<td><%=studentId[i] %></td>
        			<td><%=studentName[i] %></td>
        			<td><%=studentAcademy[i] %></td>
        			<% if(studentScore[i]!=0){ %>
		  			<td><%=studentScore[i] %></td>
		  			<td><a href="teacherCourseStudentScore.jsp?teacherId=<%=teacherId%>&courseName=<%=courseName%>&studentName=<%=studentName[i]%>&courseId=<%=courseId%>&studentId=<%=studentId[i]%>">详细成绩</a></td>
		  			<% } %>
		  			<% if(studentScore[i]==0){ %>
		  			<td>无</td>
		  			<td><a href="teacherCourseStudentScore.jsp?teacherId=<%=teacherId%>&courseName=<%=courseName%>&studentName=<%=studentName[i]%>&courseId=<%=courseId%>&studentId=<%=studentId[i]%>">登记成绩</a></td>
		  			<% } %>
        			
        		</tr>
        	    <%} %>
        	</table>
        	
			<input type="button" value="返回" onclick="location.href='teacherCourse.jsp?teacherId=<%=teacherId%>'" />
			
</center>
</body>
</html>