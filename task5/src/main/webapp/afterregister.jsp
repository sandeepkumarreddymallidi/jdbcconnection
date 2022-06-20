<%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<% 
    String ename=request.getParameter("ename");
    String eemail=request.getParameter("eemail");
    String epassword=request.getParameter("epassword");
    String ephonenumber=request.getParameter("ephonenumber");
    int eage=Integer.parseInt(request.getParameter("eage"));
    String edept=request.getParameter("edept");
    String gender=request.getParameter("gender");
	Connection conn=DbConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into employee(ename,eemail,epassword,ephonenumber,eage,edept,gender) values(?,?,?,?,?,?,?)");
	ps.setString(1,ename);
	ps.setString(2, eemail);
	ps.setString(3,epassword);
	ps.setString(4,ephonenumber);
	ps.setInt(5,eage);
	ps.setString(6,edept);
	ps.setString(7,gender);
	int i=ps.executeUpdate();
	if(i!=0)
	{
		response.sendRedirect("./employeelogin.html");
	}
	else{
		out.println("hello bye");
	}
	
	
	
%>

