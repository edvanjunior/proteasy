import 'package:flutter/foundation.dart';
import 'package:proteasy/exercicio.dart';
import 'package:proteasy/home.dart';
import 'package:proteasy/projeto.dart';
import 'package:proteasy/projetos.dart';
import 'package:proteasy/info.dart';
import 'package:flutter/material.dart';

class Exercicios extends StatefulWidget {
  const Exercicios({Key? key}) : super(key: key);

  @override
  State createState() => _ExerciciosState();
}

class _ExerciciosState extends State<Exercicios> {
  bool _showNotch = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Exercicios'),
          ),
          body: ListView(
              children: <Widget>[
                Card(
                  clipBehavior: Clip.antiAlias,
                  child: Column(
                      children: [
                        Image.asset('assets/arcada.png', height: 200,),
                        ListTile(
                          title: const Text('Exercício 1'),
                          subtitle: Text(
                            'Classe de kennedy I',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(Icons.arrow_drop_down_circle),
                          onTap: () {Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => Exercicio()),
                          );},
                        ),
                      ]
                  ),
                ),
                Card(clipBehavior: Clip.antiAlias,
                  child: Column(
                      children: [
                        Image.asset('assets/arcada.png', height: 200,),
                        ListTile(
                          title: const Text('Exercício 2'),
                          subtitle: Text(
                            'Classe de kennedy II',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(Icons.arrow_drop_down_circle),
                          onTap: () {Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => Exercicio()),
                          );},
                        ),
                      ]

                  ),
                ),
                Card(clipBehavior: Clip.antiAlias,
                  child: Column(
                      children: [
                        Image.asset('assets/arcada.png', height: 200,),
                        ListTile(
                          title: const Text('Exercício 3'),
                          subtitle: Text(
                            'Classe de kennedy I',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(Icons.arrow_drop_down_circle),
                          onTap: () {Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => Exercicio()),
                          );},
                        ),
                      ]
                  ),
                ),
                Card(clipBehavior: Clip.antiAlias,
                  child: Column(
                      children: [
                        Image.asset('assets/arcada.png', height: 200,),
                        ListTile(
                          title: const Text('Exercício 4'),
                          subtitle: Text(
                            'Classe de Kennedy II',
                            style: TextStyle(color: Colors.black.withOpacity(0.6)),
                          ),
                          trailing: Icon(Icons.arrow_drop_down_circle),
                          onTap: () {Navigator.push(
                            context,
                            new MaterialPageRoute(builder: (context) => Exercicio()),
                          );
                          },
                        ),
                      ]
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





















