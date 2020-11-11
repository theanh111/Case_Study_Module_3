package service;

import model.Deck;

import java.sql.SQLException;
import java.util.List;

public interface IDeckService {
    List<Deck> findAll();

    Deck selectDeck(int deckId);

    void addNewDeck(Deck deck);

    void update(int deckId, Deck deck) throws SQLException;

    void delete(int deckId) throws SQLException;

    List<Deck> searchDeckByName(String deckName);

    List<Deck> sortSizeFromLowToHigh();

    List<Deck> sortSizeFromHighToLow();

    List<Deck> sortPriceFromLowToHigh();

    List<Deck> sortPriceFromHighToLow();
}
