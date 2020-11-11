package controller;

import com.sun.corba.se.spi.protocol.RequestDispatcherDefault;
import model.Deck;
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
            case "SizeLowToHigh":
                sizeLowToHigh(request, response);
                break;
            case "SizeHighToLow":
                sizeHighToLow(request, response);
                break;
            case "PriceLowToHigh":
                priceLowToHigh(request, response);
                break;
            case "PriceHighToLow":
                priceHighToLow(request, response);
                break;
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
        request.setCharacterEncoding("UTF-8");
        response.setCharacterEncoding("UTF-8");
        response.setContentType("text/html; charset=UTF-8");
        String action = request.getParameter("action");
        if (action == null) {
            action = "";
        }
//        switch (action) {
//            case "login":
//                login(request, response);
//                break;
//        }
    }

//    private void login(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
//        String username = request.getParameter("username");
//        String password = request.getParameter("password");
//        if (username.equals("admin") && password.equals("admin")) {
//            response.sendRedirect("/decks");
//        } else {
//            RequestDispatcher dispatcher = request.getRequestDispatcher("customer/error404.jsp");
//            request.setAttribute("message", "Wrong Information!");
//            dispatcher.forward(request, response);
//        }
//    }

    private void searchDeckByName(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        String deckName = request.getParameter("searchDeckByName");
        List<Deck> decksByName = deckService.searchDeckByName(deckName);
        request.setAttribute("decks", decksByName);
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        dispatcher.forward(request, response);
    }

    private void sizeLowToHigh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Deck> decksSizeFromLowToHigh = deckService.sortSizeFromLowToHigh();
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        request.setAttribute("decks", decksSizeFromLowToHigh);
        dispatcher.forward(request, response);
    }

    private void sizeHighToLow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Deck> decksSizeFromHighToLow = deckService.sortSizeFromHighToLow();
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        request.setAttribute("decks", decksSizeFromHighToLow);
        dispatcher.forward(request, response);
    }

    private void priceLowToHigh(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Deck> decksPriceFromLowToHigh = deckService.sortPriceFromLowToHigh();
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        request.setAttribute("decks", decksPriceFromLowToHigh);
        dispatcher.forward(request, response);
    }

    private void priceHighToLow(HttpServletRequest request, HttpServletResponse response) throws ServletException, IOException {
        List<Deck> decksPriceFromHighToLow = deckService.sortPriceFromHighToLow();
        RequestDispatcher dispatcher = request.getRequestDispatcher("home/home.jsp");
        request.setAttribute("decks", decksPriceFromHighToLow);
        dispatcher.forward(request, response);
    }
}
