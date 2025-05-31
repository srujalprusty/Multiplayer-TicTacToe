import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/provider/room_data_provider.dart';
import 'package:mp_tiktactoe/screen/create_room_screen.dart';
import 'package:mp_tiktactoe/screen/gameScreen.dart';
import 'package:mp_tiktactoe/screen/join_room_screen.dart';
import 'package:mp_tiktactoe/utils/colors.dart';
import 'package:mp_tiktactoe/screen/main_menu_screen.dart';
import 'package:provider/provider.dart';

void main() {
  runApp(const MainApp());
}


//FutureBuilder = take a request -> send it
//StreamBuilder = listen to a request -> get the data -> listen to the data

class MainApp extends StatelessWidget {
  const MainApp({super.key});

  @override
  Widget build(BuildContext context) {
    return  ChangeNotifierProvider(
      create: (context) =>RoomDataProvider(),
      child: MaterialApp(
      initialRoute: MainMenuScreen.routeName,
      theme:ThemeData.dark().copyWith(
          scaffoldBackgroundColor: bgColor
        ),
        routes:  {
          MainMenuScreen.routeName: (context) => const MainMenuScreen(),
          CreateRoomScreen.routeName: (context) => const CreateRoomScreen(),
          JoinRoomScreen.routeName: (context) => const JoinRoomScreen(),
          Gamescreen.routeName: (context) => const Gamescreen(),
        },  
    ));
  }
}
