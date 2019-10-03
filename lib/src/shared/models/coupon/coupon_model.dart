import 'package:flutter/foundation.dart';

import '../category/category_model.dart';
import '../store/store_model.dart';

class CouponModel {
  int id;
  String description;
  String code;
  double discount;
  StoreModel store;
  CategoryModel category;
  String vigency;
  String link;
  bool isNew;

  CouponModel({
    @required this.id,
    @required this.description,
    @required this.code,
    @required this.discount,
    @required this.store,
    @required this.category,
    @required this.vigency,
    @required this.link,
    @required this.isNew,
  });

  CouponModel.fromJson(Map<String, dynamic> json) {
    id = json['id'];
    description = json['description'];
    code = json['code'];
    discount = json['discount'];
    store =
        json['store'] != null ? new StoreModel.fromJson(json['store']) : null;
    category = json['category'] != null
        ? new CategoryModel.fromJson(json['category'])
        : null;
    vigency = json['vigency'];
    link = json['link'];
    isNew = json['new'];
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['id'] = this.id;
    data['description'] = this.description;
    data['code'] = this.code;
    data['discount'] = this.discount;
    if (this.store != null) {
      data['store'] = this.store.toJson();
    }
    if (this.category != null) {
      data['category'] = this.category.toJson();
    }
    data['vigency'] = this.vigency;
    data['link'] = this.link;
    data['new'] = this.isNew;
    return data;
  }
}
