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
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapping.CategorieMusique;
import utilDB.Operations;

public class GetCategorieMusique extends HttpServlet 
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
            CategorieMusique[] categories = Operations.findCategorie();
            
            Gson json = new Gson();
            String categ = json.toJson(categories);
            System.out.println(categ);
            response.setContentType("application/json");
            response.getWriter().write(categ);
        }
        catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
}
