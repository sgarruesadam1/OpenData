import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:get/get.dart';
import 'package:get_storage/get_storage.dart';
import 'package:trabajo_open_data/providers/fiestas_provider.dart';
 
import 'listaTipos_Sreen.dart';
 
class ListaLocalidadesScreen extends StatelessWidget {
  Map<String, Object> args = new Map<String, Object>();
  final box = GetStorage();
 
  @override
  Widget build(BuildContext context) {
    box.write('nombrelocalidad', null);
    box.write('tipo', null);
    box.write('nombre', null);
 
    return Scaffold(
      appBar: AppBar(
        title: Text("Localidades"),
      ),
      //drawer: MenuWidget(),
      body: _lista(context),
    );
  }
 
  Widget _lista(BuildContext context) {
    return FutureBuilder(
      future: fiestasProvider.cargarLocalidades(),
      initialData: [],
      builder: (context, snapshot) {
        if (snapshot.connectionState == ConnectionState.done) {
          return ListView(
            children: _listaElementos(context, snapshot.data),
          );
        } else {
          return Center(child: CircularProgressIndicator());
        }
      },
    );
  }
 
  List<Widget> _listaElementos(BuildContext context, List<String> data) {
    final List<Widget> lst = [];
    data.forEach((element) {
      final w = ListTile(
        title: Text(element),
        trailing: Icon(Icons.keyboard_arrow_right),
        onTap: () {
          box.write('nombrelocalidad', element);
          args['nombrelocalidad'] = element;
          //Navigator.pushNamed(context, 'mancomunidad', arguments: args);
          print(args);
          Get.offAll(ListaTiposScreen(), arguments: args);
        },
      );
      lst.add(w);
      lst.add(Divider());
    });
    return lst;
  }
}
 
 
 
