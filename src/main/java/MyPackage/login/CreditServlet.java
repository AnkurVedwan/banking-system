package MyPackage.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class CreditServlet
 */
@WebServlet("/CreditServlet")
public class CreditServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public CreditServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String amount = request.getParameter("amount");
		String pin = request.getParameter("pin");
		
		Transaction trans = new Transaction(amount, pin);
		
		if(trans.CreditMoney())
		{
			response.sendRedirect("main.jsp?success=1");
		}
		else
		{
			response.sendRedirect("main.jsp?success=0");
		}
	}

}
