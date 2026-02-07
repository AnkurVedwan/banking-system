package MyPackage.login;

import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;

public class Transaction {
       private String amount,pin;
       private sendMail e = new sendMail();
       private String email = e.setMail();
       private Connect connect =  new Connect();
       
       public Transaction(String amount,String pin)
       {
    	   this.amount = amount;
    	   this.pin = pin;
       }
       
       public double checkBalance()
       {
    	   String query = "select*from account where email=?;";
    	   
    	   try
    	   {
    		   Connection con = connect.getConnection();
   	           PreparedStatement p = con.prepareStatement(query);
   	           p.setString(1, email);
   	           ResultSet r = p.executeQuery();
   	           if(r.next())
   	           {
   	        	   double balance = r.getDouble("balance");
   	        	   return balance;
   	           }
    	   }
    	   catch(SQLException e)
    	   {
    		   System.out.println(e.getMessage());
    	   }
    	   return 0;
       }
       
       public int DebitMoney()
       {
    	     Double balance = Double.parseDouble(amount);
    	     double checkAmount = checkBalance();
    	     
    	     if(checkAmount<balance)
    	     {
    	    	 return -1;
    	     }
    	     String query = "update account set balance = balance-? where email=? and security_pin=?;";
    	     
    	     try
    	     {
    	    	Connection con = connect.getConnection();
    	    	PreparedStatement p = con.prepareStatement(query);
    	    	p.setDouble(1, balance);
    	    	p.setString(2, email);
    	    	p.setString(3, pin);
    	    	int row = p.executeUpdate();
    	    	if(row>0)
    	    	{
    	    		return 1;
    	    	}
    	     }
    	     catch(SQLException e)
    	     {
    	    	 System.out.println(e.getMessage());
    	     }
    	     return 0;
       }
       
       public boolean CreditMoney()
       {
    	   Double balance = Double.parseDouble(amount);
    	   String query = "update account set balance = balance+? where email=? and security_pin=?;";
    	   
    	   try
    	   {
    		   Connection con = connect.getConnection();
    		   PreparedStatement p = con.prepareStatement(query);
    		   p.setDouble(1, balance);
    		   p.setString(2, email);
    		   p.setString(3, pin);
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
       
       public boolean TransferMoney(int AccNo)
       {
    	   Double balance = Double.parseDouble(amount);
    	   String query1 = "update account set balance = balance-? where email=? and security_pin=?;";
    	   String query2 = "update account set balance = balance+? where account_number = ?;";
    	   
    	   try
    	   {
    		   Connection con = connect.getConnection();
    		   con.setAutoCommit(false);
    		   PreparedStatement p1 = con.prepareStatement(query1);
    		   PreparedStatement p2 = con.prepareStatement(query2);
    		   p1.setDouble(1, balance);
    		   p1.setString(2, email);
    		   p1.setString(3, pin);
    		   p2.setDouble(1, balance);
    		   p2.setInt(2, AccNo);
    		   int row1 = p1.executeUpdate();
    		   int row2 = p2.executeUpdate();
    		   if(row1>0 && row2>0)
    		   {
    			   con.commit();
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
