/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package utilDB;

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
    
    public OperationsTest() {
    }
    
    @BeforeClass
    public static void setUpClass() {
    }
    
    @AfterClass
    public static void tearDownClass() {
    }
    
    @Before
    public void setUp() {
    }
    
    @After
    public void tearDown() {
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
    @Test
    public void testInsererMusique() throws Exception {
        System.out.println("insererMusique");
        Musique musique = new Musique(1, 1, "testtitre", "testartiste", "testimage", "testlien", true);
        Operations.insererMusique(musique);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

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
        int[] taillecategorie = new int[1];
        taillecategorie[0]=12;
        CategorieMusique[] result = Operations.findCategorie();
        int[] tailleresult=new int[1];
        tailleresult[0]=result.length;
        assertArrayEquals(taillecategorie, tailleresult);
        // TODO review the generated test code and remove the default call to fail.
        //fail("The test case is a prototype.");
    }

    
}
