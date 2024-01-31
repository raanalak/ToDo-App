package objects;

import database.Database;
import objects.App;

import java.io.IOException;
import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;
import java.util.Objects;

public class User implements Serializable {
    private String username;
    private String password;
    private String email;
    private App app;
    private static List<User> users = new ArrayList<>(); 
    private List<Task> tasks = new ArrayList<>();
    
    public User(String username, String password, String email) {
        this.username = username;
        this.email = email;
        this.password = password;
        users.add(this);
    }

    public static User addUser(String username, String password, String email) throws IOException {
        if (findByUsername(username) == null)
            return new User(username, password, email);
        else
            return null;
    }
    
    public String getUsername() {
        return username;
    }
    
    public String getPassword() {
        return password;
    }
    
    public String getEmail() {
        return email;
    }
    
    public void setEmail(String email) {
        this.email = email;
    }
    
    public void setPassword(String password) {
        this.password = password;
    }

    public void setUsername(String username) {
        this.username = username;
    }
    
    @Override
    public boolean equals(Object o) {
        if (this == o) return true;
        if (o == null || getClass() != o.getClass()) return false;
        
        User user = (User) o;
    
        return Objects.equals(username, user.username);
    }

    public static User findByUsername(String username) {
        for (User user: users) {
            if (user.getUsername().equals(username))
                return user;
        }
        return null;
    }

    public void addTask(Task task) {
        this.tasks.add(task);
    }
}
