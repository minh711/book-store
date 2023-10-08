/*
 * Click nbfs://nbhost/SystemFileSystem/Templates/Licenses/license-default.txt to change this license
 * Click nbfs://nbhost/SystemFileSystem/Templates/Classes/Class.java to edit this template
 */
package Models.DBModels;

/**
 *
 * @author mummykiara
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
    private String author;
    private String publisher;
    private String genre;
    private String language;
    
    //contructor for BookDetail
    
    public BookDetail(){
        
    }
    
    
    public BookDetail(int id, String title, String author, String publisher, String genre, String language, int salePrice, int discount, int price, int quantity ,String description, String thumbnail) {
        this.id = id;
        this.title = title;
        this.description = description;
        this.thumbnail = thumbnail;
        this.salePrice = salePrice;
        this.price = price;
        this.discount = discount;
        this.quantity = quantity;
        this.author = author;
        this.publisher = publisher;
        this.genre = genre;
        this.language = language;
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

    public String getAuthor() {
        return author;
    }

    public void setAuthor(String author) {
        this.author = author;
    }

    public String getPublisher() {
        return publisher;
    }

    public void setPublisher(String publisher) {
        this.publisher = publisher;
    }

    public String getGenre() {
        return genre;
    }

    public void setGenre(String genre) {
        this.genre = genre;
    }

    public String getLanguage() {
        return language;
    }

    public void setLanguage(String language) {
        this.language = language;
    }
    
    
}
