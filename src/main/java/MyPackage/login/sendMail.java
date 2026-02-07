package MyPackage.login;

public class sendMail {
	private static String email;
      
	public void getMail(String email)
	{ 
		this.email = email;
	}
	
	public String setMail()
	{
		return email;
	}
}
