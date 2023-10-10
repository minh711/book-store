/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.MgrModels;

/**
 *
 * @author PC
 */
public class OrderItem {
    private int bookID;
    private String tittle;
    private int price;
    private int salePrice;
    private int quantity;
    private String thumbnail;

    public OrderItem() {
    }

    public OrderItem(int bookID, String tittle, int price, int salePrice, int quantity, String thumbnail) {
        this.bookID = bookID;
        this.tittle = tittle;
        this.price = price;
        this.salePrice = salePrice;
        this.quantity = quantity;
        this.thumbnail = thumbnail;
    }

    public int getBookID() {
        return bookID;
    }

    public void setBookID(int bookID) {
        this.bookID = bookID;
    }

    public String getTittle() {
        return tittle;
    }

    public void setTittle(String tittle) {
        this.tittle = tittle;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

  
    
}
