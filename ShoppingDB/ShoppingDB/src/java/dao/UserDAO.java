package dao;

import dto.UserDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;
import java.util.logging.Level;
import java.util.logging.Logger;
import util.DBUtils;

public class UserDAO implements IDAO<UserDTO, String> {

    @Override
    public boolean create(UserDTO entity) {
        String sql = "INSERT INTO [tblUsers] ([UserID], [Fullname], [RoleID], [Email], [Password], [Phone]) VALUES (?, ?, ?, ?, ?, ?)";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, entity.getUserID());
            ps.setString(2, entity.getFullname());
            ps.setString(3, entity.getRoleID());
            ps.setString(4, entity.getEmail());
            ps.setString(5, entity.getPassword());
            ps.setString(5, entity.getPhone());

            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in create(): ", ex);
            return false;
        }
    }

    @Override
    public List<UserDTO> readAll() {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM [tblUsers]";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql);
             ResultSet rs = ps.executeQuery()) {
            
            while (rs.next()) {
                list.add(new UserDTO(
                    rs.getString("UserID"),
                    rs.getString("Fullname"),
                    rs.getString("RoleID"),
                    rs.getString("Password"),
                    rs.getString("Email"),
                    rs.getString("Phone"),
                    rs.getString("image")
                ));
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in readAll(): ", ex);
        }
        return list;
    }

    @Override
    public UserDTO readbyID(String id) {
        String sql = "SELECT * FROM [tblUsers] WHERE UserID = ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, id);
            try (ResultSet rs = ps.executeQuery()) {
                if (rs.next()) {
                    return new UserDTO(
                        rs.getString("UserID"),
                        rs.getString("Fullname"),
                        rs.getString("RoleID"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("image")
                    );
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in readbyID(): ", ex);
        }
        return null;
    }

    @Override
    public boolean update(UserDTO entity) {
        String sql = "UPDATE [tblUsers] SET Fullname = ?, RoleID = ?, Email = ?, Password = ?, Phone = ? WHERE UserID = ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, entity.getFullname());
            ps.setString(2, entity.getRoleID());
            ps.setString(3, entity.getEmail());
            ps.setString(4, entity.getPassword());
            ps.setString(5, entity.getPhone());
            ps.setString(6, entity.getUserID());

            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in update(): ", ex);
            return false;
        }
    }

    @Override
    public boolean delete(String id) {
        String sql = "DELETE FROM [tblUsers] WHERE UserID = ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, id);
            return ps.executeUpdate() > 0;
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in delete(): ", ex);
            return false;
        }
    }

    @Override
    public List<UserDTO> search(String searchTerm) {
        List<UserDTO> list = new ArrayList<>();
        String sql = "SELECT * FROM [tblUsers] WHERE Fullname LIKE ? OR Email LIKE ?";
        
        try (Connection conn = DBUtils.getConnection();
             PreparedStatement ps = conn.prepareStatement(sql)) {
            
            ps.setString(1, "%" + searchTerm + "%");
            ps.setString(2, "%" + searchTerm + "%");

            try (ResultSet rs = ps.executeQuery()) {
                while (rs.next()) {
                    list.add(new UserDTO(
                        rs.getString("UserID"),
                        rs.getString("Fullname"),
                        rs.getString("RoleID"),
                        rs.getString("Password"),
                        rs.getString("Email"),
                        rs.getString("Phone"),
                        rs.getString("image")
                    ));
                }
            }
        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in search(): ", ex);
        }
        return list;
    }

    public boolean updateUser(UserDTO user) {
        String sql = "UPDATE tblUsers SET Fullname = ?, Email = ?, Phone = ? WHERE UserID = ?";

                try (Connection conn = DBUtils.getConnection();
                     PreparedStatement ps = conn.prepareStatement(sql)) {

                    ps.setString(1, user.getFullname());
                    ps.setString(2, user.getEmail());
                    ps.setString(3, user.getPhone());
                    ps.setString(4, user.getUserID());

                    int rowsAffected = ps.executeUpdate();
                    return rowsAffected > 0;  // Nếu có ít nhất 1 hàng bị ảnh hưởng => thành công

                } catch (SQLException | ClassNotFoundException e) {
                    Logger.getLogger(UserDAO.class.getName()).log(Level.SEVERE, "Error in search(): ", e);
                }
                return false; // Nếu có lỗi thì trả về false
           }
}
