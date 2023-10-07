package Utilities;

import java.io.ByteArrayInputStream;
import java.io.ByteArrayOutputStream;
import java.io.IOException;
import java.io.ObjectInputStream;
import java.io.ObjectOutputStream;
import java.util.Base64;

public class Cypher {

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
