package com.ecommerce.utils;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.SQLException;
import java.util.logging.Level;
import java.util.logging.Logger;

public class DBContext {

    protected Connection connection;

    public DBContext() {
        try {
            Class.forName("com.microsoft.sqlserver.jdbc.SQLServerDriver");
            String user = "ducldc";
            String pass= "123456";
            String url = "jdbc:sqlserver:"
                    + "//localhost:1433"
                    + ";databaseName=eCommerceProject;integratedSecurity=false;"
                    +"encrypt=true;trustServerCertificate=true";
            connection = DriverManager.getConnection(url, user, pass);

        } catch (ClassNotFoundException | SQLException ex) {
            Logger.getLogger(DBContext.class.getName()).log(Level.SEVERE, null, ex);
        }

    }
}
