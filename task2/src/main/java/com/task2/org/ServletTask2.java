package com.task2.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class ServletTask2 extends HttpServlet {
	private static final long serialVersionUID = 1L;
	Connection conn=null;
	PreparedStatement ps=null;
	public void inti(ServletConfig config) {
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/motivity","root","root");
		
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
       
 

	
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		try {
		ps=conn.prepareStatement("insert into task2(name,email) values(?,?)");
		ps.setString(1, name);
		ps.setString(2, email);
		ps.executeUpdate();
		PrintWriter pw=response.getWriter();
		pw.println("<html><body bgcolor='wheat'><h1 align='center'>");
		pw.println("registered successfully");
		pw.println("</h1><body><html>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}
	}
}
