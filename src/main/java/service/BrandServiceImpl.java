package service;

import model.Brand;
import model.Type;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandServiceImpl implements IBrandService {
    private String jdbcURL = "jdbc:mysql://localhost:3306/skateshop?useSSL=false";
    private String jdbcUsername = "root";
    private String jdbcPassword = "TheanHtran111@";

    private static final String SELECT_ALL_BRAND_SQL = "{CALL selectAllBrandSQL()}";
    private static final String SELECT_BRAND_BY_ID = "{CALL searchBrandById(?)}";
    private static final String DELETE_BRAND_BY_ID = "{CALL deleteBrandById(?)}";


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
    public List<Brand> findAll() {
        List<Brand> brands = new ArrayList<>();
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_BRAND_SQL)) {
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String brandId = rs.getString("brandId");
                String brandName = rs.getString("brandName");
                String brandAddress = rs.getString("brandAddress");
                brands.add(new Brand(brandId, brandName, brandAddress));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return brands;
    }

    @Override
    public Brand selectBrand(String brandId) {
        Brand brand = null;
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(SELECT_BRAND_BY_ID)) {
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

    @Override
    public void update(String brandId, Brand brand) {

    }

    @Override
    public void delete(String brandId) {
        try (Connection connection = getConnection();
             CallableStatement callableStatement = connection.prepareCall(DELETE_BRAND_BY_ID)) {
            callableStatement.setString(1, brandId);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }
}
