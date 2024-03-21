import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/text_field.dart';

class Registration extends StatelessWidget{
  const Registration({super.key});

  @override
  Widget build(BuildContext context){
    Size screenSize = MediaQuery.of(context).size;
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
              const MyTextField(left: 0.29, top: 0.42, width: 0.45, height: 0.045, hintText: 'Email',icon: Icons.person,),
              const MyTextField(left: 0.29, top: 0.5, width: 0.45, height: 0.045, hintText: 'Password',icon: Icons.key,),
              const MyTextField(left: 0.29, top: 0.56, width: 0.45, height: 0.045, hintText: 'Confirmation',icon: Icons.key,),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.62,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/creation');},text: 'Зарегистрироваться',),
              MyButtonStyle(path: 'assets/images/button_reg.png',  width: 0.45, height: 0.05,leftSize: 0.29, topSize: 0.685,radius: 30, onPressed: (){Navigator.pushReplacementNamed(context, '/login');},text: 'Войти',),
            ],
          ),
        ),
      ),
    );
  }
}