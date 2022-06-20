package com.task3.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
@WebServlet("/Task3")
public class Task3 extends HttpServlet {
	
       Connection conn=null;
       PreparedStatement ps=null;
   

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		try {
	    	   Class.forName("com.mysql.cj.jdbc.Driver");
				conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/motivity","root","root");
	       }
	       catch(Exception e){
	    	   e.printStackTrace();
	       }
		String ename=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		long mobile=Integer.parseInt(request.getParameter("mobile"));
		String gender=request.getParameter("gender");
		String address=request.getParameter("address");
		
		try {
		ps=conn.prepareStatement("insert into task3(ename,email,password,mobile,gender,address) values(?,?,?,?,?,?)");
		ps.setString(1, ename);
		ps.setString(2, email);
		ps.setString(3, password);
		ps.setLong(4, mobile);
		ps.setString(5, gender);
		ps.setString(6, address);
		ps.executeUpdate();
		PrintWriter pw=response.getWriter();
		pw.println("<html><body bgcolor='wheat'><h1 align='center'>");
		pw.println("registered successfully");
		pw.println("</h1></body></html>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		try {
			conn.close();
			}
			catch(Exception e) {
				e.printStackTrace();
			}
		
	}



}
