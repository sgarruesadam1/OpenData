import 'package:flutter/material.dart';
import 'package:flutter_swiper/flutter_swiper.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:opendata/Screens/mapa_Screen.dart';

class Swiperwidget extends StatelessWidget {
  final List<String> fiesta;
  final box = GetStorage();
  Map<String, Object> args = new Map<String, Object>();
  Swiperwidget({@required this.fiesta});

  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Container(
      child: _swiper(context),
    );
  }

  Widget _swiper(context) {
    return Swiper(
      itemBuilder: (BuildContext context, int index) {
        return GestureDetector(
          onTap: () {
            box.write('nombre', fiesta.elementAt(index));
            print(box.read('nombre'));

            //Get.offAll(MapaScreen(), arguments: args);
          },
          child: Image.network(fiesta[index]),
        );
      },
      itemCount: fiesta.length,
      //pagination: new SwiperPagination(),
      //control: new SwiperControl(),
    );
  }
}
