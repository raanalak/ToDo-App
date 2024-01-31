import 'dart:convert';
import 'dart:io';

import 'command.dart';

class MySocket {
  final int port = 3036;
  final String host = "127.0.0.1";
  final String? userName;
  final Command command;
  final List<String> data;

  MySocket(this.userName, this.command, this.data);

  Future<String> sendAndReceive() async {
    var socket = await Socket.connect(host, port);

    if (data.isNotEmpty) {
      socket.writeln("$userName ${command.name} ${data.join(";")}");
    } else {
      socket.writeln("$userName ${command.name}");
    }

    String response = await utf8.decoder.bind(socket).join();
    socket.close();
    return response;
  }
}
