package objects;

import org.json.simple.JSONArray;
import org.json.simple.JSONObject;

import java.io.Serializable;
import java.util.ArrayList;
import java.util.List;

public class App implements Serializable {
    private String name;
    private List<User> users = new ArrayList<>();
    private List<Task> tasks = new ArrayList<>();
    
    public App(String name) {
        this.name = name;
    }
    
    public String getName() {
        return name;
    }
    
    public void setName(String name) {
        this.name = name;
    }
    
    public List<Task> getTasks() {
        return tasks;
    }
}
