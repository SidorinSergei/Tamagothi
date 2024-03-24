import 'package:flutter/material.dart';
import 'package:tamagothi/view/page/page_authoriz.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/text_field.dart';

import '../../network_service.dart';
import '../../swagger_generated_api/app_api.swagger.dart';

class Registration extends StatefulWidget{
  Registration({super.key});

  @override
  State<Registration> createState() => _RegistrationState();
}

class _RegistrationState extends State<Registration> {
  final TextEditingController phoneController = TextEditingController();

  NetworkService ns = NetworkService();

  String? message;

  Future<void> _getAuthCodeSendPostData() async {
    String phoneNumber = "";
    final RegExp phoneRegex = RegExp(
        r'^(\+7|8)?\s*\(?\d{3}\)?\s*\d{3}[-\s]?\d{2}[-\s]?\d{2}$'
    );
    if (phoneRegex.hasMatch(phoneController.text)) {
      print('Номер телефона валиден.');
      phoneNumber = phoneController.text;
    } else {
      print('Номер телефона невалиден.');
    }
    AuthenticationCodeSend? _message = await ns.sendVerificationCode(phoneNumber);
    message = _message!.phoneNumber;
  }

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
              image: AssetImage('assets/images/page/page_reg.png'),
              fit: BoxFit.fill,
            )
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              //const MyTextField(left: 0.29, top: 0.42, width: 0.45, height: 0.045, hintText: 'Email',icon: Icons.person,),
              MyTextField(left: 0.29, top: 0.52, width: 0.45, height: 0.045, hintText: 'Номер Телефона',icon: Icons.mobile_screen_share,controller: phoneController,),
              //const MyTextField(left: 0.29, top: 0.56, width: 0.45, height: 0.045, hintText: 'Confirmation',icon: Icons.key,),
              //MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.62,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/creation');},text: 'Зарегистрироваться',),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.585,radius: 30,
                onPressed: (){
                  _getAuthCodeSendPostData().then((value) {
                    Navigator.pushReplacement(
                      context,
                      MaterialPageRoute(
                        builder: (context) => Authorization(codeMessage: message,),
                      ),
                    );
                  });
                },
                text: 'Получить код',),
            ],
          ),
        ),
      ),
    );
  }
}