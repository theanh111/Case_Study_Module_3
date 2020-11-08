package model;

public class Deck {
    private int deckId;
    private String deckName;
    private double deckPrice;
    private double deckSize;
    private String deckImage;
    private String deckDescription;
    private Type typeId;
    private Brand brandId;

    public Deck() {
    }

    public Deck(String deckName, double deckPrice, double deckSize, String deckImage, String deckDescription, Type typeId, Brand brandId) {
        this.deckName = deckName;
        this.deckPrice = deckPrice;
        this.deckSize = deckSize;
        this.deckImage = deckImage;
        this.deckDescription = deckDescription;
        this.typeId = typeId;
        this.brandId = brandId;
    }

    public Deck(int deckId, String deckName, double deckPrice, double deckSize, String deckImage, String deckDescription, Type typeId, Brand brandId) {
        this.deckId = deckId;
        this.deckName = deckName;
        this.deckPrice = deckPrice;
        this.deckSize = deckSize;
        this.deckImage = deckImage;
        this.deckDescription = deckDescription;
        this.typeId = typeId;
        this.brandId = brandId;
    }

    public int getDeckId() {
        return deckId;
    }

    public void setDeckId(int deckId) {
        this.deckId = deckId;
    }

    public String getDeckName() {
        return deckName;
    }

    public void setDeckName(String deckName) {
        this.deckName = deckName;
    }

    public double getDeckPrice() {
        return deckPrice;
    }

    public void setDeckPrice(double deckPrice) {
        this.deckPrice = deckPrice;
    }

    public double getDeckSize() {
        return deckSize;
    }

    public void setDeckSize(double deckSize) {
        this.deckSize = deckSize;
    }

    public String getDeckImage() {
        return deckImage;
    }

    public void setDeckImage(String deckImage) {
        this.deckImage = deckImage;
    }

    public String getDeckDescription() {
        return deckDescription;
    }

    public void setDeckDescription(String deckDescription) {
        this.deckDescription = deckDescription;
    }

    public Type getTypeId() {
        return typeId;
    }

    public void setTypeId(Type typeId) {
        this.typeId = typeId;
    }

    public Brand getBrandId() {
        return brandId;
    }

    public void setBrandId(Brand brandId) {
        this.brandId = brandId;
    }
}
