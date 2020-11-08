package model;

public class Type {
    private String typeId;
    private String typeName;
    private String typeStatus;

    public Type() {
    }

    public Type(String typeId) {
        this.typeId = typeId;
    }

    public Type(String typeId, String typeName, String typeStatus) {
        this.typeId = typeId;
        this.typeName = typeName;
        this.typeStatus = typeStatus;
    }

    public String getTypeId() {
        return typeId;
    }

    public void setTypeId(String typeId) {
        this.typeId = typeId;
    }

    public String getTypeName() {
        return typeName;
    }

    public void setTypeName(String typeName) {
        this.typeName = typeName;
    }

    public String getTypeStatus() {
        return typeStatus;
    }

    public void setTypeStatus(String typeStatus) {
        this.typeStatus = typeStatus;
    }
}
