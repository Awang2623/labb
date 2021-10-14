<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>学生管理系统</title>
<style type="text/css">
body {
	text-align: center;
 }

table {
	width: 400px;
	border: 1px solid #696969;
	border-collapse: collapse;
	margin:0 auto;
 }
th {
	border: 1px solid #696969;
	background-color: #FFF8DC;
 }
td {
	text-align: center;
	border: 1px solid #696969;
	height: 50px;
	background-color: #E0FFFF;
 }
</style>
</head>
<body>
<center><h1>学生管理系统</h3></center>
<center><a href=add.jsp style="font-size: 24px">添加学生信息</a></center><p>

<table  width="50%" border="1"  >

<tr ><th >学号</th><th >姓名</th><th >性别</th><th >出生日期</th><th >地址</th><th >管理</th></tr>

<%

	Class.forName("com.mysql.cj.jdbc.Driver");
	
	Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab03?&useSSL=false&serverTimezone=UTC","root","password");
	
	Statement stmt=con.createStatement();
	
	String s="select * from Student";
	
	ResultSet rs=stmt.executeQuery(s);
	
	while(rs.next())
	
	{
	
	int id=rs.getInt(1);
	
	out.println("<tr ><td>"+rs.getString(2)+"</td><td>"+rs.getString(3)+"</td><td>"+rs.getString(4)+"</td><td>"+rs.getString(5)+"</td><td>"+rs.getString(6)+"</td><td><a href='update.jsp?id="+id+"'>修改</a> <a href='del.jsp?id="+id+"'>删除</a></td></tr>");
	
	}
	
	rs.close();
	
	stmt.close();
	
	con.close();

 %>

</table>
</body>
</html>