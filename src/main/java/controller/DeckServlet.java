package controller;

import model.Brand;
import model.Customer;
import model.Deck;
import model.Type;
import service.BrandServiceImpl;
import service.DeckServiceImpl;
import service.TypeServiceImpl;

import javax.servlet.RequestDispatcher;
import javax.servlet.ServletException;
import javax.servlet.annotation.WebServlet;
import javax.servlet.http.HttpServlet;
import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import java.io.IOException;
import java.sql.SQLException;
import java.util.ArrayList;
import java.util.List;

@WebServlet(name = "DeckServlet", urlPatterns = "/decks")
public class DeckServlet extends HttpServlet {
    private static final long serialVersionUID = 1L;
    private DeckServiceImpl deckService = new DeckServiceImpl();
    private TypeServiceImpl typeService = new TypeServiceImpl();
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
            case "view":
                viewDeck(request, response);
                break;
            case "editDeck":
                showEditDeckForm(request, response);
                break;
            case "deleteDeck":
                showDeleteDeckForm(request, response);
                break;
            case "searchDeckByName":
                searchDeckByName(request, response);
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
            case "editDeck":
                editDeck(request, response);
                break;
            case "deleteDeck":
                deleteDeck(request, response);
                break;
            case "searchDeckByName":
                searchDeckByName(request, response);
                break;
            default:
                listDecks(request, response);
                break;
        }
    }

    private void listDecks(HttpServletRequest request, HttpServletResponse response) {
        List<Type> typeList = typeService.findAll();
        List<Brand> brandList = brandService.findAll();
        List<Deck> decks = deckService.findAll();
        request.setAttribute("types", typeList);
        request.setAttribute("brands", brandList);
        request.setAttribute("decks", decks);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/listDeck.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showEditDeckForm(HttpServletRequest request, HttpServletResponse response) {
        int deckId = Integer.parseInt(request.getParameter("deckId"));
        Deck deck = deckService.selectDeck(deckId);
        request.setAttribute("deck", deck);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/editDeck.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void showDeleteDeckForm(HttpServletRequest request, HttpServletResponse response) {
        int deckId = Integer.parseInt(request.getParameter("deckId"));
        Deck deck = deckService.selectDeck(deckId);
        request.setAttribute("deck", deck);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/deleteDeck.jsp");
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
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/viewDeckInfo.jsp");
        try {
            dispatcher.forward(request, response);
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

//    private void showTypeList(HttpServletRequest request, HttpServletResponse response) {
//        List<Type> typeList = typeService.findAll();
//        List<Brand> brandList = brandService.findAll();
//        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/listDeck.jsp");
//        request.setAttribute("types", typeList);
//        request.setAttribute("brands", brandList);
//        try {
//            dispatcher.forward(request, response);
//        } catch (ServletException e) {
//            e.printStackTrace();
//        } catch (IOException e) {
//            e.printStackTrace();
//        }
//    }

    private void addNewDeck(HttpServletRequest request, HttpServletResponse response) {
        String deckName = request.getParameter("deckName");
        double deckPrice = Double.parseDouble(request.getParameter("deckPrice"));
        double deckSize = Double.parseDouble(request.getParameter("deckSize"));
        String typeId = request.getParameter("typeId");
        String brandId = request.getParameter("brandId");
        String deckDesc = request.getParameter("deckDesc");
        String deckImage = request.getParameter("deckImage");
        Type type = new Type(typeId);
        Brand brand = new Brand(brandId);
        Deck deck = new Deck(deckName, deckPrice, deckSize, deckImage, deckDesc, type, brand);
        deckService.addNewDeck(deck);
//        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/listDeck.jsp");

        try {
//            dispatcher.forward(request, response);
            response.sendRedirect("/decks");
            request.setAttribute("message", "Add New Deck Successfully!");
        } catch (IOException e) {
            e.printStackTrace();
        }
    }

    private void editDeck(HttpServletRequest request, HttpServletResponse response) {
        int deckId = Integer.parseInt(request.getParameter("deckId"));
        String deckName = request.getParameter("deckName");
        double deckPrice = Double.parseDouble(request.getParameter("deckPrice"));
        double deckSize = Double.parseDouble(request.getParameter("deckSize"));
        String deckImage = request.getParameter("deckImage");
        String deckDesc = request.getParameter("deckDesc");
        String typeId = request.getParameter("typeId");
        String brandId = request.getParameter("brandId");
        Deck deck = deckService.selectDeck(deckId);
        Type type = typeService.getTypeByName(typeId);
        Brand brand = brandService.getBrandByName(brandId);
        deck.setDeckName(deckName);
        deck.setDeckPrice(deckPrice);
        deck.setDeckSize(deckSize);
        deck.setDeckImage(deckImage);
        deck.setDeckDescription(deckDesc);
        deck.setTypeId(type);
        deck.setBrandId(brand);
        try {
            deckService.update(deckId, deck);
            request.setAttribute("deck ", deck);
            request.setAttribute("message", "Deck information was updated!");
            RequestDispatcher dispatcher = request.getRequestDispatcher("deck/editDeck.jsp");
            dispatcher.forward(request, response);
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        } catch (ServletException e) {
            e.printStackTrace();
        } catch (IOException e) {
            e.printStackTrace();
        }
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

    private void searchDeckByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deckName = request.getParameter("searchDeckByName");
        List<Deck> decksByName = deckService.searchDeckByName(deckName);
        request.setAttribute("decks", decksByName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("deck/searchDeck.jsp");
        dispatcher.forward(request, response);
    }
}
