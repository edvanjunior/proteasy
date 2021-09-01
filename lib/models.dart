import 'dart:convert';

import 'package:flutter_cube/flutter_cube.dart';
import 'package:shared_preferences/shared_preferences.dart';
class ObjectInstance{
  String? name;
  List<MapObject>? objects;
  ObjectInstance(this.name,this.objects);


  ObjectInstance.fromJson(Map<String, dynamic> json) {
    name = json['name'];
    if (json['objects'] != null) {
      objects = <MapObject>[];
      json['objects'].forEach((v) {
        objects!.add(new MapObject.fromJson(v));
      });
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['name'] = this.name;
    if (this.objects != null) {
      data['objects'] =
          this.objects!.map((v) => v.toJson()).toList();
    }
    return data;
  }

}

class MapObject{
   MapObject(
      this.name,
      this.visible
      );
  String? name;
  bool? visible;

  MapObject.fromJson(Map<String,dynamic> json){
    name = json['name'];
    visible = json['visible'];
  }

   Map<String, dynamic> toJson() {
     final Map<String, dynamic> data = new Map<String, dynamic>();
     data['name'] = this.name;
     data['visible'] = this.visible;
     return data;
   }

}


void saveObjectInstance(Object object, String name) async {
    List<MapObject> map = [];
    object.children.forEach((e) {map.add(MapObject(e.name!, e.visiable));});
    ObjectInstance obj = ObjectInstance(name,map);
    final prefs = await SharedPreferences.getInstance();
    var keys = prefs.getKeys();
    var data = jsonEncode(obj.toJson());
    prefs.setString(name.trim(), data);
}