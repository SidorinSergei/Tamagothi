import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/swagger_generated_api/app_api.swagger.dart';
import 'package:tamagothi/view/widgets/tamagothi_gallery.dart';
import 'package:tamagothi/presenter/presenter.dart';
import 'package:tamagothi/network_service.dart';

class ShopPage extends StatefulWidget {
  @override
  _ShopPageState createState() => _ShopPageState();
}

class _ShopPageState extends State<ShopPage> {
  NetworkService ns = NetworkService();
  final ShopPresenter presenter = ShopPresenter();
  List<int>? prices;
  List<String>? id;

  Future<List<SkinDetail>> _skinDetails()async{
    return ns.skins();
  }

  Future<void> _initializeData() async {
    List<SkinDetail> details = await _skinDetails();
    Map<String, List<dynamic>> result = await extractPricesAndIds(details, prices!, id!);
    id = result['id'] as List<String>;
    prices = result['prices'] as List<int>;
    // Теперь вы можете использовать результат здесь
  }


  @override
  void initState() {
    super.initState();
    _initializeData();
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

  Future<Map<String, List<dynamic>>> extractPricesAndIds(List<SkinDetail> skinDetails,List<int> prices,List<String> id) async {
    for (var detail in skinDetails) {
      if (detail.price != null) {
        prices.add(detail.price!);
      }
      id.add('assets/pers/pers_${detail.id!}');
    }
    return {'prices': prices, 'id': id};
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        decoration: BoxDecoration(
          image: DecorationImage(
            image: AssetImage('assets/images/page/shope_page.png'),
            fit: BoxFit.fill,
          ),
        ),
        child: Center(
          child: TamagothiGallery(
            images: id!,
            prices: prices!,
            onSkinDoubleTapped: presenter.onSkinDoubleTapped,
            purchasedSkins: presenter.purchasedSkins,
          ),
        ),
      ),
    );
  }
}

