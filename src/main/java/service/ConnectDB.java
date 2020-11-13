package service;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class ConnectDB {
    private static String jdbcURL = "jdbc:mysql://localhost:3306/skateshop?serverTimezone=UTC";
    private static String jdbcUsername = "root";
    private static String jdbcPassword = "TheanHtran111@";

    public static Connection getConnect(){
        Connection connection=null;
        try {
            Class.forName("com.mysql.cj.jdbc.Driver");
            connection=DriverManager.getConnection(jdbcURL,jdbcUsername,jdbcPassword);
        } catch (ClassNotFoundException e) {
            e.printStackTrace();
        } catch (SQLException e) {
            e.printStackTrace();
        }
        return connection;
    }
}
