/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */

package Models.MgrModels;

/**
 *
 * @author DatNTT
 */
public class BookList {

    private int id;
    private String title;
    private String thumbnail;
    private int price;
    private int quantity;
    private String isAvailable;

    public BookList() {
    }

    public BookList(int id, String title, String thumbnail, int price, int quantity, String isAvailable) {
        this.id = id;
        this.title = title;
        this.thumbnail = thumbnail;
        this.price = price;
        this.quantity = quantity;
        this.isAvailable = isAvailable;
    }

    public int getId() {
        return id;
    }

    public void setId(int id) {
        this.id = id;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public String getIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(String isAvailable) {
        this.isAvailable = isAvailable;
    }

  
   
    
    
    
    
}
