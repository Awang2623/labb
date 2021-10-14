<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>添加</title>
</head>
<body>
<form action="add.jsp" method="post">
<center>
<table>
    <tr><td>学号:</td> <td> <input type=text name="number" size="18" value="" ></td></tr>
    <tr><td>姓名:</td> <td><input type=text name="name" size="18" value="" ></td></tr>
    <tr><td>性别:</td> <td><input type=text name="sex" size="18" value="" ></td></tr>
    <tr><td>出生日期:</td> <td> <input type=text name="date" size="18" value="" ></td></tr>
    <tr><td>住址:</td> <td> <input type=text name="address" size="18" value="" ></td></tr>
    </table>
      <input type=submit name="submit" value="添加" onclick="return check(this.form)">   
</center>
</form>
<%

	request.setCharacterEncoding("UTF-8");
	response.setContentType("text/html;charset=UTF-8");
	
	String submit=request.getParameter("submit");
	
	if(submit!=null&&!submit.equals(""))

	{
	
		String  number=request.getParameter("number");
		
		String  name=request.getParameter("name");
		
		String  sex=request.getParameter("sex");
		
		String  date=request.getParameter("date");
		
		String  address=request.getParameter("address");
		
		Class.forName("com.mysql.cj.jdbc.Driver");
		
		Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab03?&useSSL=false&serverTimezone=UTC","root","password");
		
		Statement stmt=con.createStatement();
		
		String sql="insert into Student(number,name,sex,date,address) values('"+number+"','"+name+"','"+sex+"','"+date+"','"+address+"')";
		
		int i=stmt.executeUpdate(sql);

	if(i==1)
	
	{
	
		out.println("<script language='javaScript'> alert('添加成功,点击确定跳转到主页!');</script>");
		
		response.setHeader("refresh","1;url=index.jsp");
	
	}

	else{
	
	out.println("<script language='javaScript'> alert('添加失败，点击确定返回添加页面！');</script>");
	
	response.setHeader("refresh","1;url=add.jsp");
	
	}

		stmt.close();
		
		con.close();
	
	}

%>
</body>
</html>