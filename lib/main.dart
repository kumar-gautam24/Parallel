import 'package:flutter/material.dart';
import 'package:parallel/src/audi_room/views/audio_room_screen.dart';

void main() {
  runApp(const MainApp());
}

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: HomeScreen(),
    );
  }
}

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  _HomeScreenState createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _roomIdController = TextEditingController();
  bool isHost = false;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextField(
              controller: _usernameController,
              decoration: InputDecoration(
                hintText: "Enter User Name",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
              ),
            ),
            SizedBox(height: 20),
            TextField(
              controller: _roomIdController,
              decoration: InputDecoration(
                hintText: "Enter Room ID",
                border: OutlineInputBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
                constraints: BoxConstraints(
                  maxWidth: 300,
                ),
              ),
            ),
            SizedBox(height: 20),
            SizedBox(
              width: 300,
              child: SwitchListTile(
                title: Text("Are you the host?"),
                value: isHost,
                onChanged: (bool value) {
                  setState(() {
                    isHost = value;
                  });
                },
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(10),
                ),
              ),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () {
                if(_usernameController.text.isEmpty || _roomIdController.text.isEmpty) {
                  return;
                }
                Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AudioRoomScreen(
                      userName: _usernameController.text,
                      roomId: _roomIdController.text,
                      isHost: isHost,
                    ),
                  ),
                );
              },
              child: Text("Join Room"),
            ),
          ],
        ),
      ),
    );
  }
}
