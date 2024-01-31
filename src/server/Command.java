package server;

import database.Database;
import objects.User;

import java.io.IOException;
import java.nio.charset.StandardCharsets;
import java.nio.file.NoSuchFileException;
import java.text.ParseException;
import java.util.ArrayList;

public class Command {
    private String command;
    private String[] data;
    private User sender;
    
    private Command() {}
    
    public static Command parseCommand(String value) {
        Command obj = new Command();
        
        String[] splitCommand = value.split(" ", 3);
        
        if (!splitCommand[0].equals("null")) {
            obj.sender = Database.findByUsername(splitCommand[0]);
        }
        
        obj.command = splitCommand[1];
        if (splitCommand.length >= 3)
            obj.data = splitCommand[2].split(";");
    
        return obj;
    }
    
    public byte[] runCommand() {
        System.out.println(command);
        switch (command) {
            case "signIn":
                return signInCommand();
            case "signUp":
                return signUpCommand();
        }
        return null;
    }
    
    private byte[] signInCommand() {
        User user = Database.findByUsername(data[0]);
        if (user == null) {
            return "false;false".getBytes(StandardCharsets.UTF_8);
        }
        
        if (user.getPassword().equals(data[1])) {
            return "true;true".getBytes(StandardCharsets.UTF_8);
        }
        
        return "true;false".getBytes(StandardCharsets.UTF_8);
    }

    private byte[] signUpCommand() {
        try {
            if (Database.findByUsername(data[0]) != null) {
                return "userFalse".getBytes(StandardCharsets.UTF_8);
            User user = User.addUser(data[0], data[1], data[2]);
            boolean result = Database.saveNewUser(user);
            return String.valueOf(result).getBytes(StandardCharsets.UTF_8);
        }
        catch (ParseException | IOException e) {
            e.printStackTrace();
        }
        return "false".getBytes(StandardCharsets.UTF_8);
    }
}
