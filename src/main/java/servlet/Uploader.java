package servlet;

import fonctions.Fonction;
import fonctions.Upload;
import java.io.File;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.nio.file.Paths;
import java.util.Iterator;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.Part;
import mapping.Musique;
import org.apache.commons.fileupload.FileItem;
import org.apache.commons.fileupload.FileItemHeaders;
import org.apache.commons.fileupload.FileUploadException;
import org.apache.commons.fileupload.disk.DiskFileItemFactory;
import org.apache.commons.fileupload.servlet.ServletFileUpload;
import utilDB.Operations;

@MultipartConfig
public class Uploader extends HttpServlet 
{
  
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException
    {
        
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException 
    {        
        String secretPath = getServletContext().getRealPath("/")+"client_secret.json";
        String storePath = getServletContext().getRealPath("/")+"store";
        String tempPath = getServletContext().getRealPath("/")+"store";
        
        int idUtilisateur = -1;
        int idCategorieMusique = -1;
        String titreMusique = "";
        String artisteMusique = "";
        String imageMusique = "";
        String lienId = "";

        DiskFileItemFactory factory = new DiskFileItemFactory();
        factory.setRepository(new File(tempPath));
        
        ServletFileUpload upload = new ServletFileUpload(factory);
        
        try 
        {
            List<FileItem> formItems = upload.parseRequest(request);
            if (formItems != null && formItems.size() > 0)
            {
                for (FileItem item : formItems) 
                {
                    if(item.isFormField())
                    {
                        if(item.getFieldName().equals("userId"))
                        {
                            idUtilisateur = Integer.parseInt(item.getString());
                        }
                        else if(item.getFieldName().equals("nomZik"))
                        {
                            titreMusique = item.getString();
                            Fonction.estVide(titreMusique, "Nom du zik est vide");
                        }
                        else if(item.getFieldName().equals("auteur"))
                        {
                            artisteMusique = item.getString();
                            Fonction.estVide(artisteMusique, "Nom de l'auteur est vide");
                        }
                        else if(item.getFieldName().equals("categorie"))
                        {
                            idCategorieMusique = Integer.parseInt(item.getString());
                        }
                    }
                    else
                    {
                        String fileName = new File(item.getName()).getName();
                        Fonction.finiPar(fileName, ".mp3");
                        String filePath = storePath + File.separator + fileName;
                        File f = new File(filePath);
                        item.write(f);

                        lienId = Upload.doUpload(secretPath, storePath, filePath, fileName);
                        f.delete();
                        
                    }
                }
            }
            Musique musique = new Musique(idUtilisateur, idCategorieMusique, titreMusique, artisteMusique, imageMusique, lienId,true);
            Operations.insererMusique(musique);
            response.getWriter().write("True");
        } 
        catch (FileUploadException ex) 
        {
            Logger.getLogger(Uploader.class.getName()).log(Level.SEVERE, null, ex);
        } 
        catch (Exception ex) 
        {
            response.getWriter().write(ex.getMessage());
        }
        
    }
}
