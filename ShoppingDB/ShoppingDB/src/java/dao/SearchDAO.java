/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package dao;

import dto.SearchDTO;
import java.sql.Connection;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;
import java.util.List;
import util.DBUtils;

/**
 *
 * @author ADMIN
 */
public class SearchDAO implements IDAO<SearchDTO, String>{

    @Override
    public boolean create(SearchDTO entity) {
        return false;
    }

    @Override
    public List<SearchDTO> readAll() {
        return null;
    }

    @Override
    public SearchDTO readbyID(String id) {
        return null;
    }

    @Override
    public boolean update(SearchDTO entity) {
        return false;
    }

    @Override
    public boolean delete(String id) {
        return false;
    }

    @Override
    public List<SearchDTO> search(String searchTerm) {
        return null;
    }
    
   public List<SearchDTO> searchByProductName (String searchTerm) {
       List<SearchDTO> result = new ArrayList<>();
       String sql = "SELECT * FROM tblSearch WHERE ProductName LIKE ?";
       
       try {
           Connection conn = DBUtils.getConnection();
           PreparedStatement ps = conn.prepareStatement(sql);
           ps.setString(1, "%"+searchTerm+"%");
           ResultSet rs = ps.executeQuery();
           while (rs.next()) {
               SearchDTO b = new SearchDTO(
                       rs.getString("ProductID"),
                       rs.getString("ProductName"),
                       rs.getDouble("Price"),
                       rs.getInt("Quantity")
                       );
               result.add(b);
           }
       } catch (Exception e) {
           System.out.println(e.toString());
       }
       return result;
   }
   
   
}
