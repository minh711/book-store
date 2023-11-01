/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Controllers;

import DAOs.MgrModelDAOs.AccountDAO;
import Models.DBModels.Account;
import static com.sun.corba.se.spi.presentation.rmi.StubAdapter.request;

import jakarta.servlet.RequestDispatcher;
import java.sql.SQLException;

import java.util.Properties;
import java.util.Random;
import java.util.logging.Level;
import java.util.logging.Logger;
import javax.mail.Authenticator;
import javax.mail.Message;
import javax.mail.MessagingException;
import javax.mail.PasswordAuthentication;
import javax.mail.Session;
import javax.mail.Transport;
import javax.mail.internet.InternetAddress;
import javax.mail.internet.MimeMessage;

/**
 *
 * @author DatNTT
 */
public class RePass {

    private final String email;

    RePass(String email) {
        this.email = email;
    }

    public void sendEmail() throws SQLException {

        Random rand = new Random();
        int otpvalue = rand.nextInt(999999);

        String toEmail = email;

        final String fromEmail = "tandatngotran@gmail.com";//email gửi {đừng dùng mail trường}
        final String passEmail = "nujj orty kgpe glhm";// mật khẩu cửa hàng --> vào xác nhận 2 lớp của gmail để tạo

        String otp = String.valueOf(otpvalue);
        AccountDAO dao = new AccountDAO();

        try {
            RequestDispatcher dispatcher = null;
            // Get the session object
            Properties props = new Properties();
            props.put("mail.smtp.host", "smtp.gmail.com");
            props.put("mail.smtp.port", "587");
            props.put("mail.smtp.auth", "true");
            props.put("mail.smtp.starttls.enable", "true");
            props.put("mail.smtp.socketFactory.port", "587");
            props.put("mail.smtp.ssl.socketFactory", "javax.net.ssl.SSLSocketFactory");

            Session session = Session.getInstance(props, new Authenticator() {

                @Override
                protected PasswordAuthentication getPasswordAuthentication() {
                    return new PasswordAuthentication(fromEmail, passEmail);// Put your email
                    // id and
                    // password here
                    //sqdr elke vmaw srzw
                }
            });
            // compose message
            try {
                MimeMessage message = new MimeMessage(session);
                message.addRecipient(Message.RecipientType.TO, new InternetAddress(toEmail));
                message.setFrom(new InternetAddress(fromEmail));// change accordingly

                message.setSubject("Hello");//tựa email
                message.setText("your OTP is: " + otp);//nội dung email
                // send message
                dao.updateOTP(otp, email);
                Transport.send(message);
                System.out.println("Đã gửi email thành công");
            } catch (MessagingException e) {
                throw new RuntimeException(e);
            }

        } catch (Exception ex) {
            Logger.getLogger(LoginCtrl.class.getName()).log(Level.SEVERE, null, ex);
        }

    }

}
