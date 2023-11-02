package com.ecommerce.models;

import com.google.gson.annotations.SerializedName;

import java.io.Serializable;
import java.sql.Date;

public class User{
    private int userID;
    private String firstName;
    private String lastName;
    private String username;
    private Date dob;
    private String email;
    private String password;
    private String role;
    private String phoneNum;
    private Date dateCreated;
    private String gender;
    private String accountStatus;
    private String profilePicture;


    public User() {
    }

    public User(int userID, String firstName, String lastName, String username, Date dob, String email, String password, String role, String phoneNum, Date dateCreated, String gender, String accountStatus, String profilePicture) {
        this.userID = userID;
        this.firstName = firstName;
        this.lastName = lastName;
        this.username = username;
        this.dob = dob;
        this.email = email;
        this.password = password;
        this.role = role;
        this.phoneNum = phoneNum;
        this.dateCreated = dateCreated;
        this.gender = gender;
        this.accountStatus = accountStatus;
        this.profilePicture = profilePicture;
    }

    public int getUserID() {
        return userID;
    }

    public void setUserID(int userID) {
        this.userID = userID;
    }

    public String getFirstName() {
        return firstName;
    }

    public void setFirstName(String firstName) {
        this.firstName = firstName;
    }

    public String getLastName() {
        return lastName;
    }

    public void setLastName(String lastName) {
        this.lastName = lastName;
    }

    public String getUsername() {
        return username;
    }

    public void setUsername(String username) {
        this.username = username;
    }

    public Date getDob() {
        return dob;
    }

    public void setDob(Date dob) {
        this.dob = dob;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getRole() {
        return role;
    }

    public void setRole(String role) {
        this.role = role;
    }

    public String getPhoneNum() {
        return phoneNum;
    }

    public void setPhoneNum(String phoneNum) {
        this.phoneNum = phoneNum;
    }

    public Date getDateCreated() {
        return dateCreated;
    }

    public void setDateCreated(Date dateCreated) {
        this.dateCreated = dateCreated;
    }

    public String getGender() {
        return gender;
    }

    public void setGender(String gender) {
        this.gender = gender;
    }

    public String getAccountStatus() {
        return accountStatus;
    }

    public void setAccountStatus(String accountStatus) {
        this.accountStatus = accountStatus;
    }

    public String getProfilePicture() {
        return profilePicture;
    }

    public void setProfilePicture(String profilePicture) {
        this.profilePicture = profilePicture;
    }

    public String getFullName() {
        return firstName + " " + lastName;
    }

}
