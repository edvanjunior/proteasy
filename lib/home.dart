import 'package:flutter/foundation.dart';
import 'exercicios.dart';
import 'package:proteasy/projeto.dart';
import 'package:proteasy/projetos.dart';
import 'package:proteasy/info.dart';
import 'package:flutter/material.dart';

class BottomAppBarDemo extends StatefulWidget {
  const BottomAppBarDemo({Key? key}) : super(key: key);

  @override
  State createState() => _BottomAppBarDemoState();
}

class _BottomAppBarDemoState extends State<BottomAppBarDemo> {

  bool _showNotch = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Home'),
          ),
          body: ListView(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(

                  child: Column(
                    children: [
                    Row(
                    mainAxisAlignment: MainAxisAlignment.center,
                    children: [
                      Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child:
                        Image.asset('assets/welcome.png', height: 200,),
                      ),
                    ],
                  ),
                      Row(
                        mainAxisAlignment: MainAxisAlignment.center,
                        children: [
                          Padding(
                            padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                            child:
                            Text("Bem-vindo ao Proteasy!", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                          ),
                        ],
                      ),
                      Row(

                        children: [
                          Expanded(child:
                          Padding(
                            padding: const EdgeInsets.only( bottom: 10.0, left: 20.0, right: 20.0),
                            child:
                            Text("Acesse as opções abaixo para gerenciar seus projetos, resolver exercícios ou obter mais informações.",
                              textAlign: TextAlign.center,),
                          ),
                          )
                        ],
                      ),
                        ListTile(
                          leading: Icon(Icons.folder_outlined, color: Colors.blue,),
                          title: const Text('Projetos', style: TextStyle(color: Colors.blue),),
                            onTap: () {Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => Projetos()),
                          );},
                        ),
                      ]
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(

                    child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.list_alt, color: Colors.blue,),
                            title: const Text('Exercícios', style: TextStyle(color: Colors.blue),),
                            onTap: () {Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) => Exercicios()),
                            );},
                          ),
                        ]
                    ),
                  ),
                ),
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: InkWell(

                    child: Column(
                        children: [
                          ListTile(
                            leading: Icon(Icons.info_outline, color: Colors.blue,),
                            title: const Text('Informações', style: TextStyle(color: Colors.blue),),
                            onTap: () {Navigator.push(
                              context,
                              new MaterialPageRoute(builder: (context) => Info()),
                            );},
                          ),
                        ]
                    ),
                  ),
                ),
              ]
          ),
          bottomNavigationBar: _DemoBottomAppBar(
            shape: _showNotch ? const CircularNotchedRectangle() : null,
          ),
        ),
      ),
    );
  }
}

class _DemoBottomAppBar extends StatelessWidget {
  const _DemoBottomAppBar({
    this.shape = const CircularNotchedRectangle(),
  });


  final NotchedShape? shape;



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

              },
            ),
            IconButton(
              tooltip: 'Projetos',
              icon: const Icon(Icons.folder_outlined),
              onPressed: (){
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => Projetos()),
                );
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