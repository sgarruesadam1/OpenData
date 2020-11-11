import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:opendata/Screens/listaLocalidades_Screen.dart';
import 'package:opendata/Screens/listaNombres_Screen.dart';
import 'package:opendata/Screens/listaTipos_Screen.dart';

class DrawerWidget extends StatelessWidget {
  final box = GetStorage();

  @override
  Widget build(BuildContext context) {
    String localidad = box.read('localidad');
    return Drawer(
        child: ListView(children: [
      ListTile(
        title: Text("Localidades"),
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.ac_unit_rounded),
        title: Text("Localidades"),
        onTap: () {
          Get.offAll(
            ListaLocalidadesScreen(),
          );
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.access_alarm_sharp),
        title: Text("Tipos"),
        onTap: () {
          Get.offAll(
            (ListaTiposScreen()),
          );
        },
      ),
      Divider(),
      ListTile(
        leading: Icon(Icons.account_balance_wallet),
        title: Text("Nombres"),
        onTap: () {
          Get.offAll(
            ListaNombresScreen(),
          );
        },
      ),
      Divider(),
    ]));
  }
}
