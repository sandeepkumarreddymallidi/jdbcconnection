package com.task4.org;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
@WebServlet("/Task4")
public class Task4 extends HttpServlet {
	
       Connection conn=null;
       PreparedStatement ps=null;
       public void init(ServletConfig config)
       {
    	   try {
			conn=DbConnection.getConnection();
		} catch (ClassNotFoundException | SQLException e) {
			// TODO Auto-generated catch block
			e.printStackTrace();
		}
       }
   

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		
		try {
		ps=conn.prepareStatement("select *from task3 where email=? and password=?");
		ps.setString(1, email);
		ps.setString(2, password);
		HttpSession hs=request.getSession();
	
		ResultSet i=ps.executeQuery();
		if(i.next()) {
			hs.setAttribute("eid", i.getInt(1));
			hs.setAttribute("email", i.getString("email"));
			hs.setAttribute("mobile", i.getInt("mobile"));
			response.sendRedirect("userprofile.jsp");
		
		}
		else {
			response.sendRedirect("./userregistration.html");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}

}


