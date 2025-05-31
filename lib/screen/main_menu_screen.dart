

import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/responsive/responsive.dart';
import 'package:mp_tiktactoe/screen/create_room_screen.dart';
import 'package:mp_tiktactoe/screen/join_room_screen.dart';
import 'package:mp_tiktactoe/widgets/custom_button.dart';

class MainMenuScreen extends StatelessWidget {
  static String routeName = '/main-menu';
  const MainMenuScreen({super.key});

  void createRoom(BuildContext context) {
    Navigator.pushNamed(context, CreateRoomScreen.routeName);
  }
  void joinRoom(BuildContext context) {
    Navigator.pushNamed(context, JoinRoomScreen.routeName);
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Responsive(
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              const Text(
                'Tic Tac Toe',
                style: TextStyle(
                  fontSize: 40,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  // Navigate to the game screen
                  createRoom(context);
                },
                text: 'Create Room',
              ),
              const SizedBox(height: 20),
              CustomButton(
                onTap: () {
                  // Navigate to the settings screen
                  joinRoom(context);
                },
                text: 'Join Room',
              ),
            ],
          ),
        ),

      ),
    );
  }
}