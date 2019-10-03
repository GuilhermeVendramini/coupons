import 'package:flutter/foundation.dart';

class StoreModel {
  int id;
  String name;
  String image;
  String link;

  StoreModel({
    @required this.id,
    @required this.name,
    @required this.image,
    @required this.link,
  });

  StoreModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    name = json['name'];
    image = json['image'];
    link = json['link'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['name'] = this.name;
    data['image'] = this.image;
    data['link'] = this.link;
    return data;
  }
}
