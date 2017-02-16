package fonctions;

import com.google.api.client.auth.oauth2.Credential;
import com.google.api.client.extensions.java6.auth.oauth2.AuthorizationCodeInstalledApp;
import com.google.api.client.extensions.jetty.auth.oauth2.LocalServerReceiver;
import com.google.api.client.googleapis.auth.oauth2.GoogleAuthorizationCodeFlow;
import com.google.api.client.googleapis.auth.oauth2.GoogleClientSecrets;
import com.google.api.client.googleapis.javanet.GoogleNetHttpTransport;
import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.http.FileContent;
import com.google.api.client.http.HttpTransport;
import com.google.api.client.json.jackson2.JacksonFactory;
import com.google.api.client.json.JsonFactory;
import com.google.api.client.util.store.FileDataStoreFactory;

import com.google.api.services.drive.DriveScopes;
import com.google.api.services.drive.model.*;
import com.google.api.services.drive.Drive;
import java.io.FileInputStream;

import java.io.IOException;
import java.io.InputStream;
import java.io.InputStreamReader;
import java.util.Arrays;
import java.util.List;

public class Upload
{
        /** Application name. */
    private static final String APPLICATION_NAME =
        "Upload";

    /** Directory to store user credentials for this application. */
    
    /** Global instance of the {@link FileDataStoreFactory}. */
    private static FileDataStoreFactory DATA_STORE_FACTORY;

    /** Global instance of the JSON factory. */
    private static final JsonFactory JSON_FACTORY =
        JacksonFactory.getDefaultInstance();

    /** Global instance of the HTTP transport. */
    private static HttpTransport HTTP_TRANSPORT;

    /** Global instance of the scopes required by this quickstart.
     *
     * If modifying these scopes, delete your previously saved credentials
     * at ~/.credentials/drive-java-quickstart
     */
    private static final List<String> SCOPES =
        Arrays.asList(DriveScopes.DRIVE_METADATA_READONLY,DriveScopes.DRIVE_FILE);

    static {
        try {
            HTTP_TRANSPORT = GoogleNetHttpTransport.newTrustedTransport();
        } catch (Throwable t) {
            t.printStackTrace();
            System.exit(1);
        }
    }

    /**
     * Creates an authorized Credential object.
     * @return an authorized Credential object.
     * @throws IOException
     */
    public static Credential authorize(String secretPath,String storePath) throws IOException 
    {
        java.io.File DATA_STORE_DIR = new java.io.File(storePath);
        
        DATA_STORE_FACTORY = new FileDataStoreFactory(DATA_STORE_DIR);
        // Load client secrets.
        InputStream in = new FileInputStream(secretPath); 
        GoogleClientSecrets clientSecrets =
            GoogleClientSecrets.load(JSON_FACTORY, new InputStreamReader(in));

        // Build flow and trigger user authorization request.
        GoogleAuthorizationCodeFlow flow =
                new GoogleAuthorizationCodeFlow.Builder(
                        HTTP_TRANSPORT, JSON_FACTORY, clientSecrets, SCOPES)
                .setDataStoreFactory(DATA_STORE_FACTORY)
                .setAccessType("offline")
                .build();
        Credential credential = new AuthorizationCodeInstalledApp(
            flow, new LocalServerReceiver()).authorize("user");
        
        return credential;
    }

    /**
     * Build and return an authorized Drive client service.
     * @return an authorized Drive client service
     * @throws IOException
     */
    public static Drive getDriveService(String secretPath,String storePath) throws IOException {
        
        Credential credential = authorize(secretPath,storePath);
        return new Drive.Builder(
                HTTP_TRANSPORT, JSON_FACTORY, credential)
                .setApplicationName(APPLICATION_NAME)
                .build();
    }
    
    public static String uploadFile(String filePath, String title,Drive service) throws IOException
    {
        File body = new File();
        body.setTitle(title);
        body.setDescription("An audio mp3");
        body.setParents(Arrays.asList(new ParentReference().setId("0BymCAXss1oyHNHd3WDlyM3MwM3c")));
        body.setMimeType("audio/mp3");
        java.io.File fileContent = new java.io.File(filePath);
        FileContent mediaContent = new FileContent("audio/mp3", fileContent);
        File file = service.files().insert(body, mediaContent).execute();
        return file.getId();
    }
    
    public static String doUpload(String secretPath,String storePath,String path,String name) throws IOException
    {
        Drive service = getDriveService(secretPath,storePath);
        
        String id = uploadFile(path,name,service);
        return id;
    }
    public static void main(String[] args) throws IOException 
    {
        // Build a new authorized API client service.
        /*Drive service = getDriveService("client_secret.json","store");
        
        String id = uploadFile("test.txt","TEST",service);
        System.out.print(id);
        // Print the names and IDs for up to 10 files.
        /*FileList result = service.files().list()
             .setMaxResults(10)
             .execute();
        List<File> files = result.getItems();
        if (files == null || files.size() == 0) {
            System.out.println("No files found.");
        } else {
            System.out.println("Files:");
            for (File file : files) {
                System.out.printf("%s (%s)\n", file.getTitle(), file.getId());
            }
        }*/
    }
}
