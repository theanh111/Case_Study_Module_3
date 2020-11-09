package controller;

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
import java.util.List;

@WebServlet(name = "HomeServlet", urlPatterns = "/home")
public class HomeServlet extends HttpServlet {
    private DeckServiceImpl deckService = new DeckServiceImpl();

    protected void doGet(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
        switch (action) {
            case "searchDeckByName":
                searchDeckByName(request, response);
                break;
        }
        List<Deck> decks = deckService.findAll();
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        request.setAttribute("decks", decks);
        dispatcher.forward(request, response);
    }

    protected void doPost(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
    }

    private void searchDeckByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deckName = request.getParameter("searchDeckByName");
        List<Deck> decksByName = deckService.searchDeckByName(deckName);
        request.setAttribute("decks", decksByName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        dispatcher.forward(request, response);
    }
}
