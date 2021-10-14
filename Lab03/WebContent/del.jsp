<%@ page language="java"  import="java.sql.*" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>删除</title>
</head>
<body>
<%

request.setCharacterEncoding("UTF-8");
response.setContentType("text/html;charset=UTF-8");
 int id = Integer.valueOf(request.getParameter("id"));
  Class.forName("com.mysql.cj.jdbc.Driver");

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/lab03?&useSSL=false&serverTimezone=UTC","root","password");

    PreparedStatement ps=null;
	String sql="delete from Student where id=?";
	ps=con.prepareStatement(sql);
	ps.setInt(1,id);
	int i=ps.executeUpdate();

 if(i>0)

 {

	out.println("<script language='javaScript'> alert('删除成功,点击确定跳转到主页!');</script>");
	
	response.setHeader("refresh","1;url=index.jsp");

}

else{

	out.println("<script language='javaScript'> alert('删除失败，点击确定返回修改页面！');</script>");
	
	response.setHeader("refresh","1;url=del.jsp");

}
	  ps.close();
	  con.close();

   %>

</body>
</html>