package objects;

import database.Database;

import java.io.IOException;
import java.io.Serializable;
import java.sql.Date;
import java.util.ArrayList;
import java.util.List;

public class Task implements Serializable {
    private long id;
    private User user;
    private String title;
    private boolean isImportant;
    private boolean hasDone;
    private Date dueDate;
    private static List<Task> tasks = new ArrayList<>(); 

    public Task(long id, User user) {
        this.id = id;
        this.user = user;
    }
    
    public Task(long id, User user, String title, boolean isImportant, boolean hasDone, Date dueDate) {
        this.id = id;
        this.user = user;
        this.title = title;
        this.isImportant = isImportant;
        this.hasDone = hasDone;
        this.dueDate = dueDate;
        tasks.add(this);
    }
}
