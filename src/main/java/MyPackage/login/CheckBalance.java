package MyPackage.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class CheckBalance {
       private String pin;
       
       public CheckBalance(String pin)
       {
    	   this.pin = pin;
       }
       
       public double getBalance()
       {
    	   sendMail e = new sendMail();
    	   String email = e.setMail();
    	   Connect connect = new Connect();
           String query = "select*from account where email=? and security_pin = ?;";
    	   
    	   try
    	   {
    		   Connection con = connect.getConnection();
   	           PreparedStatement p = con.prepareStatement(query);
   	           p.setString(1, email);
   	           p.setString(2, pin);
   	           ResultSet r = p.executeQuery();
   	           if(r.next())
   	           {
   	        	   double balance = r.getDouble("balance");
   	        	   return balance;
   	           }
    	   }
    	   catch(SQLException e1)
    	   {
    		   System.out.println(e1.getMessage());
    	   }
    	   return -1;
       }
}
