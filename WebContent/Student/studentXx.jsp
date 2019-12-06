<%@ page import="java.sql.*" language="java" contentType="text/html; charset=utf-8"
    pageEncoding="utf-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=utf-8">
<title>选修</title>
</head>
<body>
<jsp:useBean id="db" class="bean.DbHelper" scope="page"/>
<%
    request.setCharacterEncoding("UTF-8");
    String id=(String)request.getParameter("id");
    String[] cId=new String[10];
    String[] bxcId=new String[10];
    String[] name=new String[10];
    String[] notice=new String[10];
    String[] require=new String[10];
    int[] credit=new int[10];
    int[] score=new int[10];
    int cnt=0;
    
    request.getSession();
    //下面是数据库操作 *代表所有值
    String sql="select * from student_course where studentId="+"'"+id+"'";//定义一个查询语句
    ResultSet rs=db.executeQuery(sql);//运行上面的语句
    while(rs.next())
    {
    	cId[cnt] = (String) rs.getObject("courseId");
    	cnt++;
    }
    int cnt1=0;
	for(int i=0;i<cnt;i++)
	{
		sql = "select * from course where id="+"'"+cId[i]+"' and class = '选修'";//定义一个查询语句
		rs = db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			bxcId[cnt1]= cId[i];
			name[cnt1] = (String) rs.getObject("name");
			credit[cnt1++] = rs.getInt("credit");
		}
	}
    for(int i=0;i<cnt1;i++)
    {
    	sql = "select * from grade where studentId="+"'"+id+"' and courseId = '"+cId[i]+"'";//定义一个查询语句
		rs = db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			score[i] = rs.getInt("tolScore");
		}
    }
    for(int i=0;i<cnt1;i++)
    {
    	sql = "select * from teacher_course where courseId="+"'"+bxcId[i]+"'";//定义一个查询语句
		rs = db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			notice[i] = (String) rs.getObject("notice");
			require[i] = (String) rs.getObject("require");
		}
    }
%>
<center>
	<h1 style="color:red">选修课程</h1> 
	  <table>
	  	<tr>
	  	  <td>课程</td>
	  	  <td>学分</td>
	  	  <td>成绩</td>
	  	  <td>要求</td>
	  	  <td>公告</td>
	  	</tr>
	  <% for(int i=0;i<cnt1;i++){ %>
		<tr>
		  <td><%=name[i] %></td>
		  <td><%=credit[i] %></td>
		  <% if(score[i]!=0){ %>
		  <td><%=score[i] %></td>
		  <% } %>
		  <% if(score[i]==0){ %>
		  <td>无</td>
		  <% } %>
		  <td><%=require[i] %></td>
		  <td><%=notice[i] %></td>
		</tr> 
	  <% } %>
	  </table> 
		<input type="button" value="返回" onclick="location.href='studentHome.jsp'" />
</center>
</body>
</html>