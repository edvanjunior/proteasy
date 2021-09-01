import 'dart:convert';

import 'package:flutter/foundation.dart';
import 'package:proteasy/models.dart';
import 'package:shared_preferences/shared_preferences.dart';
import 'home.dart';
import 'exercicios.dart';
import 'package:proteasy/projeto.dart';
import 'package:proteasy/info.dart';
import 'package:flutter/material.dart';

class Projetos extends StatefulWidget {
  const Projetos({Key? key}) : super(key: key);

  @override
  State createState() => _ProjetosState();
}

class _ProjetosState extends State<Projetos> {
  bool _showFab = true;
  bool _showNotch = true;
  FloatingActionButtonLocation _fabLocation =
      FloatingActionButtonLocation.endFloat;
  SharedPreferences? prefs;

  @override
  void initState() {
    super.initState();
  }

  Future<void> setPrefs() async {
    prefs = await SharedPreferences.getInstance();
  }

  @override
  Widget build(BuildContext context) {

    return MaterialApp(
      home: FutureBuilder(
        future: setPrefs(),
        builder: (context,snapshot) {
          if (snapshot.connectionState == ConnectionState.waiting) {
            return Center(
              child: CircularProgressIndicator(),
            );
          }
          List<Widget> _list = [];
          var keys = prefs!.getKeys().toList();
          keys.forEach((e) {
            var ret = jsonDecode(prefs!.getString(e)!);
            ObjectInstance obj =  ObjectInstance.fromJson(ret);
            _list.add(ListTile(
              title:  Text(obj.name!),
              trailing: Icon(Icons.edit),
              onTap: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => SecondRoute(objMandName: obj.name!,)),
                );
              },
            ));
            _list.add(Divider(height: 5,));
          });
          return Builder(
            builder: (context) =>
                Scaffold(
                  appBar: AppBar(
                    automaticallyImplyLeading: false,
                    title: const Text('Projetos'),
                  ),
                  body: ListView(
                      children: <Widget>[
                        Card(
                          clipBehavior: Clip.antiAlias,
                          child: Column(
                              children: _list
                          ),
                        ),
                      ]
                  ),
                  floatingActionButton: _showFab
                      ? FloatingActionButton(
                    onPressed: () {
                      Navigator.push(
                        context,
                        new MaterialPageRoute(
                            builder: (context) => SecondRoute()),
                      );
                    },
                    child: const Icon(Icons.add),
                    tooltip: 'Create',
                  )
                      : null,
                  floatingActionButtonLocation: _fabLocation,
                  bottomNavigationBar: _DemoBottomAppBar(
                    fabLocation: _fabLocation,
                    shape: _showNotch ? const CircularNotchedRectangle() : null,
                  ),
                ),
          );

        }
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.fabLocation = FloatingActionButtonLocation.endDocked,
    this.shape = const CircularNotchedRectangle(),
  });

  final FloatingActionButtonLocation fabLocation;
  final NotchedShape? shape;

  static final List<FloatingActionButtonLocation> centerLocations =
  <FloatingActionButtonLocation>[
    FloatingActionButtonLocation.endDocked,
    FloatingActionButtonLocation.endFloat,
  ];

  @override
  Widget build(BuildContext context) {
    return BottomAppBar(
      shape: shape,
      color: Colors.blue,
      child: IconTheme(
        data: IconThemeData(color: Theme.of(context).colorScheme.onPrimary),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.spaceAround,
          children: <Widget>[
            IconButton(
              tooltip: 'Home',
              icon: const Icon(Icons.home_outlined),
              onPressed: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => BottomAppBarDemo()),
                );
                },
            ),
            IconButton(
              tooltip: 'Projetos',
              icon: const Icon(Icons.folder_outlined),
              onPressed: (){

              },
            ),
            IconButton(
              tooltip: 'Exercícios',
              icon: const Icon(Icons.list_alt),
              onPressed: (){

                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => Exercicios()),
                );
              },
            ),
            IconButton(
              tooltip: 'Informações',
              icon: const Icon(Icons.info_outline),
              onPressed: () {
                Navigator.push(
                context,
                new MaterialPageRoute(builder: (context) => Info()),
              );
              },
            ),
          ],
        ),
      ),
    );
  }
}