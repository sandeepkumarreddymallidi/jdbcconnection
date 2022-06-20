<%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<% 
    int eid=Integer.parseInt(request.getParameter("eid"));
    String ename=request.getParameter("ename");
    int total=Integer.parseInt(request.getParameter("etotaldays"));
    Connection conn=DbConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into remainingleaves values(?,?,?)");
	ps.setInt(1,eid);
	ps.setString(2, ename);
	ps.setInt(3,total);
	int i=ps.executeUpdate();
	if(i!=0){
		response.sendRedirect("./managerprofile.jsp");
	}
	%>