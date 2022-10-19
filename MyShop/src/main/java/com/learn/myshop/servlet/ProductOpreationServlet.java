
package com.learn.myshop.servlet;

import com.learn.myshop.Dao.CategoryDao;
import com.learn.myshop.Dao.ProductDao;
import com.learn.myshop.entities.Category;
import com.learn.myshop.entities.Product;
import com.learn.myshop.helper.FactoryProvider;

import java.io.File;
import java.io.FileInputStream;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import javax.servlet.ServletException;
import javax.servlet.annotation.MultipartConfig;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;
import javax.servlet.http.Part;

@MultipartConfig
public class ProductOpreationServlet extends HttpServlet {

    
    protected void processRequest(HttpServletRequest request, HttpServletResponse response)
            throws ServletException, IOException {
        response.setContentType("text/html;charset=UTF-8");
        try ( PrintWriter out = response.getWriter()) {
            /* TODO output your page here. You may use following sample code. */
            String op = request.getParameter("operation");
            if(op.trim().equals("addcategory"))
            {
            
            //Faching data from Category......
            
            String title = request.getParameter("catTitle");
            String description = request.getParameter("catDescription");
            
            Category category = new Category();
            category.setCategoryTitle(title);
            category.setCategoryDescription(description);
                //Save category into the DataBase........
                CategoryDao categoryDao = new CategoryDao(FactoryProvider.getFactory());
                int catId = categoryDao.saveCategory(category);
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message1", "Category Added Successfully :"+catId);
                response.sendRedirect("admin.jsp");
                return;
            }
            else if(op.trim().equals("addproduct"))
            {
                //Add Product......
                String pName = request.getParameter("pName");
                String pDesc = request.getParameter("pDesc");
                int pPrice = Integer.parseInt(request.getParameter("pPrice"));
                int pDiscount = Integer.parseInt(request.getParameter("pDiscount"));
                int pQuantity = Integer.parseInt(request.getParameter("pQuantity"));
                int catId = Integer.parseInt(request.getParameter("catId"));
                Part part = request.getPart("pPic");
                
                Product p = new Product();
                p.setpName(pName);
                p.setpDesc(pDesc);
                p.setpDesc(pDesc);
                p.setpPrice(pPrice);
                p.setpDiscount(pDiscount);
                p.setpQuntity(pQuantity);
                p.setpPhoto(part.getSubmittedFileName());
                
                //Get category by id.......
                CategoryDao cdao = new CategoryDao(FactoryProvider.getFactory());
                Category category = cdao.getCategoryById(catId);
                p.setCategory(category);
                
                //Product save.......
                ProductDao pdao = new ProductDao(FactoryProvider.getFactory());
               pdao.saveProduct(p);
                try {
                    //pic uploding Start....
                    
                // find out the path to uploade...
                String path = request.getRealPath("img")+ File.separator + "product" + File.separator + part.getSubmittedFileName();
                System.out.println(path);
                // Uploding code.......
                FileOutputStream fos = new FileOutputStream(path);
                InputStream is = part.getInputStream();
                //Readin data....
                byte []data = new byte [is.available()];
                is.read(data);
                //Writing the data.........
                fos.write(data);
                fos.close();
                //pic uploding End......
                } catch (Exception e) {
                    e.printStackTrace();
                }
                HttpSession httpSession = request.getSession();
                httpSession.setAttribute("message1", "Product is Added Successfully :");
                response.sendRedirect("admin.jsp");
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
