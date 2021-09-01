import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Mandibula extends StatefulWidget {
  const Mandibula({Key? key}) : super(key: key);

  @override
  _MandibulaState createState() => _MandibulaState();
}

class _MandibulaState extends State<Mandibula> {
  Object? mandibula;

  @override
  void initState() {
    mandibula = Object(
        fileName: "assets/objects/tudo_mandibula.obj",
        lighting: true,
        position: Vector3(0.0, 0.0, 0.0),
        isAsset: true,
        name: "Mandibula",
        visiable: true);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(mandibula!);
            scene.light.position = scene.camera.position;
            scene.camera.zoom = 5;
          },
          onObjectCreated: (Object object) {
            if (object.name == "Mandibula") {
              //mandibula_p!.remove(mandibula_p!.children.firstWhere((element) => element.name == "Dente_35_Cube.014"));
              object.visiable = true;
              var dentes = object.children
                  .where((element) => !element.name!.contains("dente"));
              var gengiva = object.children.firstWhere((element) =>
                  element.name == "gengiva_mandíbula_gengiva_superior");

              dentes.forEach((element) {
                element.visiable = false;
              });
              gengiva.visiable = true;
            }
          },
        ),
      ),
      floatingActionButton: FloatingActionButton(
        onPressed: () {
          showModalPrincipal(context);
        },
        child: const Icon(Icons.edit),
      ),
    );
  }

  void showModalPrincipal(BuildContext context) {
    showMaterialModalBottomSheet(
      expand: false,
      context: context,
      builder: (context) => Column(
        mainAxisSize: MainAxisSize.min,
        children: [
          ListTile(
            title: new Text('Dentes'),
            onTap: () {
              showModalDentes(context);
            },
          ),
          ListTile(title: new Text('Grampos'),
          onTap: (){
            showModalGrampos(context);
          },),
          ListTile(title: new Text('Selas'),onTap: () {
            showModalSelas(context);
          }),
          ListTile(title: new Text('Conectores'), onTap: (){
            showModalConectores(context);
          },)
        ],
      ),
    );
  }

  void showModalDentes(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height *0.3,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(title: new Text("Escolha o dente que deseja remover"),),
            ),
            ListTile(
              title: new Text("38"),
              onTap: () {
                setdenteVisibility("38");
              },
            ),
            ListTile(
              title: new Text("37"),
              onTap: () {
                setdenteVisibility("37");
              },
            ),
            ListTile(
              title: new Text('36'),
              onTap: () {
                setdenteVisibility("36");
              },
            ),
            ListTile(
              title: new Text('35'),
              onTap: () {
                setdenteVisibility("35");
              },
            ),
            ListTile(
              title: new Text('34'),
              onTap: () {
                setdenteVisibility("34");
              },
            ),
            ListTile(
              title: new Text('33'),
              onTap: () {
                setdenteVisibility("33");
              },
            ),
            ListTile(
              title: new Text('32'),
              onTap: () {
                setdenteVisibility("32");
              },
            ),
            ListTile(
              title: new Text('31'),
              onTap: () {
                setdenteVisibility("31");
              },
            ),
            ListTile(
              title: new Text('41'),
              onTap: () {
                setdenteVisibility("41");
              },
            ),
            ListTile(
              title: new Text('42'),
              onTap: () {
                setdenteVisibility("42");
              },
            ),
            ListTile(
              title: new Text('43'),
              onTap: () {
                setdenteVisibility("43");
              },
            ),
            ListTile(
              title: new Text('44'),
              onTap: () {
                setdenteVisibility("44");
              },
            ),
            ListTile(
              title: new Text('45'),
              onTap: () {
                setdenteVisibility("45");
              },
            ),
            ListTile(
              title: new Text('46'),
              onTap: () {
                setdenteVisibility("46");
              },
            ),
            ListTile(
              title: new Text('47'),
              onTap: () {
                setdenteVisibility("47");
              },
            ),
            ListTile(
              title: new Text('48'),
              onTap: () {
                setdenteVisibility("48");
              },
            ),
          ],
        ),
      ),
    );
  }

  void setdenteVisibility(String s) {
    String name = "dente$s";
    if(mandibula != null){
      var objsNaPosicao = mandibula!.children.where((element) => element.name!.contains(s) && element.visiable && element.name != name).toList();
      objsNaPosicao.forEach((element) {element.visiable =false;});
      var dente = mandibula!.children.firstWhere((element) => element.name!.contains(name));
      if(dente.visiable){
        dente.visiable = false;
      }else{
        dente.visiable = true;
      }
      mandibula!.scene!.update();
    }
  }

  void showModalSelas(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height *0.3,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(title: new Text("Escolha o sela que deseja inserir"),),
            ),
            ListTile(
              title: new Text("38"),
              onTap: () {
                setSelaVisibility("38");
              },
            ),
            ListTile(
              title: new Text("37"),
              onTap: () {
                setSelaVisibility("37");
              },
            ),
            ListTile(
              title: new Text('36'),
              onTap: () {
                setSelaVisibility("36");
              },
            ),
            ListTile(
              title: new Text('35'),
              onTap: () {
                setSelaVisibility("35");
              },
            ),
            ListTile(
              title: new Text('34'),
              onTap: () {
                setSelaVisibility("34");
              },
            ),
            ListTile(
              title: new Text('33'),
              onTap: () {
                setSelaVisibility("33");
              },
            ),
            ListTile(
              title: new Text('32'),
              onTap: () {
                setSelaVisibility("32");
              },
            ),
            ListTile(
              title: new Text('31'),
              onTap: () {
                setSelaVisibility("31");
              },
            ),
            ListTile(
              title: new Text('41'),
              onTap: () {
                setSelaVisibility("41");
              },
            ),
            ListTile(
              title: new Text('42'),
              onTap: () {
                setSelaVisibility("42");
              },
            ),
            ListTile(
              title: new Text('43'),
              onTap: () {
                setSelaVisibility("43");
              },
            ),
            ListTile(
              title: new Text('44'),
              onTap: () {
                setSelaVisibility("44");
              },
            ),
            ListTile(
              title: new Text('45'),
              onTap: () {
                setSelaVisibility("45");
              },
            ),
            ListTile(
              title: new Text('46'),
              onTap: () {
                setSelaVisibility("46");
              },
            ),
            ListTile(
              title: new Text('47'),
              onTap: () {
                setSelaVisibility("47");
              },
            ),
            ListTile(
              title: new Text('48'),
              onTap: () {
                setSelaVisibility("48");
              },
            ),
          ],
        ),
      ),
    );
  }


  void setSelaVisibility(String s) {
    String denteName = "dente$s";
    String selaName = "sela$s";
    if(mandibula != null){
      var objsNaPosicao = mandibula!.children.where((element) => element.name!.contains(s) && element.visiable && element.name != selaName).toList();
      objsNaPosicao.forEach((element) {element.visiable =false;});
      var dente = mandibula!.children.firstWhere((element) => element.name!.contains(denteName));
      var sela = mandibula!.children.firstWhere((element) => element.name!.contains(selaName));

      if(dente.visiable){
        dente.visiable = false;
        sela.visiable = true;
        //sela.lighting = false;
      }else{
        if (sela.visiable) {
          dente.visiable = true;
          sela.visiable = false;
          //sela.lighting = true;
        }else{
          sela.visiable = true;
          //sela.lighting = false;
        }
      }
      //maxila!.updateTransform();
      mandibula!.scene!.update();
    }
  }


  void showModalConectores(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height *0.3,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(title: new Text("Escolha o conector que deseja inserir"),),
            ),
            ListTile(
              title: new Text("Barra Lingual"),
              onTap: () {
                setConectorVisibility("c_barra_lingual");
              },
            ),
            ListTile(
              title: new Text("Placa Lingual"),
              onTap: () {
                setConectorVisibility("c_placa_lingual");
              },
            ),
          ],
        ),
      ),
    );
  }

  void setConectorVisibility(String s) {
    String name = "$s";
    if(mandibula != null){
      var conectores = mandibula!.children.where((element) => element.name!.contains("c_") && element.visiable ==true && element.name! != s);
      conectores.forEach((element) {element.visiable = false;});
      var conector = mandibula!.children.firstWhere((element) => element.name!.contains(name));
      if(conector.visiable){
        conector.visiable = false;
      }else{
        conector.visiable = true;
      }
      mandibula!.scene!.update();
    }
  }

  void showModalGrampos(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height *0.3,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(title: new Text("Escolha o grampo que deseja inserir"),),
            ),
            ListTile(
              title: new Text("Ackers Distal"),
              onTap: () {
                //setConectorVisibility("c_recobrimento_palatino_mediano");
                showModalDentesComAckerDistal(context);
              },
            ),
            ListTile(
              title: new Text("Ackers Mesial"),
              onTap: () {
                //setConectorVisibility("c_recobrimento_palatino_mediano");
                showModalDentesComAckerMesial(context);
              },
            ),
            ListTile(
              title: new Text("Circunferencial Modificado"),
              onTap: () {
                //setConectorVisibility("c_recobrimento_palatino_mediano");
              },
            ),
            ListTile(
              title: new Text("Contínuo Kennedy"),
              onTap: () {
                //setConectorVisibility("c_recobrimento_palatino_mediano");
              },
            ),
          ],
        ),
      ),
    );
  }

  void showModalDentesComAckerDistal(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height *0.3,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(title: new Text("Escolha o dente que deseja selecionar"),),
            ),
            ListTile(
              title: new Text("34"),
              onTap: () {
                setGrampoVisibility("34","distal");
              },
            ),
            ListTile(
              title: new Text("35"),
              onTap: () {
                setGrampoVisibility("35","distal");
              },
            ),
            ListTile(
              title: new Text('36'),
              onTap: () {
                setGrampoVisibility("36","distal");
              },
            ),
            ListTile(
              title: new Text('37'),
              onTap: () {
                setGrampoVisibility("37","distal");
              },
            ),
            ListTile(
              title: new Text('38'),
              onTap: () {
                setGrampoVisibility("38","distal");
              },
            ),
            ListTile(
              title: new Text('44'),
              onTap: () {
                setGrampoVisibility("44","distal");
              },
            ),
            ListTile(
              title: new Text('45'),
              onTap: () {
                setGrampoVisibility("45","distal");
              },
            ),
            ListTile(
              title: new Text('46'),
              onTap: () {
                setGrampoVisibility("46","distal");
              },
            ),
            ListTile(
              title: new Text('47'),
              onTap: () {
                setGrampoVisibility("47","distal");
              },
            ),
            ListTile(
              title: new Text('48'),
              onTap: () {
                setGrampoVisibility("48","distal");
              },
            ),
          ],
        ),
      ),
    );
  }

  void showModalDentesComAckerMesial(BuildContext context) {
    showMaterialModalBottomSheet(
      context: context,
      builder: (context) => Container(
        height: MediaQuery.of(context).size.height *0.3,
        child: ListView(
          children: [
            Padding(
              padding: const EdgeInsets.all(2.0),
              child: ListTile(title: new Text("Escolha o dente que deseja selecionar"),),
            ),
            ListTile(
              title: new Text("34"),
              onTap: () {
                setGrampoVisibility("34","mesial");
              },
            ),
            ListTile(
              title: new Text("35"),
              onTap: () {
                setGrampoVisibility("35","mesial");
              },
            ),
            ListTile(
              title: new Text('36'),
              onTap: () {
                setGrampoVisibility("36","mesial");
              },
            ),
            ListTile(
              title: new Text('37'),
              onTap: () {
                setGrampoVisibility("37","mesial");
              },
            ),
            ListTile(
              title: new Text('38'),
              onTap: () {
                setGrampoVisibility("38","mesial");
              },
            ),
            ListTile(
              title: new Text('44'),
              onTap: () {
                setGrampoVisibility("44","mesial");
              },
            ),
            ListTile(
              title: new Text('45'),
              onTap: () {
                setGrampoVisibility("45","mesial");
              },
            ),
            ListTile(
              title: new Text('46'),
              onTap: () {
                setGrampoVisibility("46","mesial");
              },
            ),
            ListTile(
              title: new Text('47'),
              onTap: () {
                setGrampoVisibility("47","mesial");
              },
            ),
            ListTile(
              title: new Text('48'),
              onTap: () {
                setGrampoVisibility("48","mesial");
              },
            ),
          ],
        ),
      ),
    );
  }

  void setGrampoVisibility(String s, String tipoGrampo) {
    String denteName = "dente$s";
    String selaName = "sela$s";
    if(mandibula != null){
      var grampo = mandibula!.children.firstWhere((element) => element.name!.contains(tipoGrampo) && element.name!.contains(s));
      var objsNaPosicao = mandibula!.children.where((element) => element.name!.contains(s) && element.visiable && element.name!.contains("g_") && element.name != grampo.name).toList();
      objsNaPosicao.forEach((element) {element.visiable =false;});
      var denteisActive = mandibula!.children.firstWhere((element) => element.name!.contains(denteName)).visiable;
      var selaisActive = mandibula!.children.firstWhere((element) => element.name!.contains(selaName)).visiable;

      if(denteisActive && !selaisActive){
        if(grampo.visiable){
          grampo.visiable =false;
        }else{
          grampo.visiable = true;
        }
      }
      mandibula!.scene!.update();
    }
  }

}
