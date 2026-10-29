package org.example.realestateagentfinderandappointmentsystem.models;

public class Property {
    private String propertyTitle;
    private String propertyType;
    private String addedByAgent;
    private double price;
    private String status;
    private String address;
    private String city;
    private String province;
    private int bedroomCount;
    private int bathroomCount;
    private double size;
    private String builtYear;
    private String[] amenities;
    private String propertyImage;

    public Property() {}

    public Property(String propertyTitle, String propertyType, String addedByAgent, double price, String status, String address, String city, String province, int bedroomCount, int bathroomCount, double size, String builtYear, String[] amenities) {
        this.propertyTitle = propertyTitle;
        this.propertyType = propertyType;
        this.addedByAgent = addedByAgent;
        this.price = price;
        this.status = status;
        this.address = address;
        this.city = city;
        this.province = province;
        this.bedroomCount = bedroomCount;
        this.bathroomCount = bathroomCount;
        this.size = size;
        this.builtYear = builtYear;
        this.amenities = amenities;
    }

    public String getPropertyTitle() {
        return propertyTitle;
    }

    public String getPropertyType() {
        return propertyType;
    }

    public String getAddedByAgent() {
        return addedByAgent;
    }

    public double getPrice() {
        return price;
    }

    public String getStatus() {
        return status;
    }

    public String getAddress() {
        return address;
    }

    public String getProvince() {
        return province;
    }

    public String getCity() {
        return city;
    }

    public int getBedroomCount() {
        return bedroomCount;
    }

    public int getBathroomCount() {
        return bathroomCount;
    }

    public String getBuiltYear() {
        return builtYear;
    }

    public double getSize() {
        return size;
    }

    public String[] getAmenities() {
        return amenities;
    }

    public void setPropertyImage(String propertyImage) {
        this.propertyImage = propertyImage;
    }

    public String getPropertyImage() {
        return propertyImage;
    }

}
