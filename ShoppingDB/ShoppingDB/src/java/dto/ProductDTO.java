package dto;

public class ProductDTO {
    /*ProductID INT ,
    ProductCode VARCHAR(50) UNIQUE,
    ProductName VARCHAR(255) NOT NULL,
    Brand VARCHAR(10),
    Image VARCHAR(255),
    Price DOUBLE,
    Quantity INT */
    
    private int productID;
    private String productCode;
    private String productName;
    private String brand;
    private String image;
    private double price;  // Thêm giá sản phẩm
    private int quantity;  // Thêm số lượng còn lại

    public ProductDTO() {
    }

    public ProductDTO(int productID, String productCode, String productName, String brand, String image, double price, int quantity) {
        this.productID = productID;
        this.productCode = productCode;
        this.productName = productName;
        this.brand = brand;
        this.image = image;
        this.price = price;
        this.quantity = quantity;
    }

    public int getProductID() {
        return productID;
    }

    public void setProductID(int productID) {
        this.productID = productID;
    }

    public String getProductCode() {
        return productCode;
    }

    public void setProductCode(String productCode) {
        this.productCode = productCode;
    }

    public String getProductName() {
        return productName;
    }

    public void setProductName(String productName) {
        this.productName = productName;
    }

    public String getBrand() {
        return brand;
    }

    public void setBrand(String brand) {
        this.brand = brand;
    }

    public String getImage() {
        return image;
    }

    public void setImage(String image) {
        this.image = image;
    }

    public double getPrice() {  // Getter cho price
        return price;
    }

    public void setPrice(double price) {  // Setter cho price
        this.price = price;
    }

    public int getQuantity() {  // Getter cho quantity
        return quantity;
    }

    public void setQuantity(int quantity) {  // Setter cho quantity
        this.quantity = quantity;
    }
}
