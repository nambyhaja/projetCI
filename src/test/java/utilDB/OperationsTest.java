/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilDB;

import java.util.logging.Level;
import java.util.logging.Logger;
import mapping.CategorieMusique;
import mapping.Musique;
import mapping.Utilisateur;
import org.junit.After;
import org.junit.AfterClass;
import org.junit.Before;
import org.junit.BeforeClass;
import org.junit.Test;
import static org.junit.Assert.*;

/**
 *
 * @author nambi
 */
public class OperationsTest {
    public static Utilisateur utilisateur;
    public static int tailleutilisateur;
    
    public OperationsTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
        //System.out.println(1);
        try
        {
            utilisateur = new Utilisateur("Rakotobe", "Jean-Pierre", "13-11-86","jean-pierre@gmail.com", "jeanpierre", "Je suis vieux mais j'adore la musique des jeunes");
            tailleutilisateur = Operations.getRows("utilisateur");
            System.out.println("taille utilisateur avant test "+tailleutilisateur);
        }catch(Exception ex)
        {
            ex.printStackTrace();
        }
    }
    
    @AfterClass
    public static void tearDownClass() {
       // System.out.println(4);
        try {
            System.out.println("taille après test "+Operations.getRows("utilisateur"));
            assertEquals(Operations.getRows("utilisateur"), tailleutilisateur+1);
            Operations.deleteUtilisateur(Operations.getMaxId("utilisateur", "idutilisateur"));
            System.out.println("taille après delete dans la base "+Operations.getRows("utilisateur"));
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    @Before
    public void setUp() {
       // System.out.println(2);
        try {
            
            
        } catch (Exception ex) {
            ex.printStackTrace();
        }
    }
    
    @After
    public void tearDown() {
       // System.out.println(3);
        try {
            /*tailleutilisateur = Operations.getRows("utilisateur");
            System.out.println("taille utilisateur après test "+tailleutilisateur);*/
        } catch (Exception ex) {
            ex.printStackTrace();
        }
       
    }

    /**
     * Test of findUtilisateur method, of class Operations.
     */
    @Test
    public void testFindUtilisateur_String() throws Exception {
        System.out.println("findUtilisateur");
        String email = "ranamby7@yahoo.fr";
        Operations.findUtilisateur(email);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of findUtilisateur method, of class Operations.
     */
    
    @Test
    public void testFindUtilisateur_String_String() throws Exception {
        System.out.println("findUtilisateur");
        String email = "nambinintsoa.razafindrafito@gmail.com";
        String motdepasse = "namby";    
        Utilisateur expResult = null;
        Utilisateur result = Operations.findUtilisateur(email, motdepasse);
        assertNotNull( result);
        // TODO review the generated test code and remove the default call to fail.
       //fail("The test case is a prototype.");
    }

    /**
     * Test of insertUtilisateur method, of class Operations.
     */
    
    @Test
    public void testInsertUtilisateur() throws Exception {
        System.out.println("insertUtilisateur");
        Utilisateur utilisateur = new Utilisateur("Rakotobe", "Jean-Pierre", "13-11-86","jean-pierre@gmail.com", "jeanpierre", "Je suis vieux mais j'adore la musique des jeunes");
        int expResult = 0;
        int result = Operations.insertUtilisateur(utilisateur);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    /**
     * Test of findAllMusique method, of class Operations.
     */
    @Test
    public void testFindAllMusique() throws Exception {
        System.out.println("findAllMusique");
        Musique[] expResult = null;
        Musique[] result = Operations.findAllMusique();
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of findMusique method, of class Operations.
     */
    @Test
    public void testFindMusique() throws Exception {
        System.out.println("findMusique");
        int idUtilisateur = 2;
        int[] taillemusique = new int[1];
        taillemusique[0]=10;
        Musique[] result = Operations.findMusique(idUtilisateur);
        int[] tailleresult=new int[1];
        tailleresult[0]=result.length;
        assertArrayEquals(taillemusique, tailleresult);
        // TODO review the generated test code and remove the default call to fail.
     //   fail("The test case is a prototype.");
    }

    /**
     * Test of findMusiquesRecents method, of class Operations.
     */
    @Test
    public void testFindMusiquesRecents() throws Exception {
        System.out.println("findMusiquesRecents");
        Musique[] expResult = null;
        Musique[] result = Operations.findMusiquesRecents();
        //assertArrayEquals(expResult, result);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of findMusiquesTopSemaine method, of class Operations.
     */
    @Test
    public void testFindMusiquesTopSemaine() throws Exception {
        System.out.println("findMusiquesTopSemaine");
        Musique[] expResult = null;
        Musique[] result = Operations.findMusiquesTopSemaine();
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of insererMusique method, of class Operations.
     */
    //@Test
    /*public void testInsererMusique() throws Exception {
        System.out.println("insererMusique");
        Musique musique = new Musique(1, 1, "testtitre", "testartiste", "testimage", "testlien", true);
        Operations.insererMusique(musique);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }*/

    /**
     * Test of findCategorie method, of class Operations.
     */
    @Test
    public void testFindCategorie_int() throws Exception {
        System.out.println("findCategorie");
        int idMusique = 1;
        CategorieMusique expResult = null;
        CategorieMusique result = Operations.findCategorie(idMusique);
        assertNotNull(result);
        // TODO review the generated test code and remove the default call to fail.
       // fail("The test case is a prototype.");
    }

    /**
     * Test of findCategorie method, of class Operations.
     */
    @Test
    public void testFindCategorie_0args() throws Exception {
        System.out.println("findCategorie");
        CategorieMusique[] result = Operations.findCategorie();
        int taillecategorie = 12;
        int tailleresult = result.length;
        assertEquals(taillecategorie, tailleresult);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }
}
