package service;

import model.Brand;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

public class BrandServiceImpl implements IBrandService {

    private static final String SELECT_ALL_BRAND_SQL = "{CALL selectAllBrandSQL()}";
    private static final String SELECT_BRAND_BY_ID = "{CALL searchBrandById(?)}";
    private static final String ADD_NEW_BRAND = "{CALL addNewBrand(?,?,?)}";
    private static final String DELETE_BRAND_BY_ID = "{CALL deleteBrandById(?)}";
    private static final String SEARCH_BRAND_BY_ID = "{CALL searchBrandById(?)}";
    private static final String SEARCH_BRAND_BY_NAME = "{CALL searchBrandByName(?)}";
    private static final String UPDATE_BRAND_BY_ID = "{CALL updateBrandById(?,?,?)}";
    private static final String GET_BRAND_BY_NAME = "{CALL getBrandByName(?)}";

    Connection connection = ConnectDB.getConnect();

    @Override
    public List<Brand> findAll() {
        List<Brand> brands = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_ALL_BRAND_SQL);
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
        try {
            CallableStatement callableStatement = connection.prepareCall(SELECT_BRAND_BY_ID);
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
    public void addNewBrand(Brand brand) {
        try {
            CallableStatement callableStatement = connection.prepareCall(ADD_NEW_BRAND);
            callableStatement.setString(1, brand.getBrandId());
            callableStatement.setString(2, brand.getBrandName());
            callableStatement.setString(3, brand.getBrandAddress());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void update(String brandId, Brand brand) {
        try {
            CallableStatement callableStatement = connection.prepareCall(UPDATE_BRAND_BY_ID);
            callableStatement.setString(1, brand.getBrandId());
            callableStatement.setString(2, brand.getBrandName());
            callableStatement.setString(3, brand.getBrandAddress());
            callableStatement.executeUpdate();
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
    }

    @Override
    public void delete(String brandId) {
        try {
            CallableStatement callableStatement = connection.prepareCall(DELETE_BRAND_BY_ID);
            callableStatement.setString(1, brandId);
            callableStatement.executeUpdate();
        } catch (SQLException e) {
            e.printStackTrace();
        }
    }

    @Override
    public Brand searchBrandById(String brandId) {
        Brand brand = null;
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

    @Override
    public List<Brand> searchBrandByName(String brandName) {
        List<Brand> brandsByName = new ArrayList<>();
        try {
            CallableStatement callableStatement = connection.prepareCall(SEARCH_BRAND_BY_NAME);
            callableStatement.setString(1, brandName);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String brandId = rs.getString("brandId");
                String brandNameSearch = rs.getString("brandName");
                String brandAddress = rs.getString("brandAddress");
                brandsByName.add(new Brand(brandId, brandNameSearch, brandAddress));
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return brandsByName;
    }

    @Override
    public Brand getBrandByName(String brandName) {
        Brand brand = null;
        try {
            CallableStatement callableStatement = connection.prepareCall(GET_BRAND_BY_NAME);
            callableStatement.setString(1, brandName);
            ResultSet rs = callableStatement.executeQuery();
            while (rs.next()) {
                String brandId = rs.getString("brandId");
                String brandAddress = rs.getString("brandAddress");
                brand = new Brand(brandId, brandName, brandAddress);
            }
        } catch (SQLException throwables) {
            throwables.printStackTrace();
        }
        return brand;
    }
}
