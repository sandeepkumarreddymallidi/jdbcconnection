            
    <%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<% 
    String eemail=request.getParameter("eemail");
    String epassword=request.getParameter("epassword");
    Connection conn=DbConnection.getConnection();
    PreparedStatement ps=conn.prepareStatement("select *from employee where eemail=? and epassword=?");
	ps.setString(1, eemail);
	ps.setString(2, epassword);
	ResultSet i=ps.executeQuery();
	HttpSession hs=request.getSession();
	if(i.next()) {
		hs.setAttribute("eid", i.getInt(1));
		hs.setAttribute("eemail", i.getString("eemail"));
		hs.setAttribute("ename", i.getString("ename"));
		response.sendRedirect("employeeprofile.html");
	}
	%>
    