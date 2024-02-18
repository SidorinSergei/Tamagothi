import 'package:flutter/material.dart';
import 'package:tamagothi/view/page/main_page.dart';
import 'package:tamagothi/view/page/page_reg.dart';
import 'package:tamagothi/view/page/shop_page.dart';
import 'package:tamagothi/view/widgets/tamagothi_gallery.dart';

void main() {
  runApp(const MyApp());
}

class MyApp extends StatelessWidget {
  const MyApp({super.key});

  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      initialRoute: '/',
      routes: {
        '/': (context) => Registration(),
      '/home': (context) => Scaffold(
        body: PageView(
          children: [
            HomePage(),
            ShopPage(),
          ],
        ),
      ),
      },
    );
  }
}


class MyHomePage extends StatefulWidget {
  @override
  _MyHomePageState createState() => _MyHomePageState();
}

class _MyHomePageState extends State<MyHomePage> {
  String petStatus = 'Hungry';
  double satietyLevel = 0.0;

  void feedPet(String foodType) {
    setState(() {
      petStatus = 'Fed with $foodType';
      satietyLevel = 1.0; // Assuming 1.0 is full satiety
    });

    // Here you might want to add more logic to handle the pet's status and satiety level
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Pet Feeding System'),
      ),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: <Widget>[
            ElevatedButton(
              onPressed: () {
                // Open a bottom sheet or a dialog to let the user select food type
                showModalBottomSheet(
                  context: context,
                  builder: (BuildContext context) {
                    return Container(
                      height: 200,
                      child: Column(
                        children: <FoodType>[
                          FoodType('Dry Food'),
                          FoodType('Wet Food'),
                          FoodType('Water'),
                        ].map((foodType) {
                          return ListTile(
                            title: Text(foodType.name),
                            onTap: () {
                              feedPet(foodType.name);
                              Navigator.pop(context);
                            },
                          );
                        }).toList(),
                      ),
                    );
                  },
                );
              },
              child: Text('Feed'),
            ),
            SizedBox(height: 20),
            Text('Pet Status: $petStatus'),
            SizedBox(height: 20),
            LinearProgressIndicator(
              value: satietyLevel,
              backgroundColor: Colors.grey[300],
              valueColor: AlwaysStoppedAnimation<Color>(Colors.green),
            ),
          ],
        ),
      ),
    );
  }
}

class FoodType {
  final String name;

  FoodType(this.name);
}