import 'package:flutter/material.dart';
import 'package:tamagothi/view/widgets/tamagothi_gallery.dart';
import 'package:tamagothi/presenter/presenter.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  final ShopPresenter presenter = ShopPresenter();

  @override
  void initState() {
    super.initState();
    presenter.onUpdate = (bool success) {
      if (!success) {
        // Показываем SnackBar, если не хватает средств
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Недостаточно средств для покупки скина!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        setState(() {});
      }
    };
  }



  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: const BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/shope_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: TamagothiGallery(
            images: presenter.model.images,
            prices: presenter.model.prices,
            purchasedSkins: const <int>{},
            onSkinDoubleTapped: presenter.onSkinDoubleTapped,
          ),
        ),
      ),
    );
  }
}

