package servlet;

import exception.UtilisateurException;
import java.io.IOException;
import java.io.PrintWriter;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import mapping.Utilisateur;
import utilDB.Operations;
import java.util.regex.*;

public class Inscription extends HttpServlet 
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
            String nom = request.getParameter("nom");
            String prenoms = request.getParameter("prenoms");
            String dateNaissance = request.getParameter("datenaissance");
            String email = request.getParameter("email");
            String mdp = request.getParameter("mdp");
            String cmdp = request.getParameter("cmdp");
            String description = request.getParameter("description");
            
            String mdpRegex = "^(?=.*[0-9])(?=.*[a-z])(?=.*[A-Z])(?=.*[@#$%^&+=]).{8,}$";
            
            String emailRegex = "^[a-zA-Z0-9._-]+@[a-z0-9._-]{4,}\\.[a-z]{2,4}$";
            
            Operations.findUtilisateur(email);
            if(nom=="" || prenoms=="" || email=="" || mdp=="" || cmdp=="" || dateNaissance=="" || description=="")
            {
                response.getWriter().write("Veuillez remplir les champs vides'");
            }
            else if(!email.matches(emailRegex))
            {
                response.getWriter().write("L'email n'est pas valide");
            }
            else if(!mdp.matches(mdpRegex))
            {
                response.getWriter().write("Le mot de passe doit au moins contenir un chiffre, une majuscule et un caractere special et doit faire au moins 8 caracteres");
            }
            else if(!mdp.equals(cmdp))
            {
                response.getWriter().write("Les mots de passes ne sont pas identiques");
            }
            else
            {
                Utilisateur nouveau = new Utilisateur(nom, prenoms, dateNaissance, email, mdp, description);
                Operations.insertUtilisateur(nouveau);
                response.getWriter().write("True");
            }
        }
        catch(UtilisateurException ex)
        {
            response.getWriter().write(ex.getMessage());
        } 
        catch (ClassNotFoundException | SQLException ex) 
        {
            Logger.getLogger(Inscription.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (Exception ex) 
        {
            response.getWriter().write("Erreur d'insertion a la base de données");
        } 
        
        
    }
}
