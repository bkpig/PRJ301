/*
 * To change this license header, choose License Headers in Project Properties.
 * To change this template file, choose Tools | Templates
 * and open the template in the editor.
 */
package controller;

import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

/**
 *
 * @author ADMIN
 */
@WebServlet(name = "MainController", urlPatterns = {"/MainController"})
public class MainController extends HttpServlet {

    public boolean isValidLogin(String username, String password) {
        return username.equals("admin") && password.equals("12345678");
    }
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try (PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            out.println("<!DOCTYPE html>");
            out.println("<html>");
            out.println("<head>");
            out.println("<title>Servlet MainController</title>");            
            out.println("</head>");
            out.println("<body>");
            //check username password đã có ch 
            //check length ò username pass minimum is 8
            
            String txtUserName = request.getParameter("txtUserName");
            String txtPassword= request.getParameter("txtPassword");
            
            
            //check input username and password
            if (txtPassword.trim().length()==0 || txtUserName.trim().length()==0) {
                out.println("Plese input username and password!");
                return;
            }
            
            // chek lenghth 
            if (txtPassword.trim().length()<8) {
                out.println("Please enter a password with at least 8 characters!");
                return;
            }
            
            //login process
            if (isValidLogin(txtUserName, txtPassword)) {
                //chuyển trang theo kiểu RequestDispatcher.forward
                // dc dùng khi nào ?
                    // + xử lý yêu cầu nội bộ và chuyển tiếp đến trang chính 
                    // + Không cần thay đổi URL hiển thị trên trình duyệt 
                    // + Dữ liệu từ request ban đầu
                // CƠ CHẾ : chuyển tiếp nội book 
                //URL : không thay đổi
                RequestDispatcher rd = request.getRequestDispatcher("search.html");
                rd.forward(request, response);
            } else {
                //RequestDispatcher rd = request.getRequestDispatcher("invalid.html");
                //rd.forward(request, response);
                // dc dùng khi nào ?
                //dùng khi truy cập
                response.sendRedirect("invalid.html");
            } 
            out.println("</body>");
            out.println("</html>");
        }
    }

    // <editor-fold defaultstate="collapsed" desc="HttpServlet methods. Click on the + sign on the left to edit the code.">
    /**
     * Handles the HTTP <code>GET</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doGet(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Handles the HTTP <code>POST</code> method.
     *
     * @param request servlet request
     * @param response servlet response
     * @throws ServletException if a servlet-specific error occurs
     * @throws IOException if an I/O error occurs
     */
    @Override
    protected void doPost(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        processRequest(request, response);
    }

    /**
     * Returns a short description of the servlet.
     *
     * @return a String containing servlet description
     */
    @Override
    public String getServletInfo() {
        return "Short description";
    }// </editor-fold>

}
