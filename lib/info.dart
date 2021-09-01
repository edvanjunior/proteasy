import 'package:flutter/foundation.dart';
import 'package:proteasy/exercicios.dart';
import 'package:proteasy/home.dart';
import 'package:proteasy/projetos.dart';
import 'package:flutter/material.dart';

class Info extends StatefulWidget {
  const Info({Key? key}) : super(key: key);

  @override
  State createState() => _InfoState();
}

class _InfoState extends State<Info> {
  bool _showNotch = true;


  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => Scaffold(
          appBar: AppBar(
            automaticallyImplyLeading: false,
            title: const Text('Informações'),
          ),
           body:Center(
             child: Container(
               padding: const EdgeInsets.symmetric(horizontal: 20),
               child: SingleChildScrollView(
                 child: Column(

                   children: [
                     Row(
                       mainAxisAlignment: MainAxisAlignment.center,
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                           child:
                         Image.asset('assets/informacoes.png', height: 200,),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                     Padding(
                        padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                        child:
                        Text("Informações Gerais", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                        ),
                       ],
                     ),
                     Row(

                       children: [
                         Expanded(child:
                         Text("Proteasy Mobile foi um trabalho proposto para o projeto final da disciplina de Projeto Integrado 2, do Curso de Sistemas e Mídias Digitais, da Universidade Federal do Ceará (UFC). O intuito do aplicativo é servir como uma ferramenta digital de auxílio ao aprendizado dos estudantes do curso de Odontologia, da UFC, especificamente, aqueles que estão fazendo a disciplina de Próteses Parciais Removíveis (PPR). "),
                         )
                       ],
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                           child:
                           Text("Equipe de desenvolvimento", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Expanded(child:
                         Text("A equipe de desenvolvimento do Proteasy é composta por 5 pessoas: Edvan Junior,Alessander Aquino, Igor Gomes, Neto Ribeiro e Emanuel Mota. Ambos os membros são alunos do curso de Sistemas e Mídias Digitais."),
                         )
                       ],
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                           child:
                           Text("Orientação", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                         ),
                       ],
                     ),
                     Row(

                       children: [
                         Expanded(child:
                         Text("Contamos também com a ajuda técnica e orientação dos professores da disciplina de Projeto Integrado 2, Rafael Carmo e Adriano, e contamos com ajuda da professora Ana Cristina, da disciplina (PPR), que veio até nós com a problemática, na qual, Proteasy tenta solucionar, cuja a principal dor, é a dificuldade de desenhar dos estudantes, no momento de executar exercícios relacionados às próteses."),
                         )
                       ],
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0, bottom: 10.0),
                           child:
                           Text("Contato", style: TextStyle(fontSize: 22.0, fontWeight: FontWeight.w500),),
                         ),
                       ],
                     ),
                     Row(
                       children: [
                         Expanded(child:
                         Text("proteasyufc@gmail.com"),
                         )
                       ],
                     ),
                     Row(
                       children: [
                         Padding(
                           padding: const EdgeInsets.only(top: 20.0),
                         ),
                       ],
                     ),
                   ],
                 ),
               ),
             ),
           ),
          // Column(
          //     children: <Widget>[
          //       Image.asset('assets/informacoes.png', height: 200,),
          //       Text('Informações Gerais'),
          //       Text('"Lorem ipsum dolor sit amet, '
          //           'consectetur adipiscing elit, sed do eiusmod tempor '
          //           'incididunt ut labore et dolore magna aliqua. Ut enim ad minim veniam, '
          //           'quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.'
          //           ' Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu '
          //           'fugiat nulla pariatur. Excepteur sint occaecat cupidatat non proident, sunt in culpa q'
          //           'ui officia deserunt mollit anim id est laborum."'),
          //     ]
          // ),
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





















