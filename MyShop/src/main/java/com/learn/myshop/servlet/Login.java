package com.learn.myshop.servlet;

import com.learn.myshop.Dao.userDao;
import com.learn.myshop.entities.User;
import com.learn.myshop.helper.FactoryProvider;
import java.io.IOException;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
public class Login extends HttpServlet {

    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
           
//            Faching data frome login.jsp

             String email = request.getParameter("email");
             String password = request.getParameter("password");
             
//             Authenticating user........
             userDao userDao = new userDao(FactoryProvider.getFactory());
             User user = userDao.getUserByEmailAndPassword(email, password);
//             System.out.println(user);
              HttpSession httpSession = request.getSession();
                if(user==null)
                {
                 httpSession.setAttribute("message","Email or password wrong !");
                 response.sendRedirect("Login.jsp");
                 return;
                }
             else
                {
                out.print("<h1>Wellcome "+user.getUserName()+" </h1>");
                //login
                httpSession.setAttribute("current-user", user);
                //Admin: admin.jsp
                if(user.getUserType().equals("admin"))
                {
                response.sendRedirect("admin.jsp");
                }
                //Nomal:normal.jsp
                else if(user.getUserType().equals("normal")){
                
                response.sendRedirect("index.jsp");
                
                }
                else
                {
                out.println("We have not identyfi whoe are you");
                }
                
              
                
                }
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
