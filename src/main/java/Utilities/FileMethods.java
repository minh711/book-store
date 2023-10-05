package Utilities;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;

/**
 * Utility methods for files handling
 * Mainly about uploading files.
 * @author MinhTD
 */
public class FileMethods {
    
    /**
     * Get and save pictures from request to project folder.
     * 
     * @param request servlet request
     * @param inputName input file name in request
     * @param path file path that will be saved
     * @return Set of directions of the files, null if receive nothing
     * @throws IOException
     * @throws ServletException 
     * @author MinhTD
     */
    public static String[] UploadPictures(HttpServletRequest request, String inputName, String path) throws IOException, ServletException {
        List<String> ls = new ArrayList<>();
        int i = 0;
        for (Part part : request.getParts()) {
            if ("fPics".equals(part.getName())) {
                if (part.getSize() > 0) {
                    String realPath = request.getServletContext().getRealPath("/");
                    if (!Files.exists(Paths.get(realPath))) {
                        Files.createDirectory(Paths.get(realPath));
                    }
                    String uploadFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
                    String fileExtension = uploadFileName.substring(uploadFileName.length() - 4);
                    String fileName = i + String.valueOf(System.currentTimeMillis());
                    String directorySeparator = File.separator;
                    String targetPath = realPath + "Images" + (path.isEmpty() ? "" : directorySeparator) + path + directorySeparator + fileName + fileExtension;
                    part.write(targetPath);
                    ls.add(path + "/" + fileName + fileExtension);
                }
            }
            i++;
        }
        String[] arr = new String[ls.size()];
        ls.toArray(arr);
        return arr;
    }
    
    /**
    * Extracts the file name from a Part object's content disposition header.
    *
    * @param part The Part object from which the file name is extracted.
    * @return The extracted file name, or null if the file name is not found.
    * @author MinhTD
    */
    public static String getFileName(Part part) {
        for (String contentDisposition : part.getHeader("content-disposition").split(";")) {
            if (contentDisposition.trim().startsWith("filename")) {
                return contentDisposition.substring(contentDisposition.indexOf('=') + 1).trim().replace("\"", "");
            }
        }
        return null;
    }
}
