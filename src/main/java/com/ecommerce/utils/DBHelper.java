package com.ecommerce.utils;

import java.io.Serializable;
import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;

public class DBHelper implements Serializable {
    public static Connection makeConnection() throws ClassNotFoundException, SQLException {
        // 1. Load Driver
        Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
        // 2. Create Connection String
        String url = "jdbc:sqlserver:"
                + "//localhost:1433"
                + ";databaseName=eCommerceProject;integratedSecurity=false;"
                +"encrypt=true;trustServerCertificate=true";
        // 3. Open Connection
        Connection con = DriverManager.getConnection(url, "ducldc", "123456");
        return con;
    }
}
