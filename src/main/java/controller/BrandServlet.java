package controller;

import model.Brand;
import model.Type;
import service.BrandServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "BrandServlet", urlPatterns = "/brands")
public class BrandServlet extends HttpServlet {
    private BrandServiceImpl brandService = new BrandServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addNewDeck":
                tableBrands(request, response);
                break;
            case "addNewBrand":
                showAddNewBrand(request, response);
                break;
            case "editBrand":
                showEditBrandForm(request, response);
                break;
            case "deleteBrand":
                showDeleteBrandForm(request, response);
                break;
            case "searchTypeByName":
                searchBrandByName(request, response);
                break;
            default:
                listBrands(request, response);
                break;
        }
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "addNewBrand":
                addNewBrand(request, response);
                break;
            case "editBrand":
                editBrand(request, response);
                break;
            case "deleteBrand":
                deleteBrand(request, response);
                break;
            case "searchBrandByName":
                searchBrandByName(request, response);
                break;
            default:
                listBrands(request, response);
                break;
        }
    }

    private void listBrands(HttpServletRequest request, HttpServletResponse response) {
        List<Brand> brands = brandService.findAll();
        request.setAttribute("brands", brands);
        RequestDispatcher dispatcher = request.getRequestDispatcher("brand/listBrand.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewBrand(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("brand/addNewBrand.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteBrandForm(HttpServletRequest request, HttpServletResponse response) {
        String brandId = request.getParameter("brandId");
        Brand brand = brandService.selectBrand(brandId);
        request.setAttribute("brand", brand);
        RequestDispatcher dispatcher = request.getRequestDispatcher("brand/deleteBrand.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditBrandForm(HttpServletRequest request, HttpServletResponse response) {
        String brandId = request.getParameter("brandId");
        Brand brand = brandService.selectBrand(brandId);
        request.setAttribute("brand", brand);
        RequestDispatcher dispatcher = request.getRequestDispatcher("brand/editBrand.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewBrand(HttpServletRequest request, HttpServletResponse response) {
        String brandId = request.getParameter("brandId");
        String brandName = request.getParameter("brandName");
        String brandAddress = request.getParameter("brandAddress");
        Brand brand = new Brand(brandId, brandName, brandAddress);
        brandService.addNewBrand(brand);
        RequestDispatcher dispatcher = request.getRequestDispatcher("brand/addNewBrand.jsp");
        request.setAttribute("message", "Add New Brand Successfully!");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editBrand(HttpServletRequest request, HttpServletResponse response) {
        String brandId = request.getParameter("brandId");
        String brandName = request.getParameter("brandName");
        String brandAddress = request.getParameter("brandAddress");
        Brand brand = brandService.searchBrandById(brandId);
        brand.setBrandId(brandId);
        brand.setBrandName(brandName);
        brand.setBrandAddress(brandAddress);
        try {
            brandService.update(brandId, brand);
            request.setAttribute("brand ", brand);
            request.setAttribute("message", "Brand information was updated!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("brand/editBrand.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteBrand(HttpServletRequest request, HttpServletResponse response) {
        String brandId = request.getParameter("brandId");
        try {
            brandService.delete(brandId);
            response.sendRedirect("/brands");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void tableBrands(HttpServletRequest request, HttpServletResponse response) {
        List<Brand> brands = brandService.findAll();
        request.setAttribute("brands", brands);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/addNewDeck.jsp");
        for (int i = 0; i < brands.size(); i++) {
            System.out.println(brands.get(i).getBrandId());
            System.out.println(brands.get(i).getBrandName());
            System.out.println(brands.get(i).getBrandAddress());
        }
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchBrandByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String brandName = request.getParameter("searchBrandByName");
        List<Brand> brandsByName = brandService.searchBrandByName(brandName);
        request.setAttribute("brands", brandsByName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("brand/listBrand.jsp");
        dispatcher.forward(request, response);
    }
}
