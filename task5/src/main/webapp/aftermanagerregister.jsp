<%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<% 
    String mname=request.getParameter("mname");
    String memail=request.getParameter("memail");
    String mpassword=request.getParameter("mpassword");
    String mphonenumber=request.getParameter("mphonenumber");
    int mage=Integer.parseInt(request.getParameter("mage"));
    String mdept=request.getParameter("mdept");
    String gender=request.getParameter("gender");
	Connection conn=DbConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into manager(mname,memail,mpassword,mphonenumber,mage,mdept,gender) values(?,?,?,?,?,?,?)");
	ps.setString(1,mname);
	ps.setString(2, memail);
	ps.setString(3,mpassword);
	ps.setString(4,mphonenumber);
	ps.setInt(5,mage);
	ps.setString(6,mdept);
	ps.setString(7,gender);
	int i=ps.executeUpdate();
	if(i!=0)
	{
		response.sendRedirect("./managerlogin.html");
	}
	else{
		out.println("hello bye");
	}
%>