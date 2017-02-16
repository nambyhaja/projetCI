package mapping;

public class CategorieMusique 
{
    private int idCategorieMusique;
    private String nomCategorie;
    
    // Constructeurs
    public CategorieMusique(int idCategorieMusique, String nomCategorie)
    {
        this.setIdCategorieMusique(idCategorieMusique);
        this.setNomCategorie(nomCategorie);
    }
    public CategorieMusique(String nomCategorie)
    {
        this.setNomCategorie(nomCategorie);
    }
    
    // Getters
    public int getIdCategorieMusique()
    {
        return idCategorieMusique;
    }

    public String getNomCategorie()
    {
        return nomCategorie;
    }
    
    // Setters
    public void setIdCategorieMusique(int idCategorieMusique)
    {
        this.idCategorieMusique = idCategorieMusique;
    }

    public void setNomCategorie(String nomCategorie)
    {
        this.nomCategorie = nomCategorie;
    }
    
}
