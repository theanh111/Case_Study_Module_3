package service;

import model.Brand;

import java.util.List;

public interface IBrandService {
    List<Brand> findAll();

    Brand selectBrand(String brandId);

    void update(String brandId, Brand brand);

    void delete(String brandId);
}
