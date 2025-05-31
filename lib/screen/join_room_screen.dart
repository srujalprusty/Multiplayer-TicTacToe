import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/resource/socket_methods.dart';
import 'package:mp_tiktactoe/responsive/responsive.dart';
import 'package:mp_tiktactoe/widgets/custom_button.dart';
import 'package:mp_tiktactoe/widgets/custom_textfield.dart';
import 'package:mp_tiktactoe/widgets/custome_text.dart';

class JoinRoomScreen extends StatefulWidget {
  static String routeName = '/join-room';
  const JoinRoomScreen({super.key});


  @override
  State<JoinRoomScreen> createState() => _JoinRoomScreenState();
}

class _JoinRoomScreenState extends State<JoinRoomScreen> {
  final TextEditingController _gameIdController = TextEditingController();
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

@override
  void initState() {
    super.initState();
  _socketMethods.joinRoomSuccessListener(context);
  _socketMethods.errorOccuredListener(context);
  _socketMethods.updatePlayersStateListener(context);
  }

   @override
  void dispose() {
    _gameIdController.dispose();
    _nameController.dispose();
    super.dispose();
  }
  
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;
    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(horizontal: 20),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              CustomeText(shadows: [
                Shadow(color: Colors.white, blurRadius: 10),
              ], text: 'Join Room', fontSize: 70),
              SizedBox(height: size.height * 0.05,),
              CustomTextfield(controller:_nameController , hintText: 'Enter your name'),
              SizedBox(height: size.height * 0.05,),
              CustomTextfield(controller: _gameIdController , hintText: 'Join room'),
               SizedBox(height: size.height * 0.05,),
              CustomButton(onTap: ()=>
              _socketMethods.joinRoom(_nameController.text, _gameIdController.text),
              text: 'Join'),
               
            ],
          ),
        ),
      ),
    );
  }
  
}