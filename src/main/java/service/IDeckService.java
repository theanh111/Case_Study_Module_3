package service;

import model.Brand;
import model.Deck;
import model.Type;

import java.sql.SQLException;
import java.util.List;

public interface IDeckService {
    List<Deck> findAll();

    Deck selectDeck(int deckId);

    void add(Deck deck);

    boolean update(int deckId, Deck deck) throws SQLException;

    void delete(int deckId) throws SQLException;
}