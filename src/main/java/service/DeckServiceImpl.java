package service;

import model.Brand;
import model.Customer;
import model.Deck;
import model.Type;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeckServiceImpl implements IDeckService {
    BrandServiceImpl brandService = new BrandServiceImpl();
    TypeServiceImpl typeService = new TypeServiceImpl();

    private String jdbcURL = "jdbc:mysql://localhost:3306/skateshop?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "TheanHtran111@";

    private static final String SELECT_ALL_DECK_SQL = "{CALL selectAllDeckSQL()}";
    private static final String SEARCH_DECK_BY_ID = "{CALL searchDeckById(?)}";
    private static final String SEARCH_DECK_BY_NAME = "{CALL searchDeckByName(?)}";
    private static final String ADD_NEW_DECK = "{CALL addNewDeck(?,?,?,?,?,?,?,?)}";
    private static final String UPDATE_DECK_BY_ID = "{CALL updateDeckById(?,?,?,?,?,?,?,?)}";
    private static final String DELETE_DECK_BY_ID = "{CALL deleteDeckById(?)}";

    protected Connection getConnection() {
        Connection connection = null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection = DriverManager.getConnection(jdbcURL, jdbcUsername, jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return connection;
    }

    @Override
    public List<Deck> searchDeckByName(String deckName) {
        List<Deck> decksByName = new ArrayList<>();
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_DECK_BY_NAME);
            callableStatement.setString(1, deckName);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int deckId = rs.getInt("deckId");
                String deckNameSearched = rs.getString("deckName");
                double deckPrice = rs.getDouble("deckPrice");
                double deckSize = rs.getDouble("deckSize");
                String deckImage = rs.getString("deckImage");
                String deckDesc = rs.getString("deckDescription");
                Type typeId = typeService.searchTypeById(rs.getString("typeId"));
                Brand brandId = brandService.searchBrandById(rs.getString("brandId"));
                decksByName.add(new Deck(deckId, deckNameSearched, deckPrice, deckSize, deckImage, deckDesc, typeId, brandId));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return decksByName;
    }

    @Override
    public List<Deck> findAll() {
        List<Deck> decks = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_DECK_SQL)) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int deckId = rs.getInt("deckId");
                String deckName = rs.getString("deckName");
                double deckPrice = rs.getDouble("deckPrice");
                double deckSize = rs.getDouble("deckSize");
                String deckImage = rs.getString("deckImage");
                String deckDesc = rs.getString("deckDescription");
                Type typeId = typeService.searchTypeById(rs.getString("typeId"));
                Brand brandId = brandService.searchBrandById(rs.getString("brandId"));
                decks.add(new Deck(deckId, deckName, deckPrice, deckSize, deckImage, deckDesc, typeId, brandId));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return decks;
    }

    @Override
    public Deck selectDeck(int deckId) {
        Deck deck = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SEARCH_DECK_BY_ID)) {
            callableStatement.setInt(1, deckId);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String deckName = rs.getString("deckName");
                double deckPrice = rs.getDouble("deckPrice");
                double deckSize = rs.getDouble("deckSize");
                String deckImage = rs.getString("deckImage");
                String deckDesc = rs.getString("deckDescription");
                Type typeId = typeService.searchTypeById(rs.getString("typeId"));
                Brand brandId = brandService.searchBrandById(rs.getString("brandId"));
                deck = new Deck(deckId, deckName, deckPrice, deckSize, deckImage, deckDesc, typeId, brandId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return deck;
    }

    @Override
    public void addNewDeck(Deck deck) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(ADD_NEW_DECK)) {
            callableStatement.setInt(1, deck.getDeckId());
            callableStatement.setString(2, deck.getDeckName());
            callableStatement.setDouble(3, deck.getDeckPrice());
            callableStatement.setDouble(4, deck.getDeckSize());
            callableStatement.setString(5, deck.getDeckImage());
            callableStatement.setString(6, deck.getDeckDescription());
            callableStatement.setString(7, deck.getTypeId().getTypeId());
            callableStatement.setString(8, deck.getBrandId().getBrandId());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(int id, Deck deck) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(UPDATE_DECK_BY_ID)) {
            callableStatement.setInt(1, deck.getDeckId());
            callableStatement.setString(2, deck.getDeckName());
            callableStatement.setDouble(3, deck.getDeckPrice());
            callableStatement.setDouble(4, deck.getDeckSize());
            callableStatement.setString(5, deck.getDeckImage());
            callableStatement.setString(6, deck.getDeckDescription());
            callableStatement.setString(7, deck.getTypeId().getTypeId());
            callableStatement.setString(8, deck.getBrandId().getBrandId());
            callableStatement.executeUpdate();
        }
    }

    @Override
    public void delete(int deckId) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_DECK_BY_ID)) {
            callableStatement.setInt(1, deckId);
            callableStatement.executeUpdate();
        }
    }
}
