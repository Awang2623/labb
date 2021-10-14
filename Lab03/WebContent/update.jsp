<%@ page language="java" import="java.sql.*" contentType="text/html; charset=UTF-8"
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

Connection con=DriverManager.getConnection("jdbc:mysql://localhost:3306/ceshi?&useSSL=false&serverTimezone=UTC","root","password");

  Statement stmt=con.createStatement();

  String id=request.getParameter("id");

  ResultSet rs=stmt.executeQuery("select * from Student where id="+id);

  rs.next();

   %>

   <form action="Update2.jsp" method="post">

   <table align="center" width="50%"  border="1">

   <caption style="font-size: 24px">修改学生信息</caption>

  <tr> 

    <th width="30%" height="50" style="font-size: 24px">学号：</th>

    <td width="70%"><input name="number" type="text" value="<%=rs.getString(2)%>"></td>

  </tr>

  <tr>

    <th height="50" style="font-size: 24px">姓名：</th>

    <td><input name="name" type="text" value="<%=rs.getString(3)%>"></td>

  </tr>

   <tr>

    <th height="50" style="font-size: 24px">性别：</th>

    <td><input name="sex" type="text" value="<%=rs.getString(4)%>"></td>

  </tr>

   <tr>

    <th height="50" style="font-size: 24px">出生日期：</th>

    <td><input name="date" type="text" value="<%=rs.getString(5)%>"></td>

  </tr>

  <tr>

    <th height="50" style="font-size: 24px">地址：</th>

    <td><input name="address" type="text" value="<%=rs.getString(6)%>"></td>

  </tr>

  <tr>

    <th colspan="2">

    <input type="hidden" name="id" value="<%=id%>">

    <input type="submit" value="修改">

    <input type="reset" value="重置">

    </th>

  </tr>

</table>

</form>
<% 
        rs.close();
		stmt.close();
		
		con.close();

%>
</body>
</html>