
<!DOCTYPE html>
<html>

<body bgcolor="wheat">
<h1>userprofile</h1>
<h2 align ="center" >
<a href="home.html">home</a>
<a href="#">products</a>
<a href="userprofile.jsp">profile</a>
<a href="#">booking</a>

</h2>
<br>
<br>

<%@page import="java.sql.* "%>
<%@page import="com.task4.org.*" %>
<table border="2" width="400" height="200" cellpadding="20" align="center">
<tr><td>id</td><td>name</td><td>email</td><td>mobile</td><td>gender</td><td>address</td></tr>
<%
Connection con=DbConnection.getConnection();
int id=(Integer) session.getAttribute("eid");
PreparedStatement ps=con.prepareStatement("select * from task3 where eid=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getInt(5) %></td><td><%=rs.getString(6) %></td><td><%=rs.getString(7) %></td></tr>
<% }

%>
</table>

</body>
</html>

