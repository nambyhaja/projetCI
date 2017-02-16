/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package fonctions;

import com.google.gson.Gson;
import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.CategorieMusique;
import mapping.Musique;
import servlet.GetMusique;
import utilDB.Operations;

/**
 *
 * @author Ratefinjanahary
 */
public class TEST 
{
    public static void main(String[] args)
    {
        try 
        {
            CategorieMusique[] categories = Operations.findCategorie();
            
            Gson json = new Gson();
            String categ = json.toJson(categories);
            System.out.println(categ);
        } 
        catch (Exception ex)
        {
            Logger.getLogger(GetMusique.class.getName()).log(Level.SEVERE, null, ex);
        }
    }
}
