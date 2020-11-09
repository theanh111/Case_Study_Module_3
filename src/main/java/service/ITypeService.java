package service;

import model.Type;

import java.util.List;

public interface ITypeService {
    List<Type> findAll();

    Type searchTypeById(String typeId);

    Type selectType(String typeId);
    void addNewType(Type type);

    void update(String typeId, Type type);

    void delete(String typeId);
}
