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
    String courseId=(String)request.getParameter("courseId");
    String studentId=(String)request.getParameter("studentId");
    String teacherId=(String)request.getParameter("teacherId");
    String studentName=(String)request.getParameter("studentName");
    
    //String nomalScore1 = (String)request.getParameter("nomalScore");
   // String attenScore1 = (String)request.getParameter("attenScore");
    //String finalScore1 = (String)request.getParameter("finalScore");
    int nomalScore = Integer.parseInt(request.getParameter("nomalScore"));
    int attenScore = Integer.parseInt(request.getParameter("attenScore"));
    int finalScore = Integer.parseInt(request.getParameter("finalScore"));
	int tolScore = (int)(nomalScore*0.3 + attenScore*0.2 + finalScore*0.5);
	int tolCredit = 0, credit=0;
	int tolStudent=0,passStudent=0,noScore=0;
	String[] student = new String[10];
	
    request.getSession();
	
	String sql="select * from course where id="+"'"+courseId+"'";//定义一个查询语句
	ResultSet rs=db.executeQuery(sql);//运行上面的语句
	if(rs.next())
	{
		credit = rs.getInt("credit");
	}
	
	sql="select * from student_course where courseId="+"'"+courseId+"'";//定义一个查询语句
	rs=db.executeQuery(sql);//运行上面的语句
	while(rs.next())
	{
		student[tolStudent++] = (String) rs.getObject("studentId");
	}
	
	for(int i=0;i<tolStudent;i++)
	{
		sql="select * from grade where courseId="+"'"+courseId+"' and studentId='"+student[i]+"'";//定义一个查询语句
		rs=db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			if(rs.getInt("tolScore")>=60)
			{
				passStudent++;
			}
			if(rs.getInt("tolScore")==0)
			{
				noScore++;
			}
		}
	}
	
	if(tolScore>=60)
	{
		passStudent++;
		
		sql="select * from student where id="+"'"+studentId+"'";//定义一个查询语句
		rs=db.executeQuery(sql);//运行上面的语句
		if(rs.next())
		{
			tolCredit = rs.getInt("tolCredit");
		}
		tolCredit += credit;
		
		sql="update student set tolCredit = "+tolCredit+"where id="+"'"+studentId+"'";//定义一个查询语句
		rs=db.executeQuery(sql);//运行上面的语句
	}
	
	sql="update course set passed ="+(int)100*(passStudent+noScore-1)/tolStudent+" where id="+"'"+courseId+"'";//定义一个查询语句
	rs=db.executeQuery(sql);//运行上面的语句

    //下面是数据库操作 *代表所有值
    sql="update grade set nomalScore="+nomalScore+",attenScore="+attenScore+",finalScore="+finalScore+",tolScore="+tolScore+" where studentId="+"'"+studentId+"'"+ " and courseId = "+"'"+courseId+"'";//定义一个查询语句
    rs=db.executeQuery(sql);//运行上面的语句
    out.print("<script language='javaScript'> alert('登记成功');</script>");
    //response.setHeader("refresh", "0;url=teacherCourseStudentScore.jsp?teacherId="+teacherID);
%>
<input type="button" value="返回" onclick="location.href='teacherCourseStudentScore.jsp?teacherId=<%=teacherId%>&courseId=<%=courseId%>&studentId=<%=studentId%>'" />
</body>
</html>