import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
@WebServlet("/P4")
public class P4 extends HttpServlet
{
	private static final long serialVersionUID=1L;
	public P4()
	{
		super();
	}
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException
	{
		Cookie fName = new Cookie("first_name",request.getParameter("f_name"));
		Cookie lName = new Cookie("last_name",request.getParameter("l_name"));
		fName.setMaxAge(60*60);
		lName.setMaxAge(60*60);
		response.addCookie(fName);
		response.addCookie(lName);
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		out.println("<b>First Name: </b> "+request.getParameter("f_name")+"<br><b>Last Name: </b> "+request.getParameter("l_name")+"\n");
	}
}



import java.io.IOException;
import java.io.PrintWriter;

import jakarta.servlet.ServletException;
import jakarta.servlet.annotation.WebServlet;
import jakarta.servlet.http.Cookie;
import jakarta.servlet.http.HttpServlet;
@WebServlet("/P4b")
public class P4b extends HttpServlet
{
	private static final long serialVersionUID=1L;
	public P4b()
	{
		super();
	}
	protected void doPost(jakarta.servlet.http.HttpServletRequest request, jakarta.servlet.http.HttpServletResponse response) throws ServletException, IOException
	{
		Cookie cookie = null;
		Cookie[] cookies = null;
		cookies = request.getCookies();
		response.setContentType("text/html");
		PrintWriter out = response.getWriter();
		if(cookies!=null)
		{
			out.println("<h2>Found Cookies Name and Value:</h2>");
			for(int i=0;i<cookies.length;i++)
			{
				cookie=cookies[i];
				out.println("Name: "+cookie.getName()+", ");
				out.println("Value: "+cookie.getValue()+"<br>");
			}
		}
		else
		{
			out.println("<h2>No Cookie Exist</h2>");
		}
	}
}
