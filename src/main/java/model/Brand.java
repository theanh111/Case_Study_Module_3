package model;

public class Brand {
    private String brandId;
    private String brandName;
    private String brandAddress;

    public Brand() {
    }

    public Brand(String brandId) {
        this.brandId = brandId;
    }

    public Brand(String brandId, String brandName, String brandAddress) {
        this.brandId = brandId;
        this.brandName = brandName;
        this.brandAddress = brandAddress;
    }

    public String getBrandId() {
        return brandId;
    }

    public void setBrandId(String brandId) {
        this.brandId = brandId;
    }

    public String getBrandName() {
        return brandName;
    }

    public void setBrandName(String brandName) {
        this.brandName = brandName;
    }

    public String getBrandAddress() {
        return brandAddress;
    }

    public void setBrandAddress(String brandAddress) {
        this.brandAddress = brandAddress;
    }
}
