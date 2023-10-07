package Utilities;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;

public class ImageUploader {
    
    /**
     * Get and save image from JSP to project folder
     * @param request servlet request
     * @param inputName input file name in JSP
     * @param path file path that will be save
     * @param fileName file name
     * @return true if get and save a file, false if receive nothing
     * @throws IOException
     * @throws ServletException 
     */
    public static String UploadImage(HttpServletRequest request, String inputName, String path, String fileName) throws IOException, ServletException {
        Part part = request.getPart(inputName);
        if (part.getSize() > 0) {
            String realPath = request.getServletContext().getRealPath("/");
            if (!Files.exists(Paths.get(realPath))) {
                Files.createDirectory(Paths.get(realPath));
            }
            String uploadFileName = Paths.get(part.getSubmittedFileName()).getFileName().toString();
            String fileExtension = uploadFileName.substring(uploadFileName.length() - 4);
            String directorySeparator = File.separator;
            String targetPath = realPath + "image" + directorySeparator + path + directorySeparator + fileName + fileExtension;
            if (Files.exists(Paths.get(targetPath))) {
                String timestamp = String.valueOf(System.currentTimeMillis());
                fileName = fileName + timestamp;
                targetPath = realPath + "image" + directorySeparator + path + directorySeparator + fileName + fileExtension;
            } 
            part.write(targetPath);
            return path + "/" + fileName + fileExtension;
        }
        return "";
    }
}
