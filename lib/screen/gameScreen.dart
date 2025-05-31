import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/provider/room_data_provider.dart';
import 'package:mp_tiktactoe/resource/socket_methods.dart';
import 'package:mp_tiktactoe/utils/waiting_lobby.dart';
import 'package:mp_tiktactoe/widgets/scoreboard.dart';
import 'package:mp_tiktactoe/widgets/tik_tac_toe.dart';
import 'package:provider/provider.dart';

class Gamescreen extends StatefulWidget {
  static String routeName = '/game';
  const Gamescreen({super.key});

  @override
  State<Gamescreen> createState() => _GamescreenState();
}

class _GamescreenState extends State<Gamescreen> {
  final SocketMethods _socketMethods = SocketMethods();
  @override
  void initState() {
    super.initState();
    _socketMethods.updateRoomListener(context);
    _socketMethods.updatePlayersStateListener(context);
    _socketMethods.pointIncreaseListener(context);
  }

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Scaffold(
      body: roomDataProvider.roomData['isJoin']
          ? const WaitingLobby()
          : SafeArea(
              child: Column(
              mainAxisAlignment: MainAxisAlignment.start,
              children: [
                const Scoreboard(),
                const TicTacToeBoard(),
              ],
            )),
    );
  }
}
