package database;

import objects.User;
import objects.Task;

import java.io.*;
import java.nio.charset.StandardCharsets;
import java.nio.file.*;
import java.util.ArrayList;
import java.util.List;

public class Database {
    public static int countTask = 0;
    private static final Path usersPath = Paths.get("database/users.txt");
    private static final Path tasksPath = Paths.get("database/tasks.txt");

    public static User findByUsername(String username) {
        try (ObjectInputStream in = new ObjectInputStream(Files.newInputStream(usersPath))) {
            while (in.available() >= 0) {
                User user = (User) in.readObject();
                if (user.getUsername().equals(username)) {
                    return user;
                }
            }
        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }
        return null;
    }

    public static void saveEditedUser(User user) throws IOException, ClassNotFoundException {
        List<User> usersList = readAllUsers();
        usersList.remove(user);
        usersList.add(user);
        writeAllUsers(usersList);
    }

    private static List<User> readAllUsers() throws IOException, ClassNotFoundException {
        List<User> usersList = new ArrayList<>();
        try (ObjectInputStream in = new ObjectInputStream(Files.newInputStream(usersPath))) {
            while (in.available() != 0) {
                usersList.add((User) in.readObject());
            }
        } catch (EOFException e) {
            e.printStackTrace();
        }

        return usersList;
    }

    public static boolean saveNewUser(User user) {
        try {
            List<User> usersList = readAllUsers();
            usersList.add(user);
            writeAllUsers(usersList);
            return true;

        } catch (IOException | ClassNotFoundException e) {
            e.printStackTrace();
        }

        return false;
    }

    private static void writeAllUsers(List<User> usersList) throws IOException {
        try (ObjectOutputStream out = new ObjectOutputStream(Files.newOutputStream(usersPath))) {
            for (User p : usersList) {
                out.writeObject(p);
            }
        }
    }

    public static void createDirectory() throws IOException {
        Path database = Paths.get("database");
        if (Files.notExists(database)) {
            Files.createDirectory(database);
        }
    }
}
