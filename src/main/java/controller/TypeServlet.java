package controller;

import model.Deck;
import model.Type;
import service.TypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.util.List;

@WebServlet(name = "TypeServlet", urlPatterns = "/types")
public class TypeServlet extends HttpServlet {

    private TypeServiceImpl typeService = new TypeServiceImpl();

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
                tableTypes(request, response);
                break;
            case "addNewType":
                showAddNewType(request, response);
                break;
            case "editType":
                showEditTypeForm(request, response);
                break;
            case "deleteType":
                showDeleteTypeForm(request, response);
                break;
            case "searchTypeByName":
                searchTypeByName(request, response);
                break;
            default:
                listTypes(request, response);
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
            case "addNewType":
                addNewType(request, response);
                break;
            case "editType":
                editType(request, response);
                break;
            case "deleteType":
                deleteType(request, response);
                break;
            case "searchTypeByName":
                searchTypeByName(request, response);
                break;
            default:
                listTypes(request, response);
                break;
        }
    }

    private void listTypes(HttpServletRequest request, HttpServletResponse response) {
        List<Type> types = typeService.findAll();
        request.setAttribute("types", types);
        RequestDispatcher dispatcher = request.getRequestDispatcher("type/listType.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewType(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("type/addNewType.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditTypeForm(HttpServletRequest request, HttpServletResponse response) {
        String typeId = request.getParameter("typeId");
        Type type = typeService.selectType(typeId);
        request.setAttribute("type", type);
        RequestDispatcher dispatcher = request.getRequestDispatcher("type/editType.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteTypeForm(HttpServletRequest request, HttpServletResponse response) {
        String typeId = request.getParameter("typeId");
        Type type = typeService.selectType(typeId);
        request.setAttribute("type", type);
        RequestDispatcher dispatcher = request.getRequestDispatcher("type/deleteType.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewType(HttpServletRequest request, HttpServletResponse response) {
        String typeId = request.getParameter("typeId");
        String typeName = request.getParameter("typeName");
        String typeStatus = request.getParameter("typeStatus");
        Type type = new Type(typeId, typeName, typeStatus);
        typeService.addNewType(type);
        RequestDispatcher dispatcher = request.getRequestDispatcher("type/addNewType.jsp");
        request.setAttribute("message", "Add New Type Successfully!");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editType(HttpServletRequest request, HttpServletResponse response) {
        String typeId = request.getParameter("typeId");
        String typeName = request.getParameter("typeName");
        String typeStatus = request.getParameter("typeStatus");
        Type type = typeService.searchTypeById(typeId);
        type.setTypeId(typeId);
        type.setTypeName(typeName);
        type.setTypeStatus(typeStatus);
        try {
            typeService.update(typeId, type);
            request.setAttribute("type ", type);
            request.setAttribute("message", "Type information was updated!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("type/editType.jsp");
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void deleteType(HttpServletRequest request, HttpServletResponse response) {
        String typeId = request.getParameter("typeId");
        try {
            typeService.delete(typeId);
            response.sendRedirect("/types");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void tableTypes(HttpServletRequest request, HttpServletResponse response) {
        List<Type> types = typeService.findAll();
        request.setAttribute("types", types);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/addNewDeck.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void searchTypeByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String typeName = request.getParameter("searchTypeByName");
        List<Type> typesByName = typeService.searchTypeByName(typeName);
        request.setAttribute("types", typesByName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("type/listType.jsp");
        dispatcher.forward(request, response);
    }
}
