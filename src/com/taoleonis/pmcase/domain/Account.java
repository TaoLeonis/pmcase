package com.taoleonis.pmcase.domain;

import java.io.Serializable;


public class Account implements Serializable {

    private static final long serialVersionUID = -7860856404701820060L;

    private String username;

    private String password;

    private String email;

    private String role;

    public String getUsername() { return username; }

    public void setUsername(String username) { this.username = username; }

    public String getPassword() {
        return password;
    }

    public void setPassword(String password) {
        this.password = password;
    }

    public String getEmail() {
        return email;
    }

    public void setEmail(String email) {
        this.email = email;
    }

    public String getRole() { return role; }

    public void setRole(String role) { this.role = role; }

	@Override
	public String toString() {
		return "Account [username=" + username + ", password=" + password + ", email=" + email + ", role=" + role + "]";
	}
    
    

}
