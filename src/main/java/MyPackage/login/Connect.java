package MyPackage.login;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class Connect {
       private String url="jdbc:mysql://localhost:3306/bank_db",username="root",password="ankur";
       
       public Connection getConnection() throws SQLException
       {
    	   try
    	   {
    		   Class.forName("com.mysql.jdbc.Driver");
    	   }
    	   catch(ClassNotFoundException e)
    	   {
    		   System.out.println(e.getMessage());
    	   }
    	   
    	   Connection con = DriverManager.getConnection(url,username,password);
    	   return con;
       }
}
