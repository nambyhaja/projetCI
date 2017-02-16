package mapping;

import exception.UtilisateurException;
import fonctions.Fonction;
import java.sql.Date;

public class Utilisateur
{
    private int idUtilisateur;
    private String nomUtilisateur;
    private String prenomsUtilisateur;
    private Date dateNaissance;
    private String email;
    private String motdepasse;
    private String description;
    
    // Constructeurs
    public Utilisateur(int idUtilisateur, String nomUtilisateur, String prenomsUtilisateur, Date dateNaissance, String email, String motdepasse, String description)
    {
        this.setIdUtilisateur(idUtilisateur);
        this.setNomUtilisateur(nomUtilisateur);
        this.setPrenomsUtilisateur(prenomsUtilisateur);
        this.setDateNaissance(dateNaissance);
        this.setEmail(email);
        this.setMotdepasse(motdepasse);
        this.setDescription(description);
    }
    public Utilisateur(String nomUtilisateur, String prenomsUtilisateur, String dateNaissance, String email, String motdepasse, String description) throws UtilisateurException
    {
        this.setNomUtilisateur(nomUtilisateur);
        this.setPrenomsUtilisateur(prenomsUtilisateur);
        this.setDateNaissance(dateNaissance);
        this.setEmail(email);
        this.setMotdepasse(motdepasse);
        this.setDescription(description);
    }
    
    // Getters
    public int getIdUtilisateur()
    {
        return idUtilisateur;
    }

    public String getNomUtilisateur()
    {
        return nomUtilisateur;
    }

    public String getPrenomsUtilisateur()
    {
        return prenomsUtilisateur;
    }

    public Date getDateNaissance()
    {
        return dateNaissance;
    }

    public String getEmail()
    {
        return email;
    }

    public String getMotdepasse()
    {
        return motdepasse;
    }

    public String getDescription()
    {
        return description;
    }
    
    // Setters
    public void setIdUtilisateur(int idUtilisateur)
    {
        this.idUtilisateur = idUtilisateur;
    }

    public void setNomUtilisateur(String nomUtilisateur)
    {
        this.nomUtilisateur = nomUtilisateur;
    }

    public void setPrenomsUtilisateur(String prenomsUtilisateur)
    {
        this.prenomsUtilisateur = prenomsUtilisateur;
    }

    public void setDateNaissance(Date dateNaissance)
    {
        this.dateNaissance = dateNaissance;
    }
    public void setDateNaissance(String dateNaissance) throws UtilisateurException
    {
        try
        {
            this.dateNaissance = Fonction.getSqlDate(dateNaissance);
        }
        catch(Exception ex)
        {
            throw new UtilisateurException("Date de naissance invalide");
        }
    }
    
    public void setEmail(String email)
    {
        this.email = email;
    }

    public void setMotdepasse(String motdepasse)
    {
        this.motdepasse = motdepasse;
    }

    public void setDescription(String description)
    {
        this.description = description;
    }  
}
