package MyPackage.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.SQLException;

public class Register {
       private String name,email,pass;
       
       public Register(String name,String email,String pass)
       {
    	   this.email = email;
    	   this.name = name;
    	   this.pass = pass;
       }
       
       public boolean isDone()
       {
    	   Connect connect = new Connect();
    	   
    	   String query = "insert into users (full_name,email,password) values (?,?,?);";
    	   
    	   try
    	   {
    		   Connection con = connect.getConnection();
    		   PreparedStatement p = con.prepareStatement(query);
    		   p.setString(1, name);
    		   p.setString(2, email);
    		   p.setString(3, pass);
    		   int row = p.executeUpdate();
    		   if(row>0)
    		   {
    			   return true;
    		   }
    	   }
    	   catch(SQLException e)
    	   {
    		   System.out.println(e.getMessage());
    	   }
    	   return false;
       }
}
