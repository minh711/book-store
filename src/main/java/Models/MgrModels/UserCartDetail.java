/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.MgrModels;

/**
 *
 * @author mummykiara
 */
public class UserCartDetail {
    private String bookTitle;
    private String bookThumbnail;
    private int bookprice;
    private int bookquantity;
    private int accountid;
    private int bookid;
    private int bookQuantityRemain;

    public UserCartDetail(String bookTitle, String bookThumbnail, int bookprice, int bookquantity, int accountid, int bookid,int bookQuantityRemain) {
        this.bookTitle = bookTitle;
        this.bookThumbnail = bookThumbnail;
        this.bookprice = bookprice;
        this.bookquantity = bookquantity;
        this.accountid = accountid;
        this.bookid = bookid;
        this.bookQuantityRemain = bookQuantityRemain;
    }

    public String getBookTitle() {
        return bookTitle;
    }

    public void setBookTitle(String bookTitle) {
        this.bookTitle = bookTitle;
    }

    public String getBookThumbnail() {
        return bookThumbnail;
    }

    public void setBookThumbnail(String bookThumbnail) {
        this.bookThumbnail = bookThumbnail;
    }

    public int getBookprice() {
        return bookprice;
    }

    public void setBookprice(int bookprice) {
        this.bookprice = bookprice;
    }

    public int getBookquantity() {
        return bookquantity;
    }

    public void setBookquantity(int bookquantity) {
        this.bookquantity = bookquantity;
    }

    public int getAccountid() {
        return accountid;
    }

    public void setAccountid(int accountid) {
        this.accountid = accountid;
    }

    public int getBookid() {
        return bookid;
    }

    public void setBookid(int bookid) {
        this.bookid = bookid;
    }

    public int getBookQuantityRemain() {
        return bookQuantityRemain;
    }

    public void setBookQuantityRemain(int bookQuantityRemain) {
        this.bookQuantityRemain = bookQuantityRemain;
    }
    
    
}
