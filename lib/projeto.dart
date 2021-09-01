import 'package:flutter/foundation.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:proteasy/home.dart';
import 'package:proteasy/mandibula.dart';
import 'package:proteasy/maxila.dart';
import 'package:proteasy/models.dart';
import 'exercicios.dart';
import 'package:proteasy/projetos.dart';
import 'package:flutter/material.dart';
import 'info.dart';

class SecondRoute extends StatefulWidget {
  String? objMandName;
  String? objMaxiName;

  SecondRoute({Key? key, this.objMandName, this.objMaxiName}) : super(key: key);

  @override
  State createState() => _SecondRouteState();
}

class _SecondRouteState extends State<SecondRoute> {
  final _formKey = GlobalKey<FormState>();
  bool _showNotch = true;

  final key = new GlobalKey<MandibulaState>();
  TextEditingController textName = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Builder(
        builder: (context) => DefaultTabController(
          length: 2,
          child: Scaffold(
            appBar: AppBar(
              bottom: const TabBar(
                tabs: [
                  Tab(
                    text: "Mandíbula",
                  ),
                  Tab(text: "Maxila"),
                ],
              ),
              automaticallyImplyLeading: false,
              leading: IconButton(
                icon: Icon(Icons.arrow_back),
                onPressed: () {
                  Navigator.push(
                    context,
                    new MaterialPageRoute(builder: (context) => Projetos()),
                  );
                },
              ),
              title: const Text('Novo Projeto'),
              actions: <Widget>[
                IconButton(
                  icon: Icon(
                    Icons.save_outlined,
                  ),
                  onPressed: () {
                    showDialog(
                        context: context,
                        builder: (BuildContext context) {
                          return AlertDialog(
                            content: Stack(
                              overflow: Overflow.visible,
                              children: <Widget>[
                                Positioned(
                                  right: -40.0,
                                  top: -40.0,
                                  child: InkResponse(
                                    onTap: () {
                                      Navigator.of(context).pop();
                                    },
                                    child: CircleAvatar(
                                      child: Icon(Icons.close),
                                      backgroundColor: Colors.red,
                                    ),
                                  ),
                                ),
                                Form(
                                  key: _formKey,
                                  child: Column(
                                    mainAxisSize: MainAxisSize.min,
                                    children: <Widget>[
                                      Padding(
                                        padding: EdgeInsets.all(8.0),
                                        child: TextFormField(
                                          controller: textName,
                                          decoration: InputDecoration(
                                            labelText: "Nome do Paciente",
                                            labelStyle: TextStyle(
                                                color: Colors.black,
                                                fontSize: 14),
                                            focusedBorder: UnderlineInputBorder(
                                                borderSide: BorderSide(
                                              color: Colors.grey,
                                              style: BorderStyle.solid,
                                              width: 1.0,
                                            )),
                                            enabledBorder: UnderlineInputBorder(
                                              borderSide: BorderSide(
                                                color: Colors.grey,
                                                style: BorderStyle.solid,
                                                width: 1.0,
                                              ),
                                            ),
                                          ),
                                        ),
                                      ),
                                      Padding(
                                        padding: const EdgeInsets.all(8.0),
                                        child: ElevatedButton(
                                            child: Text("Salvar"),
                                            onPressed: () {
                                              var mand = key
                                                  .currentState!.mandibulaState;
                                              if (mand != null) {
                                                saveObjectInstance(
                                                    mand, textName.text.trim());
                                              }
                                              Navigator.push(
                                                context,
                                                new MaterialPageRoute(
                                                    builder: (context) =>
                                                        Projetos()),
                                              );
                                            }),
                                      )
                                    ],
                                  ),
                                ),
                              ],
                            ),
                          );
                        });
                  },
                ),
                IconButton(
                  icon: Icon(
                    Icons.delete_outline,
                  ),
                  onPressed: () => showDialog<String>(
                    context: context,
                    builder: (BuildContext context) => AlertDialog(
                      title: const Text('Excluir Projeto'),
                      content: const Text(
                          'Tem certeza que deseja excluir o projeto atual?'),
                      actions: <Widget>[
                        TextButton(
                          onPressed: () => Navigator.pop(context, 'Cancel'),
                          child: const Text('Cancel'),
                        ),
                        TextButton(
                          onPressed: () {
                            Navigator.push(
                              context,
                              new MaterialPageRoute(
                                  builder: (context) => Projetos()),
                            );
                          },
                          child: const Text('Excluir'),
                        ),
                      ],
                    ),
                  ),
                ),
              ],
            ),
            body: TabBarView(
              physics: NeverScrollableScrollPhysics(),
              children: [
                Mandibula(
                  key: key,
                  mandName: widget.objMandName,
                ),
                Maxila(),
              ],
            ),
            bottomNavigationBar: _DemoBottomAppBar(
              shape: _showNotch ? const CircularNotchedRectangle() : null,
            ),
          ),
        ),
      ),
    );
  }

  _body() {}
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
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(
                      builder: (context) => BottomAppBarDemo()),
                );
              },
            ),
            IconButton(
              tooltip: 'Projetos',
              icon: const Icon(Icons.folder_outlined),
              onPressed: () {
                Navigator.push(
                  context,
                  new MaterialPageRoute(builder: (context) => Projetos()),
                );
              },
            ),
            IconButton(
              tooltip: 'Exercícios',
              icon: const Icon(Icons.list_alt),
              onPressed: () {
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
