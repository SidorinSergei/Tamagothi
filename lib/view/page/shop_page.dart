import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:tamagothi/presenter/global.dart';
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
  List<int> prices = [];
  List<String> id = [];
  List<int> userSkin = [];
  int? balance = 0;

  Future<List<SkinDetail>> _skinDetails()async{
    return ns.skins();
  }
  Future<List<UserStorageSkinDetail>> _userSkin() async{
    return ns.userSkinId();
  }
  Future<List<UserDetail>> _userBalance() async{
    return ns.userBalance();
  }

  Future<void> _initializeData() async {
    if (!mounted) return; // Добавьте эту проверку перед обновлением состояния
    List<SkinDetail> details = await _skinDetails();
    Map<String, List<dynamic>> result = await extractPricesAndIds(details, prices, id);
    if (!mounted) return; // Проверьте еще раз после асинхронного вызова
    id = result['id'] as List<String>;
    prices = result['prices'] as List<int>;
    List<UserStorageSkinDetail> detailUserSkin = await _userSkin();
    userSkin = await purchasedSkins(detailUserSkin, userSkin);
    List<UserDetail> response = await _userBalance();
    balance = await balanceUs(response, balance!);
    //print(userSkin);
    setState(() {
      // Теперь обновите состояние, если виджет все еще в дереве
    });
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



  Future<void> onSkinDoubleTapped(int index) async {
    print(userSkin.contains(index));
    if (userSkin.contains(index)) {
      ScaffoldMessenger.of(context).showSnackBar(
        SnackBar(
          content: Text('Этот скин уже куплен!'),
          duration: Duration(seconds: 2),
        ),
      );
      return;
    } else {
      bool success = await ns.buySkin(int.parse(userId!), index + 1);
      if (!success) {
        ScaffoldMessenger.of(context).showSnackBar(
          SnackBar(
            content: Text('Недостаточно средств для покупки скина!'),
            duration: Duration(seconds: 2),
          ),
        );
      } else {
        int skinPrice = prices[index];
        // Вычитаем стоимость скина из текущего баланса перед обновлением на сервере
        int updatedBalance = balance! - skinPrice;
        // Обновляем баланс на сервере с уже вычтенной стоимостью скина


        // Получаем обновлённый список купленных скинов
        List<UserStorageSkinDetail> detailUserSkin = await _userSkin();
        List<int> updatedUserSkin = await purchasedSkins(detailUserSkin, userSkin);
        // Обновляем состояние с новым балансом и списком скинов
        setState(()  {
          userSkin = updatedUserSkin;
          balance = balance! - skinPrice;

        });
      }

    }
  }


  Future<int> balanceUs(List<UserDetail> userDetail,int balance) async{
    for(var detail in userDetail){
      if(detail.id == int.parse(userId!)){
        balance = detail.balance!;
      }
    }
    print(balance);
    return balance;
  }


  Future<List<int>> purchasedSkins(List<UserStorageSkinDetail> skinDetail, List<int> userIdSkin) async{
    for(var detail in skinDetail){
      if (detail.user == int.parse(userId!)){
        userIdSkin.add(detail.skin! - 1);
        //print(userIdSkin);
      }
    }
    return userIdSkin;
  }

  Future<Map<String, List<dynamic>>> extractPricesAndIds(List<SkinDetail> skinDetails,List<int> prices,List<String> id) async {
    for (var detail in skinDetails) {
      if (detail.price != null) {
        prices.add(detail.price!);
      }
      id.add('assets/pers/pers_${detail.id!}.png');
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
        child: Stack(
          children: [
            Center(
              child: TamagothiGallery(
                images: id,
                prices: prices,
                onSkinDoubleTapped: onSkinDoubleTapped,
                purchasedSkins: userSkin,
              ),
            ),
            LayoutBuilder(
              builder: (BuildContext context, BoxConstraints constraints) {
                // Пример масштабирования текста и размера рамки в зависимости от размера экрана
                double widthFactor = constraints.maxWidth / 600; // Базируется на ширине 600 как на базовой
                double heightFactor = constraints.maxHeight / 800; // Базируется на высоте 800 как на базовой
                double scale = widthFactor < heightFactor ? widthFactor : heightFactor;

                return Align(
                  alignment: Alignment.topLeft,
                  child: Padding(
                    padding: EdgeInsets.only(
                      top: MediaQuery.of(context).size.height * 0.045,
                      left: MediaQuery.of(context).size.width * 0.04,
                    ),
                    child: Container(
                      padding: EdgeInsets.symmetric(vertical: 8 * scale, horizontal: 12 * scale),
                      decoration: BoxDecoration(
                        color: Colors.white.withOpacity(0.8),
                        borderRadius: BorderRadius.circular(10 * scale),
                      ),
                      child: Text(
                        'Баланс: $balance',
                        style: TextStyle(
                          fontSize: 20 * scale,
                          fontWeight: FontWeight.bold,
                        ),
                      ),
                    ),
                  ),
                );
              },
            ),
          ],
        ),
      ),
    );
  }

}

