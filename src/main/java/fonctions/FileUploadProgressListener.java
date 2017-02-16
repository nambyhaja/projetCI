package fonctions;

import com.google.api.client.googleapis.media.MediaHttpUploader;
import com.google.api.client.googleapis.media.MediaHttpUploaderProgressListener;

import java.io.IOException;
import java.text.NumberFormat;

/**
 * The File Upload Progress Listener.
 *
 * @author rmistry@google.com (Ravi)
 */
public class FileUploadProgressListener implements MediaHttpUploaderProgressListener {

  @Override
  public void progressChanged(MediaHttpUploader uploader) throws IOException {
    switch (uploader.getUploadState()) {
      case INITIATION_STARTED:
        
        break;
      case INITIATION_COMPLETE:
        
        break;
      case MEDIA_IN_PROGRESS:
        
            
        break;
      case MEDIA_COMPLETE:
        
        break;
    }
  }
}