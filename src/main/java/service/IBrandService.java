package service;

import model.Brand;

import java.util.List;

public interface IBrandService {
    List<Brand> findAll();

    Brand searchBrandById(String brandId);

    Brand selectBrand(String brandId);
    void addNewBrand(Brand brand);

    void update(String brandId, Brand brand);

    void delete(String brandId);
}
