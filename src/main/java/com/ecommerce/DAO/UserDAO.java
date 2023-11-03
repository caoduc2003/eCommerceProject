package com.ecommerce.DAO;

import java.sql.Date;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.SQLException;
import java.util.ArrayList;

import com.ecommerce.utils.DBContext;
import com.ecommerce.models.User;

public class UserDAO extends DBContext {

    public User checkLogin(String emailP, String password)
            throws SQLException, ClassNotFoundException {
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB

            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT * FROM Users WHERE email = ? AND password = ? ";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setString(1, emailP);
                stm.setString(2, password);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if (rs.next() && rs.getString("account_status").equals("Active")) {
                    int userID = rs.getInt("user_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String accountStatus = rs.getString("account_status");
                    Date dateCreated = rs.getDate("date_created");
                    Date dob = rs.getDate("dob");
                    String phone = rs.getString("phone_number");
                    String gender = rs.getString("gender");
                    String username = rs.getString("username");
                    String profilePicture = rs.getString("profile_picture");
                    String password1 = rs.getString("password");
                    return new User(userID,firstName,lastName,username,dob,email,password1,role,phone,dateCreated,gender,accountStatus,profilePicture);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public User getUserByID(int userID) throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB
            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT * FROM Users WHERE user_id = ? ";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setInt(1, userID);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if(rs.next()){
                    int id = rs.getInt("user_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String accountStatus = rs.getString("account_status");
                    Date dateCreated = rs.getDate("date_created");
                    Date dob = rs.getDate("dob");
                    String phone = rs.getString("phone_number");
                    String gender = rs.getString("gender");
                    String username = rs.getString("username");
                    String profilePicture = rs.getString("profile_picture");
                    String password1 = rs.getString("password");
                    return new User(id,firstName,lastName,username,dob,email,password1,role,phone,dateCreated,gender,accountStatus,profilePicture);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }

    public ArrayList<User> getAllUsers() throws Exception{
        ArrayList<User> users = new ArrayList<>();
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                String sql = "SELECT * FROM Users";
                stm = connection.prepareStatement(sql);
                rs = stm.executeQuery();
                while(rs.next()){
                    int id = rs.getInt("user_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String email = rs.getString("email");
                    String role = rs.getString("role");
                    String accountStatus = rs.getString("account_status");
                    Date dateCreated = rs.getDate("date_created");
                    Date dob = rs.getDate("dob");
                    String phone = rs.getString("phone_number");
                    String gender = rs.getString("gender");
                    String username = rs.getString("username");
                    String profilePicture = rs.getString("profile_picture");
                    String password1 = rs.getString("password");
                    User u = new User(id,firstName,lastName,username,dob,email,password1,role,phone,dateCreated,gender,accountStatus,profilePicture);
                    users.add(u);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return users;
    }

    public int updateUserByID(User user) throws Exception{
        PreparedStatement ps = null;
        try{
            String sql = "Update Users\n" +
                    "SET first_name      = ?,\n" +
                    "    last_name       = ?,\n" +
                    "    dob             = ?,\n" +
                    "    email           = ?,\n" +
                    "    password        = ?,\n" +
                    "    phone_number    = ?,\n" +
                    "    profile_picture = ?,\n" +
                    "    account_status  = ?,\n" +
                    "    role            = ?,\n" +
                    "    gender          = ?,\n" +
                    "    username        = ?\n" +
                    "WHERE user_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setString(1, user.getFirstName());
            ps.setString(2, user.getLastName());
            ps.setDate(3, user.getDob());
            ps.setString(4, user.getEmail());
            ps.setString(5, user.getPassword());
            ps.setString(6, user.getPhoneNum());
            ps.setString(7, user.getProfilePicture());
            ps.setString(8, user.getAccountStatus());
            ps.setString(9, user.getRole());
            ps.setString(10, user.getGender());
            ps.setString(11, user.getUsername());
            ps.setInt(12, user.getUserID());
            int rowUpdate =  ps.executeUpdate();
            if (rowUpdate > 0) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public int deleteUserByID(int id) throws Exception {
        PreparedStatement ps = null;
        try{
            String sql = "DELETE FROM Users WHERE user_id = ?";
            ps = connection.prepareStatement(sql);
            ps.setInt(1, id);
            int rowUpdate =  ps.executeUpdate();
            if (rowUpdate > 0) {
                return 1;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return 0;
    }

    public boolean addUser(User userObj) throws Exception{
        PreparedStatement ps = null;
        try{
            String sql = "INSERT INTO Users (first_name, last_name, dob, email, password, phone_number, profile_picture, date_created,\n" +
                    "                   account_status, role, gender, username)\n" +
                    "VALUES (?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?, ?)";
            ps = connection.prepareStatement(sql);
            ps.setString(1, userObj.getFirstName());
            ps.setString(2, userObj.getLastName());
            ps.setDate(3, userObj.getDob());
            ps.setString(4, userObj.getEmail());
            ps.setString(5, userObj.getPassword());
            ps.setString(6, userObj.getPhoneNum());
            ps.setString(7, userObj.getProfilePicture());
            ps.setDate(8, userObj.getDateCreated());
            ps.setString(9, userObj.getAccountStatus());
            ps.setString(10, userObj.getRole());
            ps.setString(11, userObj.getGender());
            ps.setString(12, userObj.getUsername());
            int rowUpdate =  ps.executeUpdate();
            if (rowUpdate > 0) {
                return true;
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkEmail(String email) throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                String sql = "SELECT * FROM Users WHERE email = ? ";
                stm = connection.prepareStatement(sql);
                stm.setString(1, email);
                rs = stm.executeQuery();
                if(rs.next()){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public boolean checkPassword(String password) throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            if (connection != null) {
                String sql = "SELECT * FROM Users WHERE password = ? ";
                stm = connection.prepareStatement(sql);
                stm.setString(1, password);
                rs = stm.executeQuery();
                if(rs.next()){
                    return true;
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return false;
    }

    public User getUserByEmail(String email) throws Exception{
        PreparedStatement stm = null;
        ResultSet rs = null;
        try {
            //1. Connect DB

            if (connection != null) {
                //2. Create SQL String
                String sql = "SELECT * FROM Users WHERE email = ? ";
                //3. Create Statement
                stm = connection.prepareStatement(sql);
                stm.setString(1, email);
                //4. Excute Query
                rs = stm.executeQuery();
                //5. Process Result
                if(rs.next()){
                    int id = rs.getInt("user_id");
                    String firstName = rs.getString("first_name");
                    String lastName = rs.getString("last_name");
                    String uEmail = rs.getString("email");
                    String role = rs.getString("role");
                    String accountStatus = rs.getString("account_status");
                    Date dateCreated = rs.getDate("date_created");
                    Date dob = rs.getDate("dob");
                    String phone = rs.getString("phone_number");
                    String gender = rs.getString("gender");
                    String username = rs.getString("username");
                    String profilePicture = rs.getString("profile_picture");
                    String password1 = rs.getString("password");
                    return new User(id,firstName,lastName,username,dob,uEmail,password1,role,phone,dateCreated,gender,accountStatus,profilePicture);
                }
            }
        } catch (Exception e) {
            e.printStackTrace();
        }
        return null;
    }
}
