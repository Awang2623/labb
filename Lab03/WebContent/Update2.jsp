<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>修改</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");

  Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab03?&useSSL=false&serverTimezone=UTC","root","password");

  PreparedStatement ps=null;

   String id=request.getParameter("id");
   String  number=request.getParameter("number");
	
	String  name=request.getParameter("name");
	
	String  sex=request.getParameter("sex");
	
	String  date=request.getParameter("date");
	
	String  address=request.getParameter("address");
	
	String sql1="update Student set number=?,name=?,sex=?,date=?,address=? where id=?";
	ps=con.prepareStatement(sql1);
	ps.setString(1, number);
	ps.setString(2, name);
	ps.setString(3,sex);
	ps.setString(4,date);
	ps.setString(5,address);
	ps.setString(6,id);
	int i=ps.executeUpdate();

 if(i>0)

 {

	out.println("<script language='javaScript'> alert('修改成功,点击确定跳转到主页!');</script>");
	
	response.setHeader("refresh","1;url=index.jsp");

}

else{

out.println("<script language='javaScript'> alert('修改失败，点击确定返回修改页面！');</script>");

response.setHeader("refresh","1;url=update.jsp");

}
  ps.close();
	
	con.close();

   %>

</body>
</html>