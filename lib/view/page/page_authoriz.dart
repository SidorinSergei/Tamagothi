import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/text_field.dart';

class Authorization extends StatelessWidget{
  @override
  Widget build(BuildContext context){
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: BoxDecoration(
          image:  DecorationImage(
            image: AssetImage('assets/images/page/page_reg.png'),
            fit: BoxFit.fill,
          )
        ),
        child: Center(
          child: Stack(
            children: <Widget>[
              MyTextField(left: 0.29, top: 0.44, width: 0.45, height: 0.045, hintText: 'Email',icon: Icons.person,),
              MyTextField(left: 0.29, top: 0.52, width: 0.45, height: 0.045, hintText: 'Password',icon: Icons.key,),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.585,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/home');},text: 'Войти',),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.058,leftSize: 0.29, topSize: 0.65,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/');},text: 'Зарегистрироваться',),
            ],
          ),
        ),
      ),
    );
  }
}