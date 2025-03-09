package controller;

import dao.ProductDAO;
import dao.UserDAO;
import dto.ProductDTO;
import dto.UserDTO;
import java.io.IOException;
import java.util.List;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

public class MainController extends HttpServlet {

    private static final String LOGIN_PAGE = "login.jsp";
    private ProductDAO productDAO = new ProductDAO();

    public UserDTO getUser(String userID) {
        UserDAO userDAO = new UserDAO();
        return userDAO.readbyID(userID);
    }

    public boolean isValidLogin(String userID, String password) {
        UserDTO user = getUser(userID);
        return user != null && user.getPassword().equals(password);
    }

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");

        String action = request.getParameter("action");
        String url = LOGIN_PAGE;

        try {
            //-- --------------------------------------------------------- -->
            if ("login".equals(action)) {
                String userID = request.getParameter("strUserID");
                String password = request.getParameter("strPassword");

                if (isValidLogin(userID, password)) {
                    HttpSession session = request.getSession();
                    session.setAttribute("user", getUser(userID));
                    url = "menu.jsp";
                } else {
                    request.setAttribute("message", "Tài khoản hoặc mật khẩu không chính xác!");
                }
              
            //-- --------------------------------------------------------- -->
            } else if ("logout".equals(action)){
                url = "login.jsp";
                request.getSession().invalidate();
                
            //-- --------------------------------------------------------- -->
            } else if ("profile".equals(action)) {
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");
                
                if(user != null) {
                    request.setAttribute("userProfile", user); // lưu thông tin userProfile vào requesr với key user
                    url = "profile.jsp";                      // <c:set var="profile" value="${sessionScope.user}"/>
                                                                //<p>Name: ${profile.fullname}</p>
                } else {
                    url = "login.jsp";
                }
                
            //-- --------------------------------------------------------- -->
            
            }else if ("updateProfile".equals(action)) { 
                HttpSession session = request.getSession();
                UserDTO user = (UserDTO) session.getAttribute("user");

                if (user != null) {
                    String fullname = request.getParameter("fullname");
                    String email = request.getParameter("email");
                    String phone = request.getParameter("phone");

                    // Kiểm tra email hợp lệ
                    String emailRegex = "^[A-Za-z0-9+_.-]+@[A-Za-z0-9.-]+$";
                    String phoneRegex = "^[0-9]{10,11}$";

                    if (!email.matches(emailRegex)) {
                        request.setAttribute("message", "Email không hợp lệ!");
                        request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
                        return;
                    }

                    if (!phone.matches(phoneRegex)) {
                        request.setAttribute("message", "Số điện thoại không hợp lệ!");
                        request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
                        return;
                    }

                    // Cập nhật thông tin user
                    user.setFullname(fullname);
                    user.setEmail(email);
                    user.setPhone(phone);

                    // Cập nhật database
                    UserDAO userDAO = new UserDAO();
                    boolean success = userDAO.updateUser(user);

                    if (success) {
                        session.setAttribute("user", user);
                        request.setAttribute("message", "Cập nhật thành công!");
                    } else {
                        request.setAttribute("message", "Cập nhật thất bại, vui lòng thử lại!");
                    }

                    request.getRequestDispatcher("updateProfile.jsp").forward(request, response);
                } else {
                    response.sendRedirect("login.jsp");
                }

            //-- --------------------------------------------------------- -->
            
            } else if (action != null && action.equals("searchProduct")) {
                try {
                    String searchTerm = request.getParameter("searchName");
                    List<ProductDTO> searchResults = productDAO.searchByProductName(searchTerm);
                    
                    if (searchResults.isEmpty()) {
                        request.setAttribute("message", "Không tìm thấy sản phẩm nào!");
                    } else {
                        request.setAttribute("searchResults", searchResults);
                    }

                    request.getRequestDispatcher("search.jsp").forward(request, response);
                } catch (Exception e) {
                    e.printStackTrace();
                    request.setAttribute("message", "Lỗi khi tìm kiếm: " + e.getMessage());
                    request.getRequestDispatcher("search.jsp").forward(request, response);
                }
            }

            
            
        } catch (Exception e) {
            log("Error at MainController: " + e.toString());
        }

        response.sendRedirect(url);
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
        return "Main Controller Servlet";
    }
}