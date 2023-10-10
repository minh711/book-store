package Utilities;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.math.BigInteger;
import java.security.MessageDigest;
import java.security.NoSuchAlgorithmException;
import java.util.Base64;

public class StringMethods {
    
    /**
     * MD5 hashing
     * @param input original String
     * @return hashed String
     */
    public static String MD5Hash(String input) {
        String result = null;
        try {
            // Create an instance of MessageDigest with MD5 algorithm
            MessageDigest md = MessageDigest.getInstance("MD5");
            // Convert the input string to bytes
            byte[] inputBytes = input.getBytes();
            // Calculate the MD5 hash
            byte[] md5Bytes = md.digest(inputBytes);
            // Convert the hash bytes to a hexadecimal representation
            BigInteger bigInt = new BigInteger(1, md5Bytes);
            result = bigInt.toString(16);
            // Add leading zeros to ensure the hash has a length of 32 characters
            while (result.length() < 32) {
                result = "0" + result;
            }
        } catch (NoSuchAlgorithmException e) {
        }
        return result;
    }
    
    public static String Encrypt(String input) throws IOException {
        // Serialization
        ByteArrayOutputStream bos = new ByteArrayOutputStream();
        ObjectOutputStream outStream = new ObjectOutputStream(bos);
        outStream.writeObject(input);
        byte[] serializedBytes = bos.toByteArray();
        // Encoding
        return Base64.getEncoder().encodeToString(serializedBytes);
    }

    public static String Decrypt(String input) {
        byte[] decodedBytes = Base64.getDecoder().decode(input);
        // Deserialization
        ByteArrayInputStream bis = new ByteArrayInputStream(decodedBytes);
        try ( ObjectInputStream in = new ObjectInputStream(bis)) {
            return (String) in.readObject();
        } catch (IOException | ClassNotFoundException e) { }
        return null;
    }
}
