<%@page import="java.sql.* "%>
<%@page import="com.task5.org.*" %>
<html>
    <head>
        <title>home</title>
    </head>
    <style>
        h1 {
            width:100%;
            height: 50px;
            background-color: black;
            color: white;
            text-align: center;
            justify-content: center;
        }
        ul{
            list-style: none;
            margin-left: 70px;
        }
        li{
            margin-top: 20px;
            font-size: 20px;
            text-align: center;
            width: 150px;
            border: 2px solid darkcyan;
            height: 50px;
            padding-top: 10px;
            border-radius: 15px;
        }
        ul li:hover{
            cursor: hand;
            background-color: blue;
            color: white;
        }
        #iframes{
            display: grid;
            grid-template-columns: 3fr 9fr;
        }
        #leftiframe{
            align-content: center;
        }
        a{
            list-style: none;
        }
    </style>
    <body bgcolor="wheat">
        <h1>view leaves</h1>
        <div id="iframes">
            <div id ="leftiframe">
                <ul>
                  <li><a href="#"> home</a></li>
                    <li><a href="managerprofile.jsp">manager profile</a></li>
                    <li><a href="totalemployees.html">view employee</a></li>
                    <li><a href="viewleaves.jsp">view leaves</a></li>
                    <li><a href="employeeremainingleaves.jsp">remaining leaves</a></li>
                    <li><a href="managerlogin.html">logout</a></li>
                </ul>
            </div>
    </div>

<table border="2" width="400" height="200" cellpadding="20" align="center">
<tr><td>id</td><td>name</td><td>email</td><td>mobile</td><td>age</td><td>department</td><td>reason</td><td>no of days</td><td>from</td><td>to</td><td>status</td></tr>
<%
Connection con=DbConnection.getConnection();
PreparedStatement ps=con.prepareStatement("select * from employeeleavetable");
ResultSet rs=ps.executeQuery();
HttpSession hs=request.getSession();
  while(rs.next())
 {
	  hs.setAttribute("nod", rs.getInt("nod"));
	  %>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td>
<td><%=rs.getString(3) %></td><td><%=rs.getString(4) %></td>
<td><%=rs.getInt(5) %></td><td><%=rs.getString(6) %></td>
<td><%=rs.getString(7) %></td><td><%=rs.getInt(8) %></td>
<td><%=rs.getString(9) %></td><td><%=rs.getString(10) %></td>
<td><%=rs.getString(11) %></td>
<td><a href="givingpremission.jsp?eid=<%=rs.getInt(1)%>">click here</a></td></tr>
<% 
}

%>
</table>

</body>
</html>