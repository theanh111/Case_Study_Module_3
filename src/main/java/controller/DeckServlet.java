package controller;

import javafx.scene.Parent;
import model.Brand;
import model.Deck;
import model.Type;
import service.DeckServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.List;

@WebServlet(name = "DeckServlet", urlPatterns = "/decks")
public class DeckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeckServiceImpl deckService;

    public void init() {
        deckService = new DeckServiceImpl();
    }

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "view":
                viewDeck(request, response);
                break;
            case "addNewDeck":
                showAddNewDeck(request, response);
                break;
            case "addNewType":
                showAddNewType(request, response);
                break;
            case "addNewBrand":
                showAddNewBrand(request, response);
                break;
            case "edit":
                System.out.println("edit form");
                break;
            case "delete":
                showDeleteForm(request, response);
                break;
            default:
                listDecks(request, response);
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
            case "addNewDeck":
                addNewDeck(request, response);
                break;
            case "addNewBrand":
                addNewBrand(request, response);
                break;
            case "addNewType":
                addNewType(request, response);
                break;
            case "edit":
                System.out.println("edit");
                break;
            case "delete":
                deleteDeck(request, response);
                break;
            default:
                listDecks(request, response);
                break;
        }
    }

    private void listDecks(HttpServletRequest request, HttpServletResponse response) {
        List<Deck> decks = deckService.findAll();
        request.setAttribute("decks", decks);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/list.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewDeck(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/addNewDeck.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewBrand(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/addNewBrand.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showAddNewType(HttpServletRequest request, HttpServletResponse response) {
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/addNewType.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteForm(HttpServletRequest request, HttpServletResponse response) {
        int deckId = Integer.parseInt(request.getParameter("deckId"));
        Deck deck = deckService.selectDeck(deckId);
        request.setAttribute("deck", deck);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/delete.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void viewDeck(HttpServletRequest request, HttpServletResponse response) {
        int deckId = Integer.parseInt(request.getParameter("deckId"));
        Deck deck = deckService.selectDeck(deckId);
        request.setAttribute("deck", deck);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/view.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void addNewDeck(HttpServletRequest request, HttpServletResponse response) {
        String deckName = request.getParameter("deckName");
        double deckPrice = Double.parseDouble(request.getParameter("deckPrice"));
        double deckSize = Double.parseDouble(request.getParameter("deckSize"));
        String typeId = request.getParameter("typeId");
        String brandId = request.getParameter("brandId");
        String deckDesc = request.getParameter("deckDesc");
        String deckImage = request.getParameter("deckImage");
    }

    private void addNewType(HttpServletRequest request, HttpServletResponse response) {
        String typeId = request.getParameter("typeId");
        String typeName = request.getParameter("typeName");
        String typeStatus = request.getParameter("typeStatus");
        Type type = new Type(typeId, typeName, typeStatus);
        deckService.addNewType(type);
    }

    private void addNewBrand(HttpServletRequest request, HttpServletResponse response) {
        String brandId = request.getParameter("brandId");
        String brandName = request.getParameter("brandName");
        String brandAddress = request.getParameter("brandAddress");
        Brand brand = new Brand(brandId, brandName, brandAddress);
        deckService.addNewBrand(brand);
    }

    private void deleteDeck(HttpServletRequest request, HttpServletResponse response) {
        int deckId = Integer.parseInt(request.getParameter("deckId"));
        try {
            deckService.delete(deckId);
            response.sendRedirect("/decks");
        } catch (IOException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
