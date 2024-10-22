import 'package:flutter/material.dart';
import 'package:tamagothi/view/page/page_character_creation.dart';
import 'package:tamagothi/view/widgets/button_style.dart';
import 'package:tamagothi/view/widgets/text_field.dart';
import 'package:tamagothi/network_service.dart';
import 'package:tamagothi/presenter/global.dart';

import '../../swagger_generated_api/app_api.swagger.dart';

class Authorization extends StatefulWidget {
  final String? codeMessage;

  const Authorization({super.key, required this.codeMessage});

  @override
  State<Authorization> createState() => _AuthorizationState();
}

class _AuthorizationState extends State<Authorization> {
  final TextEditingController codeController = TextEditingController();
  String? phoneNumber;
  String? verCode;

  NetworkService ns = NetworkService();

  Future<void> fetchUserIdByPhoneNumber() async {
    List<UserDetail> users =
    await ns.fetchUserIdByPhoneNumberData(phoneNumber!);
    var user =
    users.firstWhere((element) => element.phoneNumber == phoneNumber);
    USER_ID = user.id.toString();
  }

  Future<void> fetchPetIdByUser() async {
    List<PetDetail> pets = await ns.fetchPetsData();
    var pet = pets.firstWhere((element) => element.user == int.parse(USER_ID!));
    PET_ID = pet.id.toString();
  }

  bool checkVerCode() {
    return verCode == codeController.text;
  }

  Future<int> balanceUs(List<UserDetail> userDetail,int balance) async{
    for(var detail in userDetail){
      if(detail.id == int.parse(USER_ID!)){
        balance = detail.balance!;
      }
    }
    return balance;
  }


  Future<void> fetchBalance() async {
    List<UserDetail> response = await ns.userBalance();
    BALANCE = await balanceUs(response, BALANCE!);
  }

  @override
  void initState() {
    super.initState();
    BALANCE = 0;
    verCode = widget.codeMessage?.split(" ")[2];
    phoneNumber = widget.codeMessage?.split(" ")[6];
    PHONE_NUMBER = phoneNumber;
  }



  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Container(
        decoration: const BoxDecoration(
            image: DecorationImage(
          image: AssetImage('assets/images/page/page_reg.png'),
          fit: BoxFit.fill,
        )),
        child: Center(
          child: Stack(
            children: <Widget>[
              Positioned(
                  left: screenSize.width * 0.4,
                  top: screenSize.height * 0.44,
                  child: Text(
                    '$verCode',
                    style: TextStyle(color: Colors.grey[700], fontSize: 26),
                  )),
              //const MyTextField(left: 0.29, top: 0.44, width: 0.45, height: 0.045, hintText: 'Номер Телефона',icon: Icons.person,),
              MyTextField(
                left: 0.29,
                top: 0.52,
                width: 0.45,
                height: 0.045,
                hintText: 'Код',
                icon: Icons.key,
                controller: codeController,
              ),
              MyButtonStyle(
                path: 'assets/images/button_reg.png',
                width: 0.45,
                height: 0.05,
                leftSize: 0.29,
                topSize: 0.585,
                radius: 30,
                onPressed: () {
                  if (checkVerCode()) {
                    ns.isPhoneNumberInListSync(phoneNumber!).then((result) async {
                      if (result == true) {
                        await fetchUserIdByPhoneNumber();
                        await fetchPetIdByUser();
                        await fetchBalance();
                        print("BALANCE $BALANCE");
                        await Navigator.pushReplacementNamed(context, '/home');
                      } else {
                        Navigator.pushReplacement(context, MaterialPageRoute(
                            builder: (BuildContext context) => CharacterCreationPage(phoneNumber: phoneNumber, verCode: verCode,)
                        ));
                      }
                    });
                  }
                },
                text: 'Войти',
              ),
              MyButtonStyle(
                path: 'assets/images/button_reg.png',
                width: 0.45,
                height: 0.05,
                leftSize: 0.29,
                topSize: 0.65,
                radius: 30,
                onPressed: () {
                  Navigator.pushReplacementNamed(context, '/');
                },
                text: 'Назад',
              ),
            ],
          ),
        ),
      ),
    );
  }
}
