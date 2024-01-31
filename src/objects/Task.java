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
    
    // public static Task fromJsonComplete(JSONObject jsonObject) throws IOException {
    //     String username = (String) jsonObject.get("username");
    //     String name = (String) jsonObject.get("name");
    //     long price = (Long) jsonObject.get("price");
    //     String market = (String) jsonObject.get("market");
    //     long count = (Long) jsonObject.get("count");
        
    //     long id = ++Database.countTask;
    //     return new Task(id, name, detail, (int) price, username, new Market(market), (int) count, colorList, sizeList);
    // }
    
    // public boolean purchase() {
    //     if (count >= 1) {
    //         --count;
    //         return true;
    //     }
    //     return false;
    // }
    
    // public double addNewRate(double newScore) {
    //     ++countVoters;
    //     this.score = ((countVoters - 1) * this.score + newScore) / countVoters;
    //     return this.score;
    // }
    
    // public void setCount(int count) {
    //     this.count = count;
    // }
    
    // public int getPrice() {
    //     return price;
    // }
    
    // public String getCategory() {
    //     return category;
    // }
    
    // public String getImage() {
    //     return image;
    // }
    
    // public int getCount() {
    //     return count;
    // }
    
    // public long getId() {
    //     return id;
    // }
    
    // @Override
    // public boolean equals(Object o) {
    //     if (this == o) return true;
    //     if (o == null || getClass() != o.getClass()) return false;
        
    //     Task product = (Task) o;
    
    //     return id == product.id;
    // }
    
    // @Override
    // public int hashCode() {
    //     return (int) (id ^ (id >>> 32));
    // }
}
