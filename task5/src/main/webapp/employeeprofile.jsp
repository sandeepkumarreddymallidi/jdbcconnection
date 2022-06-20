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
        <h1>employee profile</h1>
        <div id="iframes">
            <div id ="leftiframe">
                <ul>
                    <li><a href="#"> home</a></li>
                    <li><a href="employeeprofile.jsp">employee profile</a></li>
                    <li><a href="applyforleave.html">apply for leave</a></li>
                    <li><a href="#">leave status</a></li>
                    <li>remaining leaves</li>
                    <li><a href="./emmployeelogin.jsp">logout</a></li>
                </ul>
            </div>
    </div>

<table border="2" width="400" height="200" cellpadding="20" align="center">
<tr><td>id</td><td>name</td><td>email</td><td>mobile</td><td>age</td><td>department</td><td>gender</td></tr>
<%
Connection con=DbConnection.getConnection();
int id=(Integer) session.getAttribute("eid");
PreparedStatement ps=con.prepareStatement("select * from employee where eid=?");
ps.setInt(1,id);
ResultSet rs=ps.executeQuery();
while(rs.next())
{%>
<tr><td><%=rs.getInt(1) %></td><td><%=rs.getString(2) %></td><td><%=rs.getString(3) %></td><td><%=rs.getString(5) %></td><td><%=rs.getInt(6) %></td><td><%=rs.getString(7) %><td><%=rs.getString(8) %></td></tr>
<% }

%>
</table>

</body>
</html>