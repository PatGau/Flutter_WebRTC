import 'package:flutter/material.dart';
import 'package:videocall_javascript/models/pages/home_screen.dart';
import 'package:videocall_javascript/models/pages/join_screen.dart';
import 'package:web_socket_channel/web_socket_channel.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter WebRTC',
      theme: ThemeData(
        primarySwatch: Colors.blue,
      ),
      home: HomeScreen(key: UniqueKey()),
      debugShowCheckedModeBanner: false,
    );
  }
}
