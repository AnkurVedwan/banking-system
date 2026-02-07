package MyPackage.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class login{
      private String email,pass;
      
      public login(String email,String pass)
      {
    	  this.pass = pass;
    	  this.email = email;
      }
      
      public int isValid()
      {
    	  sendMail send = new sendMail();
    	  send.getMail(email);
    	  
    	  Connect connect = new Connect();
    	  String query = "select * from users where email = ? and password=?;";
    	  String query2 = "select * from account where email = ?;";
    	  
    	  try
    	  {
    		  Connection con = connect.getConnection(); 
    		  PreparedStatement p = con.prepareStatement(query);
    		  p.setString(1, email);
    		  p.setString(2, pass);
    		  ResultSet r = p.executeQuery();
    		  if(r.next())
    		  {
    			  PreparedStatement p2 = con.prepareStatement(query2);
    			  p2.setString(1, email);
    			  ResultSet r2 = p2.executeQuery();
    			  if(r2.next())
    			  {
    				  return 2;
    			  }
    			  else {
    				  return 1;
    			  }
    		  }
    	  }
    	  catch(SQLException e)
    	  {
    		  System.out.println(e.getMessage());
    	  }
    	  return 0;
      }
}
