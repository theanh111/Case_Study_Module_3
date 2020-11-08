package service;

import model.Type;

import java.util.List;

public interface ITypeService {
    List<Type> findAll();

    Type selectType(String typeId);

    void update(String typeId, Type type);

    void delete(String typeId);
}
