import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/text_field.dart';
import 'package:tamagothi/network_service.dart';

class Registration extends StatelessWidget{
  Registration({super.key});
  final TextEditingController phoneController = TextEditingController();
  NetworkService ns = NetworkService();

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
              MyTextField(left: 0.29, top: 0.52, width: 0.45, height: 0.045, hintText: 'Номер Телофона',icon: Icons.mobile_screen_share,controller: phoneController,),
              //const MyTextField(left: 0.29, top: 0.56, width: 0.45, height: 0.045, hintText: 'Confirmation',icon: Icons.key,),
              //MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.62,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/creation');},text: 'Зарегистрироваться',),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.585,radius: 30, onPressed: (){ns.sendVerificationCode(phoneController.text);Navigator.pushReplacementNamed(context, '/login');},text: 'Получить код',),
            ],
          ),
        ),
      ),
    );
  }
}