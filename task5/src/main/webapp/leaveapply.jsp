<%@ page import="java.sql.*" %>
<%@ page import="com.task5.org.*"%>
<%  
    int eid=Integer.parseInt(request.getParameter("eid"));
    String ename=request.getParameter("ename");
    String eemail=request.getParameter("eemail");
    String ephonenumber=request.getParameter("ephonenumber");
    int eage=Integer.parseInt(request.getParameter("eage"));
    String edept=request.getParameter("edept");
    String ereason=request.getParameter("ereason");
    int nod=Integer.parseInt(request.getParameter("nod"));
    String eform=request.getParameter("eform");
    String eto=request.getParameter("eto");
    String estatus=request.getParameter("estatus");
	Connection conn=DbConnection.getConnection();
	PreparedStatement ps=conn.prepareStatement("insert into employeeleavetable values(?,?,?,?,?,?,?,?,?,?,?)");
	ps.setInt(1,eid);
	ps.setString(2,ename);
	ps.setString(3, eemail);
	ps.setString(4,ephonenumber);
	ps.setInt(5,eage);
	ps.setString(6,edept);
	ps.setString(7,ereason);
	ps.setInt(8,nod);
	ps.setString(9,eform);
	ps.setString(10,eto);
	ps.setString(11,estatus);
	int i=ps.executeUpdate();
	if(i!=0)
	{
		response.sendRedirect("./employeeprofile.html");
			}
	else{
		out.println("hello bye");
	}
	
	
	
%>