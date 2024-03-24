import 'package:flutter/material.dart';
import 'package:tamagothi/presenter/global.dart';
import 'package:tamagothi/view/widgets/text_field.dart';
import 'package:tamagothi/network_service.dart';

import '../../swagger_generated_api/app_api.swagger.dart';

class CharacterCreationPage extends StatefulWidget {
  final String? phoneNumber;
  final String? verCode;

  CharacterCreationPage({super.key, required this.phoneNumber, this.verCode,});

  @override
  _CharacterCreationPageState createState() => _CharacterCreationPageState();
}

class _CharacterCreationPageState extends State<CharacterCreationPage> {
  final List<String> images = [
    'assets/pers/pers_1.png',
    'assets/pers/pers_2.png',
  ];
  int selectedImage = 0;
  final TextEditingController nameController = TextEditingController();
  final TextEditingController ageController = TextEditingController();
  bool gender = true;
  NetworkService ns = NetworkService();

  Future<void> us() async{
    await ns.createUserProfile(widget.phoneNumber!, widget.verCode!);
    List<UserDetail> users = await ns.fetchUserIdByPhoneNumberData(widget.phoneNumber!);
    var user = await users.firstWhere((element) => element.phoneNumber == widget.phoneNumber);
    USER_ID = await user.id.toString();
    List<PetDetail> pets = await ns.fetchPetsData();
    print('${USER_ID}');
  }

  Future<void> createUser() async {
    ns.createUserProfile(widget.phoneNumber!, widget.verCode!);
    print('${ns.createUserProfile(widget.phoneNumber!, widget.verCode!)}+сука');
  }

  Future<void> fetchUserIdByPhoneNumber() async {
    List<UserDetail> users =
    await ns.fetchUserIdByPhoneNumberData(widget.phoneNumber!);
    //print(users);
    //print('${widget.phoneNumber}+rggg');
    var user = await users.firstWhere((element) => element.phoneNumber == widget.phoneNumber);
    USER_ID = await user.id.toString();
  }
  Future<void> fetchPetIdByUser() async {
    List<PetDetail> pets = await ns.fetchPetsData();
    //print('${userId}+rggg');
    var pet = await pets.firstWhere((element) => element.user == int.parse(USER_ID!));
    PET_ID = await pet.id.toString();
  }

  @override
  Widget build(BuildContext context) {
    Size screenSize = MediaQuery.of(context).size;
    double width = screenSize.width;
    double height = screenSize.height;

    return Scaffold(
      resizeToAvoidBottomInset: false,
      body: Stack(
        children: [
          Container(
            decoration: BoxDecoration(
              image: DecorationImage(
                image: AssetImage('assets/images/page/create_page.png'),
                fit: BoxFit.fill,
              ),
            ),
          ),
          Positioned(
            top: height * 0.1,
            left: width * 0.05,
            child: Container(
              height: height * 0.3,
              width: width * 0.9,
              child: ListView.builder(
                scrollDirection: Axis.horizontal,
                itemCount: images.length,
                itemBuilder: (context, index) {
                  return GestureDetector(
                    onTap: () {
                      setState(() {
                        selectedImage = index;
                      });
                    },
                    child: Container(
                      margin: EdgeInsets.symmetric(horizontal: 10),
                      width: width * 0.8,
                      decoration: BoxDecoration(
                        image: DecorationImage(
                          image: AssetImage(images[index]),
                          fit: BoxFit.contain,
                        ),
                        border: selectedImage == index
                            ? Border.all(color: Colors.blue, width: 3)
                            : Border.all(color: Colors.transparent),
                      ),
                    ),
                  );
                },
              ),
            ),
          ),
          MyTextField(
            left: 0.05,
            top: 0.45,
            width: 0.9,
            height: 0.08,
            hintText: 'Имя питомца',
            icon: Icons.person,
            controller: nameController,
          ),
          Container(
            margin: EdgeInsets.only(left: width * 0.05, top: height * 0.55),
            width: width * 0.9,
            height: height * 0.08,
            decoration: BoxDecoration(
              color: Colors.white,
              border: Border.all(color: Colors.grey),
              borderRadius: BorderRadius.circular(10.0),
            ),
            child: Row(
              children: [
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = true;
                      });
                    },
                    child: Container(
                      color: gender == true
                          ? Colors.blue.withOpacity(0.3)
                          : Colors.white,
                      child: Center(
                        child: Text(
                          'Мужской',
                          style: TextStyle(
                            color: gender == true
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
                Expanded(
                  child: GestureDetector(
                    onTap: () {
                      setState(() {
                        gender = false;
                      });
                    },
                    child: Container(
                      color: gender == false
                          ? Colors.blue.withOpacity(0.3)
                          : Colors.white,
                      child: Center(
                        child: Text(
                          'Женский',
                          style: TextStyle(
                            color: gender == false
                                ? Colors.blue
                                : Colors.black,
                          ),
                        ),
                      ),
                    ),
                  ),
                ),
              ],
            ),
          ),
          MyTextField(
            left: 0.05,
            top: 0.65,
            width: 0.9,
            height: 0.08,
            hintText: 'Возраст питомца',
            icon: Icons.cake,
            controller: ageController,
          ),
          Positioned(
            top: height * 0.85,
            left: width * 0.22,
            child: ElevatedButton(
              onPressed: () async {
                await us();
                await  ns.createPet(nameController.text, int.parse(USER_ID!), int.parse(ageController.text), gender, null);
                await fetchPetIdByUser();

                  Navigator.pushReplacementNamed(context, '/home');
              },
              style: ElevatedButton.styleFrom(
                backgroundColor: Colors.pink,
                shape: RoundedRectangleBorder(
                  borderRadius: BorderRadius.circular(30.0),
                ),
                padding: EdgeInsets.symmetric(horizontal: 40, vertical: 15),
              ),
              child: Text(
                'Создать питомца',
                style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.white,
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
