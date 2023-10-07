package Utilities;

import jakarta.servlet.http.Cookie;

public class CookieMethods {

    public static Cookie GetCookie(Cookie[] cookies, String name) {
        
        for (Cookie cookie : cookies) {
            if (cookie.getName().equals(name)) {
                return cookie;
            }
        }
        return null;
    }
}
