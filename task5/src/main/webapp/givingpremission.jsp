         
    <%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<% 

    Connection conn=DbConnection.getConnection();
    int eid=Integer.parseInt(request.getParameter("eid"));
    PreparedStatement ps=conn.prepareStatement("update employeeleavetable set status=? where eid=? and status='pending'");
    ps.setString(1,"granted");
    ps.setInt(2,eid);
    int i=ps.executeUpdate();
    if(i!=0)
    {
    	 int nod=(Integer) session.getAttribute("nod");
    	ps=conn.prepareStatement("update remainingleaves set totalday=totalday-? where eid=?");
    	ps.setInt(1,nod);
    	ps.setInt(2, eid);
    	int x=ps.executeUpdate();
    	if(x!=0){
    		response.sendRedirect("./managerhome.html");
    	}
    	
    }%>