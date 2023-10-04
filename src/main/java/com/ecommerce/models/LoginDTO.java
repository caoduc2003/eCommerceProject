package com.ecommerce.models;

import java.io.Serializable;
public class LoginDTO implements Serializable {
    private String email;
    private String password;
    private String role;
    private String account_status;

    public LoginDTO() {
    }

    public LoginDTO(String email, String password, String role, String account_status) {
        this.email = email;
        this.password = password;
        this.role = role;
        this.account_status = account_status;
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

    public String getAccount_status() {
        return account_status;
    }

    public void setAccount_status(String account_status) {
        this.account_status = account_status;
    }
}
