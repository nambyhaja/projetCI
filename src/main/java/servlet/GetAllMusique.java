/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package servlet;

import com.google.gson.Gson;
import java.io.IOException;
import java.io.PrintWriter;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapping.Musique;
import utilDB.Operations;

/**
 *
 * @author ITU
 */
public class GetAllMusique extends HttpServlet 
{

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {
        response.setContentType("application/json;charset=UTF-8");
        
        response.addHeader("Access-Control-Allow-Origin", "*");
        response.addHeader("Access-Control-Allow-Methods", "POST, GET");
        response.addHeader("Access-Control-Allow-Headers", "Content-Type, Accept");
        response.addHeader("Access-Control-Max-Age", "86400");
        try 
        {
            Musique[] musiques = Operations.findAllMusique();
            
            Gson json = new Gson();
            String ziks = json.toJson(musiques);
            System.out.println(ziks);
            response.setContentType("application/json");
            response.getWriter().write(ziks);
        }
        catch(Exception ex)
        {
            Logger.getLogger(GetMusique.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
