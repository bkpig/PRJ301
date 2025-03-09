package dao;

import dto.ProductDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.DBUtils;

public class ProductDAO implements IDAO<ProductDTO, Integer> {

    @Override
    public boolean create(ProductDTO entity) {
        return false;
    }

    @Override
    public List<ProductDTO> readAll() {
        return null;
    }

    @Override
    public ProductDTO readbyID(Integer id) {
        ProductDTO product = null;
        String sql = "SELECT * FROM tblProduct WHERE ProductID = ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setInt(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    product = new ProductDTO(
                        rs.getInt("ProductID"),
                        rs.getString("ProductCode"),
                        rs.getString("ProductName"),  
                        rs.getString("Brand"),
                        rs.getString("Image"),
                        rs.getDouble("Price"),     // Lấy giá từ DB
                        rs.getInt("Quantity")     // Lấy số lượng từ DB
                    );
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return product;
    }

    @Override
    public boolean update(ProductDTO entity) {
        return false;
    }

    @Override
    public boolean delete(Integer id) {
        return false;
    }

    @Override
    public List<ProductDTO> search(String searchTerm) {
        return null;
    }

    public List<ProductDTO> searchByProductName(String searchTerm) {
        List<ProductDTO> result = new ArrayList<>();
        String sql = "SELECT * FROM tblProduct WHERE ProductName LIKE ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, "%" + searchTerm + "%");
            
            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    ProductDTO product = new ProductDTO(
                        rs.getInt("ProductID"),
                        rs.getString("ProductCode"),
                        rs.getString("ProductName"),  
                        rs.getString("Brand"),
                        rs.getString("Image"),
                        rs.getDouble("Price"),    
                        rs.getInt("Quantity")     
                    );
                    result.add(product);
                }
            }
        } catch (Exception e) {
            e.printStackTrace(); 
        }
        return result;
    }
}
