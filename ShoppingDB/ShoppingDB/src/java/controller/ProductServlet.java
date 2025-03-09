package controller;

import dao.ProductDAO;
import dto.ProductDTO;
import java.io.IOException;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

public class ProductServlet extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String idParam = request.getParameter("id");
        int productID = -1;

        try {
            productID = Integer.parseInt(idParam);
        } catch (NumberFormatException e) {
            System.out.println("Invalid Product ID: " + idParam);
            request.setAttribute("errorMessage", "⚠ Mã sản phẩm không hợp lệ.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
            return;
        }

        ProductDAO productDAO = new ProductDAO();
        ProductDTO product = productDAO.readbyID(productID);

        if (product != null) {
            request.setAttribute("product", product);
            request.getRequestDispatcher("product.jsp").forward(request, response);
        } else {
            System.out.println("Product not found: " + productID);
            request.setAttribute("errorMessage", "⚠ Sản phẩm không tồn tại hoặc đã bị xóa.");
            request.getRequestDispatcher("error.jsp").forward(request, response);
        }
    }

    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    @Override
    public String getServletInfo() {
        return "Product Servlet";
    }
}
