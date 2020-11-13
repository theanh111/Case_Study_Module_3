package service;

import model.Customer;
import model.Deck;

import java.sql.*;

public class CustomerService implements ICustomerService {

    private static final String FIND_CUSTOMER_BY_USERNAME = "{CALL findCustomerByUsername(?)}";
    private static final String ADD_NEW_CUSTOMER = "{CALL addNewCustomer(?,?,?,?,?,?)}";

    private String jdbcURL = "jdbc:mysql://localhost:3306/skateshop?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "TheanHtran111@";

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
    public Customer findCustomerByUsername(String username) {
        Customer customer = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(FIND_CUSTOMER_BY_USERNAME)) {
            callableStatement.setString(1, username);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                int customerId = rs.getInt("customerId");
                String customerName = rs.getString("customerName");
                String customerPhone = rs.getString("customerPhone");
                String customerAddress = rs.getString("customerAddress");
                String customerUsername = rs.getString("username");
                String customerPassword = rs.getString("password");
                customer = new Customer(customerId, customerName, customerPhone, customerAddress, customerUsername, customerPassword);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return customer;
    }

    @Override
    public void registerNewCustomer(Customer customer) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(ADD_NEW_CUSTOMER)) {
            callableStatement.setInt(1, customer.getCustomerId());
            callableStatement.setString(2, customer.getCustomerName());
            callableStatement.setString(3, customer.getCustomerPhone());
            callableStatement.setString(4, customer.getCustomerAddress());
            callableStatement.setString(5, customer.getUsername());
            callableStatement.setString(6, customer.getPassword());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }
}
