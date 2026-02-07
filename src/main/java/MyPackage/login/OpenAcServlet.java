package MyPackage.login;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.HttpServlet;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.HttpServletResponse;
import java.io.IOException;

/**
 * Servlet implementation class OpenAcServlet
 */
@WebServlet("/OpenAcServlet")
public class OpenAcServlet extends HttpServlet {
	private static final long serialVersionUID = 1L;
       
    public OpenAcServlet() {
        super();
        // TODO Auto-generated constructor stub
    }

	protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
		String name = request.getParameter("name");
		String amount = request.getParameter("amount");
		String pin = request.getParameter("pin");
		
		Account acc = new Account(name,amount,pin);
		
		int acNumber = acc.addUser();
		
		if(acNumber!=0)
		{
			response.sendRedirect("main.jsp?success=opened&acNumber="+acNumber);
		}
		else
		{
			response.sendRedirect("option.jsp?err=1");
		}
	}

}
