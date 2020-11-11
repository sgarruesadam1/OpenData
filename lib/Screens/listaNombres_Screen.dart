import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trabajo_open_data/models/fiestas_models.dart';
import 'package:trabajo_open_data/providers/fiestas_provider.dart';
import 'package:trabajo_open_data/widgets/drawer_widget.dart';
import 'package:trabajo_open_data/widgets/swiper_widget.dart';

import 'listaTipos_Sreen.dart';

class ListaNombresScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
  @override
  Widget build(BuildContext context) {
    args = Get.arguments ?? new Map<String, Object>();
    return Scaffold(
      appBar: AppBar(
        title: Text("Nombres"),
      ),
      drawer: DrawerWidget(),
      body: _lista(context),
    );
  }

  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: fiestasProvider.cargarNombres(
          box.read('nombrelocalidad') ?? args['nombrelocalidad'],
          box.read('tipo') ?? args['tipo']),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return Swiperwidget(fiesta: snapshot.data);
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
}
