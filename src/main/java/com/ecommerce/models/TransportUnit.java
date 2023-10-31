package com.ecommerce.models;

public class TransportUnit {
    private int transportUnitID;
    private String transportUnitName;
    private int tuMinShipTime;
    private int tuMaxShipTime;
    private int tuShipCost;
    private String tuType;

    public TransportUnit() {
    }

    public TransportUnit(int transportUnitID, String transportUnitName, int tuMinShipTime, int tuMaxShipTime, int tuShipCost, String tuType) {
        this.transportUnitID = transportUnitID;
        this.transportUnitName = transportUnitName;
        this.tuMinShipTime = tuMinShipTime;
        this.tuMaxShipTime = tuMaxShipTime;
        this.tuShipCost = tuShipCost;
        this.tuType = tuType;
    }

    public int getTransportUnitID() {
        return transportUnitID;
    }

    public void setTransportUnitID(int transportUnitID) {
        this.transportUnitID = transportUnitID;
    }

    public String getTransportUnitName() {
        return transportUnitName;
    }

    public void setTransportUnitName(String transportUnitName) {
        this.transportUnitName = transportUnitName;
    }

    public int getTuMinShipTime() {
        return tuMinShipTime;
    }

    public void setTuMinShipTime(int tuMinShipTime) {
        this.tuMinShipTime = tuMinShipTime;
    }

    public int getTuMaxShipTime() {
        return tuMaxShipTime;
    }

    public void setTuMaxShipTime(int tuMaxShipTime) {
        this.tuMaxShipTime = tuMaxShipTime;
    }

    public int getTuShipCost() {
        return tuShipCost;
    }

    public void setTuShipCost(int tuShipCost) {
        this.tuShipCost = tuShipCost;
    }

    public String getTuType() {
        return tuType;
    }

    public void setTuType(String tuType) {
        this.tuType = tuType;
    }
}
