package MyPackage.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

@WebServlet("/BalanceServlet")
public class BalanceServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
  
    public BalanceServlet() {
        super();
        // TODO Auto-generated constructor stub
    }
    
	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String pin = request.getParameter("pin");
		
		CheckBalance amount = new CheckBalance(pin);
		
		double balance = amount.getBalance();
		
		if(balance!=-1)
		{
			response.sendRedirect("main.jsp?success=balance&amt="+balance);
		}
		else
		{
			response.sendRedirect("main.jsp?success=0");
		}
	}

}
