import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/text_field.dart';

class Authorization extends StatelessWidget{
  const Authorization({super.key});

  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('assets/images/page/page_reg.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              const MyTextField(left: 0.29, top: 0.44, width: 0.45, height: 0.045, hintText: 'Email',icon: Icons.person,),
              const MyTextField(left: 0.29, top: 0.52, width: 0.45, height: 0.045, hintText: 'Password',icon: Icons.key,),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.585,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/home');},text: 'Войти',),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.058,leftSize: 0.29, topSize: 0.65,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/');},text: 'Зарегистрироваться',),
            ],
          ),
        ),
      ),
    );
  }
}