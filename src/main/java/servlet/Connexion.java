package servlet;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import mapping.Utilisateur;
import utilDB.Operations;

public class Connexion extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {

    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        try
        {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Utilisateur utilisateur = Operations.findUtilisateur(email, password);
            HttpSession session = request.getSession();
            session.setAttribute("utilisateur", utilisateur);
            response.getWriter().print("true");    
        }
        catch(Exception ex)
        {
            response.getWriter().print("false");
        }
    }
}
