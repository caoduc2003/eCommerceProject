package com.ecommerce.DAO;

import com.ecommerce.models.TransportUnit;
import com.ecommerce.utils.DBContext;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class TransportUnitDAO extends DBContext {
    public ArrayList<TransportUnit> getAllTransportUnit() throws Exception {
        ArrayList<TransportUnit> transportUnits = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;

        try {
            if (connection != null) {
                String sql = "SELECT * FROM TransportUnit";
                stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int transportUnitID = rs.getInt("id");
                    String transportUnitName = rs.getString("tu_name");
                    int tuMinShipTime = rs.getInt("tu_min_ship_time");
                    int tuMaxShipTime = rs.getInt("tu_max_ship_time");
                    int tuShipCost = rs.getInt("tu_ship_cost");
                    String tuType = rs.getString("tu_type");
                    TransportUnit transportUnit = new TransportUnit(transportUnitID, transportUnitName, tuMinShipTime, tuMaxShipTime, tuShipCost, tuType);
                    transportUnits.add(transportUnit);
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return transportUnits;
    }

    public int getLastTransportUnitID() throws Exception {
        PreparedStatement stm = null;
        ResultSet rs = null;
        int lastTransportUnitID = 0;
        try {
            if (connection != null) {
                String sql = "SELECT TOP 1 id FROM TransportUnit ORDER BY id DESC";
                stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
                while (rs.next()) {
                    lastTransportUnitID = rs.getInt("id");
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return lastTransportUnitID;
    }

    public void addTransportUnit(String transportUnitName, int tuMinShipTime, int tuMaxShipTime, int tuShipCost, String tuType) {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                String sql = "INSERT INTO TransportUnit VALUES (?, ?, ?, ?, ?, ?)";
                stm = connection.prepareStatement(sql);
                int lastTransportUnitID = getLastTransportUnitID();
                stm.setInt(1, lastTransportUnitID + 1);
                stm.setString(2, transportUnitName);
                stm.setInt(3, tuMinShipTime);
                stm.setInt(4, tuShipCost);
                stm.setInt(5, tuMaxShipTime);
                stm.setString(6, tuType);
                stm.executeUpdate();
            }
        } catch (Exception e) {
            System.err.println(e);
        }
    }

    public TransportUnit getTransportUnitByID(int id) throws Exception{
        TransportUnit transportUnit = null;
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                String sql = "SELECT * FROM TransportUnit WHERE id = ?";
                stm = connection.prepareStatement(sql);
                stm.setInt(1, id);
                rs = stm.executeQuery();
                while (rs.next()) {
                    int transportUnitID = rs.getInt("id");
                    String transportUnitName = rs.getString("tu_name");
                    int tuMinShipTime = rs.getInt("tu_min_ship_time");
                    int tuMaxShipTime = rs.getInt("tu_max_ship_time");
                    int tuShipCost = rs.getInt("tu_ship_cost");
                    String tuType = rs.getString("tu_type");
                    transportUnit = new TransportUnit(transportUnitID, transportUnitName, tuMinShipTime, tuMaxShipTime, tuShipCost, tuType);
                }
            }
        } catch (Exception e) {
            System.err.println(e);
        }
        return transportUnit;
    }
}
