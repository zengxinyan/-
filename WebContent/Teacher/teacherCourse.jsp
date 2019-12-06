<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>教师信息</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String teacherId=(String)request.getParameter("teacherId");
    String name=null,sex=null,academy=null;
    int cnt=0;
    String[] courseId = new String[10];
    String[] courseName = new String[10];
    int[] courseCredit = new int[10];
    String[] courseClass = new String[10];
    int[] coursePassed = new int[10];
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from teacher_course where teacherId="+"'"+teacherId+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    while(rs.next())
    {
    	 courseId[cnt++] = (String) rs.getObject("courseId");
    }
    for(int i=0;i<cnt;i++)
    {
    	sql="select * from course where id="+"'"+courseId[i]+"'";//定义一个查询语句
    	rs=db.executeQuery(sql);//运行上面的语句
    	if(rs.next())
    	{
    		courseName[i] = (String) rs.getObject("name");
    		courseCredit[i] =  rs.getInt("credit");
    		courseClass[i] = (String) rs.getObject("class");
    		coursePassed[i] = rs.getInt("passed");
    	}
    }
    
%>
 <center>
        <h1 style="color:red">教师课程</h1>
        	<table>
        		<tr>
        			<td>课程号</td>
        			<td>课程名</td>
        			<td>属性</td>
        			<td>学分</td>
        			<td>通过率</td>
        			<td></td>
        		</tr>
        	    <%for(int i=0;i<cnt;i++){ %>
        	    <tr>
        			<td><%=courseId[i] %></td>
        			<td><%=courseName[i] %></td>
        			<td><%=courseClass[i] %></td>
        			<td><%=courseCredit[i] %></td>
        			<td><%=coursePassed[i] %>%</td>
        			<td><a href="teacherCourseStudent.jsp?teacherId=<%=teacherId%>&courseId=<%=courseId[i]%>&courseName=<%=courseName[i]%>">学生</a></td>
        		</tr>
        	    <%} %>
        	</table>
        	
			<input type="button" value="返回" onclick="location.href='teacherHome.jsp'" />
			
</center>
</body>
</html>