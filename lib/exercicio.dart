import 'package:flutter/foundation.dart';
import 'package:proteasy/exercicios.dart';
import 'package:proteasy/home.dart';
import 'package:proteasy/projeto.dart';
import 'package:proteasy/projetos.dart';
import 'package:flutter/material.dart';

class Exercicio extends StatefulWidget {
  const Exercicio({Key? key}) : super(key: key);

  @override
  State createState() => _ExercicioState();
}

class _ExercicioState extends State<Exercicio> {
  bool _showNotch = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            leading: IconButton(
              icon: Icon(Icons.arrow_back),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => Exercicios()),
                );},
            ),
            title: const Text('Exercício 1'),
          ),
          body:Center(
            child: Container(
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.start,
                  children: [
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(bottom: 0.0),
                          child:
                          Image.asset('assets/arcada.png'),
                        ),
                      ],
                    ),
                    Row(
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 20.0, bottom: 10.0, left: 20.0, right: 20.0),
                          child:
                          Text("Classe de Kennedy I", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                        ),
                      ],
                    ),
                    Row(

                      children: [
                        Expanded(
                          child: Padding(
                            padding: const EdgeInsets.symmetric(horizontal: 20.0),
                              child: Text("Considerando o caso de um paciente que sofreu um acidente doméstico e "
                                  "constatou-se a necessidade de um procedimento de exodontia dos dentes anteriores "
                                  "superiores, como mostra a imagem acima. Projete então uma prótese parcial removível"
                                  "adequada ao caso desse paciente. "),
                        )
                      )
                    ]
                    ),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Padding(
                          padding: const EdgeInsets.only(top: 80.0, bottom: 40.0),
                          child: ElevatedButton(
                            style: ElevatedButton.styleFrom(
                                minimumSize: Size(200, 40),
                                textStyle: const TextStyle(fontSize: 20)),
                            onPressed: () {
                              Navigator.push(
                                context,
                                new MaterialPageRoute(builder: (context) => SecondRoute()),
                              );
                            },
                            child: const Text('Projetar'),
                          ),
                        ),
                      ],
                    ),
                  ],
                ),
            ),
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

              },
            ),
          ],
        ),
      ),
    );
  }
}





















