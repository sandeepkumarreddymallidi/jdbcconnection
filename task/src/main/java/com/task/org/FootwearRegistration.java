package com.task.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.Date;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.text.ParseException;
import java.text.SimpleDateFormat;

import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;



public class FootwearRegistration extends HttpServlet {
	private static final long serialVersionUID = 1L;
    
    
	protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {

		PrintWriter pw=response.getWriter();
		
		String name=request.getParameter("name");
		String email=request.getParameter("email");
		String password=request.getParameter("password");
		int mobile=Integer.parseInt(request.getParameter("mobile"));
		String gender=request.getParameter("gender");  
	      
		Connection conn=null;
		PreparedStatement ps=null;
		try {
			try {
				Class.forName("com.mysql.cj.jdbc.Driver");
				 conn=DriverManager.getConnection("jdbc:mysql://localhost:3306/motivity","root","root");
			}
			catch(Exception e) {
			e.printStackTrace();
			}

		
			ps=conn.prepareStatement("insert into footwear2 values(?,?,?,?,?)");
			
			ps.setString(1,name);
			ps.setString(2,email);
			ps.setString(3,password);
			ps.setInt(4,mobile);
			ps.setString(5,gender);
			
			ps.executeUpdate();
			
		
			pw.println("<html><body bgcolor='wheat'><h1 align='center'>");
			pw.println("registered successfully");
			pw.println("</h1><body><html>");
		}
		catch(Exception e) {
			e.printStackTrace();
		}

	}

		
	}

