/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.MgrModels;

/**
 *
 * @author NhuLNT
 */
public class BookDetail {

    private int id;
    private String title;
    private String description;
    private String thumbnail;
    private int salePrice;
    private int price;
    private int discount;
    private int quantity;
    private int soleTotal;
    private String publisher;
    private String language;
    private float avgRating;
    
    private boolean isAvailable;

    //contructor for BookDetail
    public BookDetail() {

    }

    public BookDetail(int id, String title, String publisher, String language, int salePrice, int discount, int price, int soleTotal, int quantity, String description, String thumbnail,float avgRating) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.salePrice = salePrice;
        this.price = price;
        this.soleTotal = soleTotal;
        this.discount = discount;
        this.quantity = quantity;
        this.publisher = publisher;
        this.language = language;
        this.avgRating = avgRating;
    }
    
    public BookDetail(int id, String title, String publisher, String language, int salePrice, int discount, int price, int soleTotal, int quantity, String description, String thumbnail,float avgRating,boolean isAvailable) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.salePrice = salePrice;
        this.price = price;
        this.soleTotal = soleTotal;
        this.discount = discount;
        this.quantity = quantity;
        this.publisher = publisher;
        this.language = language;
        this.avgRating = avgRating;
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

    public String getDescription() {
        return description;
    }

    public void setDescription(String description) {
        this.description = description;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getSalePrice() {
        return salePrice;
    }

    public void setSalePrice(int salePrice) {
        this.salePrice = salePrice;
    }

    public int getPrice() {
        return price;
    }

    public void setPrice(int price) {
        this.price = price;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public int getQuantity() {
        return quantity;
    }

    public void setQuantity(int quantity) {
        this.quantity = quantity;
    }

    public int getSoleTotal() {
        return soleTotal;
    }

    public void setSoleTotal(int soleTotal) {
        this.soleTotal = soleTotal;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }

    public float getAvgRating() {
        return avgRating;
    }

    public void setAvgRating(float avgRating) {
        this.avgRating = avgRating;
    }

    public boolean isIsAvailable() {
        return isAvailable;
    }

    public void setIsAvailable(boolean isAvailable) {
        this.isAvailable = isAvailable;
    }

}
