package com.task4.org;

import java.io.IOException;
import java.io.PrintWriter;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.SQLException;

import javax.servlet.ServletConfig;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class UserRegister extends HttpServlet {
	
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
		int i=ps.executeUpdate();
		if(i!=0) {
		response.sendRedirect("./userlogin.html");
		}
		else {
		response.sendRedirect("./home.html");
		}
		}
		catch(Exception e) {
			e.printStackTrace();
		}
		
	}



}
