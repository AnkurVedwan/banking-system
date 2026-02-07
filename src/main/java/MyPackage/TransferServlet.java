package MyPackage;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

import MyPackage.login.Transaction;

@WebServlet("/TransferServlet")
public class TransferServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public TransferServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String acNo = request.getParameter("acNo");
		String amount = request.getParameter("amount");
		String pin = request.getParameter("pin");
		
		int accNo = Integer.parseInt(acNo);
		
		Transaction trans = new Transaction(amount, pin);
		
		if(trans.TransferMoney(accNo))
		{
			response.sendRedirect("main.jsp?success=1");
		}
		else
		{
			response.sendRedirect("main.jsp?success=err");
		}
		
	}

}
