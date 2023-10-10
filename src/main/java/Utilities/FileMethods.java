package Utilities;

import jakarta.servlet.ServletException;
import jakarta.servlet.http.HttpServletRequest;
import jakarta.servlet.http.Part;
import java.awt.Graphics2D;
import java.awt.Image;
import java.awt.image.BufferedImage;
import java.io.File;
import java.io.IOException;
import java.nio.file.Files;
import java.nio.file.Paths;
import java.util.ArrayList;
import java.util.List;
import javax.imageio.ImageIO;

/**
 * Utility methods for files handling. Mainly about uploading files.
 *
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
            if (inputName.equals(part.getName())) {
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

    /**
     * Resize a picture as expected width and height.
     *
     * @param request servlet request.
     * @param originPath path of the original picture.
     * @param path path that the resized picture will be saved.
     * @param targetWidth expected width of the resized picture.
     * @param targetHeight expected height of the resized picture.
     * @throws IOException if error occurs.
     * @author MinhTD
     */
    public static String resizePicture(HttpServletRequest request, String originPath, String path, int targetWidth, int targetHeight) throws IOException {
        String realPath = request.getServletContext().getRealPath("/");
        
        File inputFile = new File(realPath + "Images" + originPath);
        BufferedImage inputImage = ImageIO.read(inputFile);

        double widthRatio = (double) targetWidth / inputImage.getWidth();
        double heightRatio = (double) targetHeight / inputImage.getHeight();
        double scaleFactor = Math.min(widthRatio, heightRatio);

        int scaledWidth = (int) (inputImage.getWidth() * scaleFactor);
        int scaledHeight = (int) (inputImage.getHeight() * scaleFactor);

        BufferedImage outputImage = new BufferedImage(scaledWidth, scaledHeight, inputImage.getType());

        Graphics2D g2d = outputImage.createGraphics();
        g2d.drawImage(inputImage.getScaledInstance(scaledWidth, scaledHeight, Image.SCALE_SMOOTH), 0, 0, scaledWidth, scaledHeight, null);
        g2d.dispose();

        String fileExtension = originPath.substring(originPath.lastIndexOf("."));
        String fileName = "micro" + String.valueOf(System.currentTimeMillis());
        String directorySeparator = File.separator;
        String targetPath = realPath + "Images" + (path.isEmpty() ? "" : directorySeparator) + path + directorySeparator + fileName + fileExtension;
        
        File outputFile = new File(targetPath);
        ImageIO.write(outputImage, fileExtension.substring(1), outputFile);
        return path + "/" + fileName + fileExtension;
        
    }
}
