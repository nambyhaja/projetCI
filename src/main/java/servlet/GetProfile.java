/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapping.Utilisateur;
import utilDB.Operations;

/**
 *
 * @author ITU
 */
public class GetProfile extends HttpServlet
{
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        PrintWriter out = response.getWriter();
        response.setContentType("application/json;charset=UTF-8");
        
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Methods", "GET");
        response.addHeader("Access-Control-Allow-Headers", "Content-Type, Accept");
        response.addHeader("Access-Control-Max-Age", "86400");
        try 
        {
            String email = request.getParameter("email");
            String password = request.getParameter("password");
            Utilisateur utilisateur = Operations.findUtilisateur(email, password);
            
            Gson json = new Gson();
            String user = json.toJson(utilisateur);
            out.print(user);
        }
        catch(Exception ex)
        {
            String erreur = "-1";
            out.print(erreur);
        }
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
    }

}
