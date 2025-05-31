import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/provider/room_data_provider.dart';
import 'package:provider/provider.dart';

class Scoreboard extends StatelessWidget {
  const Scoreboard({super.key});

  @override
  Widget build(BuildContext context) {
    RoomDataProvider roomDataProvider = Provider.of<RoomDataProvider>(context);
    return Row(mainAxisAlignment: MainAxisAlignment.center, children: [
      Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomDataProvider.player1.nickname,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(roomDataProvider.player1.points.toString(),style: TextStyle(fontSize: 16),),
            ],
          )),
          Padding(
          padding: const EdgeInsets.all(8.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(roomDataProvider.player2.nickname,style: TextStyle(fontSize: 20, fontWeight: FontWeight.bold),),
              Text(roomDataProvider.player2.points.toString(),style: TextStyle(fontSize: 16),),
            ],
          ))
    ]);
  }
}
