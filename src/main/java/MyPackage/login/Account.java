package MyPackage.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Account {
      private String name,amount,pin;
      private sendMail e = new sendMail();
      private String email = e.setMail();
      
      public Account(String name,String amount,String pin)
      {
    	  this.amount = amount;
    	  this.pin = pin;
    	  this.name = name;
      }
      
      public int addUser()
      {
    	  double balance = Double.parseDouble(amount);
    	  String query = "insert into account (full_name,email,balance,security_pin) values (?,?,?,?);";
    	  Connect connect = new Connect();
    	  
    	  try
    	  {
    		  Connection con = connect.getConnection();
    		  PreparedStatement p = con.prepareStatement(query);
    		  p.setString(1, name);
    		  p.setString(2, email);
    		  p.setDouble(3, balance);
    		  p.setString(4, pin);
    		  int row = p.executeUpdate();
    		  if(row>0)
    		  {
    			  String query2 = "select * from account where email = ?;";
    			  PreparedStatement p2 = con.prepareStatement(query2);
    			  p2.setString(1, email);
    			  ResultSet r = p2.executeQuery();
    			  if(r.next())
    			  {
    				  int acc = r.getInt("account_number");
    				  return acc;
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
