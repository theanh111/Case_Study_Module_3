package service;

import model.Brand;
import model.Deck;
import model.Type;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class DeckServiceImpl implements IDeckService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/skateshop?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "TheanHtran111@";


    private static final String SELECT_ALL_DECK_SQL = "{CALL selectAllDeckSQL()}";
    private static final String SEARCH_DECK_BY_ID = "{CALL searchDeckById(?)}";
    private static final String ADD_NEW_DECK = "{CALL addNewDeck(?,?,?,?,?,?,?,?)}";
    private static final String ADD_NEW_TYPE = "{CALL addNewType(?,?,?)}";
    private static final String ADD_NEW_BRAND = "{CALL addNewBrand(?,?,?)}";
    private static final String DELETE_DECK_BY_ID = "{CALL deleteDeckById(?)}";
    private static final String SEARCH_BRAND_BY_ID = "{CALL searchBrandById(?)}";
    private static final String SEARCH_TYPE_BY_ID = "{CALL searchTypeById(?)}";

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
                Type typeId = searchTypeById(rs.getString("typeId"));
                Brand brandId = searchBrandById(rs.getString("brandId"));
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
                Type typeId = searchTypeById(rs.getString("typeId"));
                Brand brandId = searchBrandById(rs.getString("brandId"));
                deck = new Deck(deckId, deckName, deckPrice, deckSize, deckImage, deckDesc, typeId, brandId);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return deck;
    }

    @Override
    public void add(Deck deck) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(ADD_NEW_DECK)) {
            callableStatement.setInt(1, deck.getDeckId());
            callableStatement.setString(2, deck.getDeckName());
            callableStatement.setDouble(3, deck.getDeckPrice());
            callableStatement.setDouble(4, deck.getDeckSize());
            callableStatement.setString(5, deck.getDeckImage());
            callableStatement.setString(6, deck.getDeckDescription());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public boolean update(int id, Deck deck) throws SQLException {
        return false;
    }

    @Override
    public void delete(int deckId) throws SQLException {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_DECK_BY_ID)) {
            callableStatement.setInt(1, deckId);
        }
    }

    public Type addNewType(Type type) {
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_TYPE);
            callableStatement.setString(1, type.getTypeId());
            callableStatement.setString(2, type.getTypeName());
            callableStatement.setString(3, type.getTypeStatus());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return type;
    }

    public Brand addNewBrand(Brand brand) {
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_BRAND);
            callableStatement.setString(1, brand.getBrandId());
            callableStatement.setString(2, brand.getBrandName());
            callableStatement.setString(3, brand.getBrandAddress());
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return brand;
    }

    public Brand searchBrandById(String brandId) {
        Brand brand = null;
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_BRAND_BY_ID);
            callableStatement.setString(1, brandId);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String brandName = rs.getString("brandName");
                String brandAddress = rs.getString("brandAddress");
                brand = new Brand(brandId, brandName, brandAddress);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return brand;
    }

    public Type searchTypeById(String typeId) {
        Type type = null;
        Connection connection = getConnection();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_TYPE_BY_ID);
            callableStatement.setString(1, typeId);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String typeName = rs.getString("typeName");
                String typeStatus = rs.getString("typeStatus");
                type = new Type(typeId, typeName, typeStatus);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return type;
    }
}
