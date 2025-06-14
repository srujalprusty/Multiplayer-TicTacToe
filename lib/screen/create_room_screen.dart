import 'package:flutter/material.dart';
import 'package:mp_tiktactoe/resource/socket_methods.dart';
import 'package:mp_tiktactoe/responsive/responsive.dart';
import 'package:mp_tiktactoe/widgets/custom_button.dart';
import 'package:mp_tiktactoe/widgets/custom_textfield.dart';
import 'package:mp_tiktactoe/widgets/custome_text.dart';

class CreateRoomScreen extends StatefulWidget {
  static String routeName = '/create-room';
  const CreateRoomScreen({super.key});

  @override
  State<CreateRoomScreen> createState() => _CreateRoomScreenState();
}

class _CreateRoomScreenState extends State<CreateRoomScreen> {
  final TextEditingController _nameController = TextEditingController();
  final SocketMethods _socketMethods = SocketMethods();

  @override
  void initState() {
    super.initState();
    _socketMethods.createRoomSuccessListener(context);
  }

  @override
  void dispose() {
    super.dispose();
    _nameController.dispose();
  }

  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.of(context).size;

    return Scaffold(
      body: Responsive(
        child: Container(
          margin: const EdgeInsets.symmetric(
            horizontal: 20,
          ),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            crossAxisAlignment: CrossAxisAlignment.center,
            children: [
              const CustomeText(
                shadows: [
                  Shadow(
                    blurRadius: 40,
                    color: Colors.blue,
                  ),
                ],
                text: 'Create Room',
                fontSize: 70,
              ),
              SizedBox(height: size.height * 0.08),
              CustomTextfield(
                controller: _nameController,
                hintText: 'Enter your nickname',
              ),
              SizedBox(height: size.height * 0.045), 
              CustomButton(
                  onTap: () => _socketMethods.createRoom(
                        _nameController.text,
                      ),
                  text: 'Create'),
            ],
          ),
        ),
      ),
    );
  }
}
