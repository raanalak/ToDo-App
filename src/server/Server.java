package server;

import java.io.DataOutputStream;
import java.io.IOException;
import java.net.ServerSocket;
import java.net.Socket;
import java.util.Scanner;
import java.util.concurrent.ExecutorService;
import java.util.concurrent.Executors;

public class Server {
    final static int portNumber = 3036;

    public static void main(String[] args) {
        try {
            Database.initializeTables("jdbc:sqlite:C:/todo/db/todo.db");
        } catch (IOException e) {
            e.printStackTrace();
            System.exit(1);
        }
        ExecutorService executorService = Executors.newFixedThreadPool(8);

        try (ServerSocket serverSocket = new ServerSocket(portNumber)) {
            while (true) {
                Socket socket = serverSocket.accept();
                executorService.execute(() -> {
                    try (Scanner in = new Scanner(socket.getInputStream(), "UTF-8");
                         DataOutputStream outputStream = new DataOutputStream(socket.getOutputStream())) {

                        String input = in.nextLine();
                        Command inputCommand = Command.parseCommand(input);
                        byte[] response = inputCommand.runCommand();
                        outputStream.write(response);
                        outputStream.flush();
                        Thread.sleep(1000);

                    } catch (IOException | InterruptedException e) {
                        e.printStackTrace();
                    }
                });
            }
        } catch (IOException e) {
            e.printStackTrace();
        }
    }
}
