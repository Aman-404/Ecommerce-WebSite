
package com.learn.myshop.servlet;

import com.learn.myshop.entities.User;
import com.learn.myshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import org.hibernate.Session;
import org.hibernate.Transaction;

public class Register extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            try {
//                Fatch Data from Register page......
                String userName = request.getParameter("user_name");
                String userEmail = request.getParameter("user_email");
                String userPassword = request.getParameter("user_password");
                String userPhone = request.getParameter("user_phone");
                String userAddress = request.getParameter("user_address");
//                Creaing user object to store data....
                User user = new User(userName, userEmail, userPassword, userPhone, "default.png", userAddress, "normal");
                Session hibernateSession = FactoryProvider.getFactory().openSession();
                Transaction tx = hibernateSession.beginTransaction();
//                int userId = (int)hibernateSession.save(user);
                hibernateSession.save(user);
               
                tx.commit();
                hibernateSession.close();
            
                response.sendRedirect("Login.jsp");
                return;
                
            } catch (Exception e) {
                e.printStackTrace();
//                 Error message......
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message", "Sorry ! email is already exists...");
                response.sendRedirect("Register.jsp");
                return;
            }
        }
    }
  
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
