import 'package:flutter/material.dart';
import 'package:flutter_cube/flutter_cube.dart';
import 'package:modal_bottom_sheet/modal_bottom_sheet.dart';

class Maxila extends StatefulWidget {
  const Maxila({Key? key}) : super(key: key);

  @override
  _MaxilaState createState() => _MaxilaState();
}

class _MaxilaState extends State<Maxila> {
  Object? maxila = Object(
      fileName: "assets/objects/tudo_maxila.obj",
      lighting: true,
      position: Vector3(0.0, 0.0, 0.0),
      isAsset: true,
      name: "Maxila",
      visiable: true);

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Cube(
          onSceneCreated: (Scene scene) {
            scene.world.add(maxila!);
            scene.light.position = scene.camera.position;
            scene.camera.zoom = 5;
          },
          onObjectCreated: (Object object) {
            if (object.name == "Maxila") {
              //mandibula_p!.remove(mandibula_p!.children.firstWhere((element) => element.name == "Dente_35_Cube.014"));
              object.visiable = true;
              var dentes = object.children
                  .where((element) => !element.name!.contains("dente"));
              var gengiva = object.children.firstWhere((element) =>
                  element.name == "gengiva_maxila_arcada_superior");

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
          ListTile(title: new Text('Dentes'), onTap: () {
            showModalDentes(context);
          }),
          ListTile(title: new Text('Grampos'),
          onTap: (){
            showModalGrampos(context);
          },),
          ListTile(title: new Text('Selas'),
          onTap: (){
            showModalSelas(context);
          },),
          ListTile(title: new Text('Conectores'),
          onTap: (){
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
              title: new Text("18"),
              onTap: () {
                setdenteVisibility("18");
              },
            ),
            ListTile(
              title: new Text("17"),
              onTap: () {
                setdenteVisibility("17");
              },
            ),
            ListTile(
              title: new Text('16'),
              onTap: () {
                setdenteVisibility("16");
              },
            ),
            ListTile(
              title: new Text('15'),
              onTap: () {
                setdenteVisibility("15");
              },
            ),
            ListTile(
              title: new Text('14'),
              onTap: () {
                setdenteVisibility("14");
              },
            ),
            ListTile(
              title: new Text('13'),
              onTap: () {
                setdenteVisibility("13");
              },
            ),
            ListTile(
              title: new Text('12'),
              onTap: () {
                setdenteVisibility("12");
              },
            ),
            ListTile(
              title: new Text('11'),
              onTap: () {
                setdenteVisibility("11");
              },
            ),
            ListTile(
              title: new Text('21'),
              onTap: () {
                setdenteVisibility("21");
              },
            ),
            ListTile(
              title: new Text('22'),
              onTap: () {
                setdenteVisibility("22");
              },
            ),
            ListTile(
              title: new Text('23'),
              onTap: () {
                setdenteVisibility("23");
              },
            ),
            ListTile(
              title: new Text('24'),
              onTap: () {
                setdenteVisibility("24");
              },
            ),
            ListTile(
              title: new Text('25'),
              onTap: () {
                setdenteVisibility("25");
              },
            ),
            ListTile(
              title: new Text('26'),
              onTap: () {
                setdenteVisibility("26");
              },
            ),
            ListTile(
              title: new Text('27'),
              onTap: () {
                setdenteVisibility("27");
              },
            ),
            ListTile(
              title: new Text('28'),
              onTap: () {
                setdenteVisibility("28");
              },
            ),
          ],
        ),
      ),
    );
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
              child: ListTile(title: new Text("Escolha o dente que deseja remover"),),
            ),
            ListTile(
              title: new Text("18"),
              onTap: () {
                setSelaVisibility("18");
              },
            ),
            ListTile(
              title: new Text("17"),
              onTap: () {
                setSelaVisibility("17");
              },
            ),
            ListTile(
              title: new Text('16'),
              onTap: () {
                setSelaVisibility("16");
              },
            ),
            ListTile(
              title: new Text('15'),
              onTap: () {
                setSelaVisibility("15");
              },
            ),
            ListTile(
              title: new Text('14'),
              onTap: () {
                setSelaVisibility("14");
              },
            ),
            ListTile(
              title: new Text('13'),
              onTap: () {
                setSelaVisibility("13");
              },
            ),
            ListTile(
              title: new Text('12'),
              onTap: () {
                setSelaVisibility("12");
              },
            ),
            ListTile(
              title: new Text('11'),
              onTap: () {
                setSelaVisibility("11");
              },
            ),
            ListTile(
              title: new Text('21'),
              onTap: () {
                setSelaVisibility("21");
              },
            ),
            ListTile(
              title: new Text('22'),
              onTap: () {
                setSelaVisibility("22");
              },
            ),
            ListTile(
              title: new Text('23'),
              onTap: () {
                setSelaVisibility("23");
              },
            ),
            ListTile(
              title: new Text('24'),
              onTap: () {
                setSelaVisibility("24");
              },
            ),
            ListTile(
              title: new Text('25'),
              onTap: () {
                setSelaVisibility("25");
              },
            ),
            ListTile(
              title: new Text('26'),
              onTap: () {
                setSelaVisibility("26");
              },
            ),
            ListTile(
              title: new Text('27'),
              onTap: () {
                setSelaVisibility("27");
              },
            ),
            ListTile(
              title: new Text('28'),
              onTap: () {
                setSelaVisibility("28");
              },
            ),
          ],
        ),
      ),
    );
  }


  void setdenteVisibility(String s) {
    String name = "dente$s";
    if(maxila != null){
      var objsNaPosicao = maxila!.children.where((element) => element.name!.contains(s) && element.visiable && element.name != name).toList();
      objsNaPosicao.forEach((element) {element.visiable =false;});
      var dente = maxila!.children.firstWhere((element) => element.name!.contains(name));
      if(dente.visiable){
        dente.visiable = false;
      }else{
        dente.visiable = true;
      }
      dente.scene!.update();
    }
  }

  void setSelaVisibility(String s) {
    String denteName = "dente$s";
    String selaName = "sela$s";
    if(maxila != null){
      var objsNaPosicao = maxila!.children.where((element) => element.name!.contains(s) && element.visiable && element.name != selaName).toList();
      objsNaPosicao.forEach((element) {element.visiable =false;});
      var dente = maxila!.children.firstWhere((element) => element.name!.contains(denteName));
      var sela = maxila!.children.firstWhere((element) => element.name!.contains(selaName));

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
      maxila!.scene!.update();
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
              title: new Text("Recobrimento Palatino Mediano"),
              onTap: () {
                setConectorVisibility("c_recobrimento_palatino_mediano");
              },
            ),
            ListTile(
              title: new Text("Chapeado Palatino"),
              onTap: () {
                setConectorVisibility("c_chapeado_palatino");
              },
            ),
          ],
        ),
      ),
    );
  }

  void setConectorVisibility(String s) {
    String name = "$s";
    if(maxila != null){
      var conector = maxila!.children.firstWhere((element) => element.name!.contains(name));
      var conectores = maxila!.children.where((element) => element.name!.contains("c_") && element.visiable ==true);
      conectores.forEach((element) {element.visiable = false;});
      if(conector.visiable){
        conector.visiable = false;
      }else{
        conector.visiable = true;
      }
      maxila!.updateTransform();
      maxila!.scene!.update();
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
                showModalDentesComAckerDistal(context);
                //setConectorVisibility("c_recobrimento_palatino_mediano");
              },
            ),
            ListTile(
              title: new Text("Ackers Mesial"),
              onTap: () {
                showModalDentesComAckerMesial(context);
                //setConectorVisibility("c_recobrimento_palatino_mediano");
              },
            ),
            ListTile(
              title: new Text("Circunferencial Modificado"),
              onTap: () {
                showModalDentesComCircuferencial(context);
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
              title: new Text("14"),
              onTap: () {
                setGrampoVisibility("14","distal");
              },
            ),
            ListTile(
              title: new Text("15"),
              onTap: () {
                setGrampoVisibility("15","distal");
              },
            ),
            ListTile(
              title: new Text('16'),
              onTap: () {
                setGrampoVisibility("16","distal");
              },
            ),
            ListTile(
              title: new Text('17'),
              onTap: () {
                setGrampoVisibility("17","distal");
              },
            ),
            ListTile(
              title: new Text('18'),
              onTap: () {
                setGrampoVisibility("18","distal");
              },
            ),
            ListTile(
              title: new Text('24'),
              onTap: () {
                setGrampoVisibility("24","distal");
              },
            ),
            ListTile(
              title: new Text('25'),
              onTap: () {
                setGrampoVisibility("25","distal");
              },
            ),
            ListTile(
              title: new Text('26'),
              onTap: () {
                setGrampoVisibility("26","distal");
              },
            ),
            ListTile(
              title: new Text('27'),
              onTap: () {
                setGrampoVisibility("27","distal");
              },
            ),
            ListTile(
              title: new Text('28'),
              onTap: () {
                setGrampoVisibility("28","distal");
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
              title: new Text("14"),
              onTap: () {
                setGrampoVisibility("14","mesial");
              },
            ),
            ListTile(
              title: new Text("15"),
              onTap: () {
                setGrampoVisibility("15","mesial");
              },
            ),
            ListTile(
              title: new Text('16'),
              onTap: () {
                setGrampoVisibility("16","mesial");
              },
            ),
            ListTile(
              title: new Text('17'),
              onTap: () {
                setGrampoVisibility("17","mesial");
              },
            ),
            ListTile(
              title: new Text('18'),
              onTap: () {
                setGrampoVisibility("18","mesial");
              },
            ),
            ListTile(
              title: new Text('24'),
              onTap: () {
                setGrampoVisibility("24","mesial");
              },
            ),
            ListTile(
              title: new Text('25'),
              onTap: () {
                setGrampoVisibility("25","mesial");
              },
            ),
            ListTile(
              title: new Text('26'),
              onTap: () {
                setGrampoVisibility("26","mesial");
              },
            ),
            ListTile(
              title: new Text('27'),
              onTap: () {
                setGrampoVisibility("27","mesial");
              },
            ),
            ListTile(
              title: new Text('28'),
              onTap: () {
                setGrampoVisibility("28","mesial");
              },
            ),
          ],
        ),
      ),
    );
  }

  void showModalDentesComCircuferencial(BuildContext context) {
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
              title: new Text("11"),
              onTap: () {
                setGrampoVisibility("11","circunferencial");
              },
            ),
            ListTile(
              title: new Text("12"),
              onTap: () {
                setGrampoVisibility("12","circunferencial");
              },
            ),
            ListTile(
              title: new Text('13'),
              onTap: () {
                setGrampoVisibility("13","circunferencial");
              },
            ),
            ListTile(
              title: new Text('21'),
              onTap: () {
                setGrampoVisibility("21","circunferencial");
              },
            ),
            ListTile(
              title: new Text('22'),
              onTap: () {
                setGrampoVisibility("22","circunferencial");
              },
            ),
            ListTile(
              title: new Text('23'),
              onTap: () {
                setGrampoVisibility("23","circunferencial");
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
    if(maxila != null){
      var grampo = maxila!.children.firstWhere((element) => element.name!.contains(tipoGrampo) && element.name!.contains(s));
      var objsNaPosicao = maxila!.children.where((element) => element.name!.contains(s) && element.visiable && element.name!.contains("g_") && element.name != grampo.name).toList();
      objsNaPosicao.forEach((element) {element.visiable =false;});
      var denteisActive = maxila!.children.firstWhere((element) => element.name!.contains(denteName)).visiable;
      var selaisActive = maxila!.children.firstWhere((element) => element.name!.contains(selaName)).visiable;

      if(denteisActive && !selaisActive){
        if(grampo.visiable){
          grampo.visiable =false;
        }else{
          grampo.visiable = true;
        }
      }
      maxila!.scene!.update();
    }
  }

}
