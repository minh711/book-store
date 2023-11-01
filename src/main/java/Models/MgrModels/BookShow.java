package Models.MgrModels;

/**
 *
 * @author DuyenLTM
 */
public class BookShow {

    private String thumbnail;
    private int discount;
    private String title;
    private int price;
    private int salePrice;
    private int rating;

    public BookShow(String thumbnail, int discount, String title, int price, int salePrice, int rating) {
        this.thumbnail = thumbnail;
        this.discount = discount;
        this.title = title;
        this.price = price;
        this.salePrice = salePrice;
        this.rating = rating;
    }

    public String getThumbnail() {
        return thumbnail;
    }

    public void setThumbnail(String thumbnail) {
        this.thumbnail = thumbnail;
    }

    public int getDiscount() {
        return discount;
    }

    public void setDiscount(int discount) {
        this.discount = discount;
    }

    public String getTitle() {
        return title;
    }

    public void setTitle(String title) {
        this.title = title;
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

    public int getRating() {
        return rating;
    }

    public void setRating(int rating) {
        this.rating = rating;
    }

}
