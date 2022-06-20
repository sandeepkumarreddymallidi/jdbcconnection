            
    <%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<% 
    String memail=request.getParameter("memail");
    String mpassword=request.getParameter("mpassword");
    Connection conn=DbConnection.getConnection();
    PreparedStatement ps=conn.prepareStatement("select *from manager where memail=? and mpassword=?");
	ps.setString(1, memail);
	ps.setString(2, mpassword);
	ResultSet i=ps.executeQuery();
	HttpSession hs=request.getSession();
	if(i.next()) {
		hs.setAttribute("mid", i.getInt(1));
		hs.setAttribute("memail", i.getString("memail"));
		hs.setAttribute("mname", i.getString("mname"));
		response.sendRedirect("managerhome.html");
	}
	%>
    