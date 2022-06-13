package jdconnection;

import java.sql.Connection;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.sql.Statement;

public class PrepareStatementExample {
public static void main(String[] args) throws ClassNotFoundException, SQLException {
		
		ConnectionsExample conn=new ConnectionsExample();
		Connection connection=conn.getConnection();
		Statement st=connection.createStatement();
		ResultSet rs=st.executeQuery("select *from footwear");
		while(rs.next()) {
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getFloat(3)+" "+rs.getFloat(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7));
		}
		System.out.println("value inserted "+st.executeUpdate("insert into footwear values(103,'bata',9,3400,'grey','boots','england')"));
		System.out.println("country updated "+st.executeUpdate("update footwear set fcountry='usa' where fid=102"));
		System.out.println("deleted data "+st.executeUpdate("delete from footwear  where fcost=3500"));
		rs=st.executeQuery("select *from footwear");
		while(rs.next()) {
			System.out.println(rs.getInt(1)+" "+rs.getString(2)+" "+rs.getFloat(3)+" "+rs.getFloat(4)+" "+rs.getString(5)+" "+rs.getString(6)+" "+rs.getString(7));
		}
	}
}
