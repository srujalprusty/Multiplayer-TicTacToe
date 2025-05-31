import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/provider/room_data_provider.dart';
import 'package:mp_tiktactoe/widgets/custom_textfield.dart';
import 'package:provider/provider.dart';

class WaitingLobby extends StatefulWidget {
  const WaitingLobby({super.key});

  @override
  State<WaitingLobby> createState() => _WaitingLobbyState();
}

class _WaitingLobbyState extends State<WaitingLobby> {
  late TextEditingController roomIdController ;

  @override
  void initState() {
    super.initState();
    roomIdController = TextEditingController(
      text: Provider.of<RoomDataProvider>(context, listen: false).roomData['_id'],);
  }
  @override
  void dispose() {
    super.dispose();
    roomIdController.dispose();
  }
  @override
  Widget build(BuildContext context) {
    return  Column(
      mainAxisAlignment: MainAxisAlignment.center,
      crossAxisAlignment: CrossAxisAlignment.center,
      children: [
        const CircularProgressIndicator(),
        const SizedBox(height: 20),
        Text(
          'Waiting for other player to join...',
          style: TextStyle(fontSize: 18, color: Colors.grey[600]),
        ),
        const SizedBox(height: 20),
        CustomTextfield(controller: roomIdController, hintText: '',
        isReadOnly: true,
        )
      ],
    );
  }
}