import 'package:flutter_change_theme/models/home_model/home_model_item.dart';

class HomeModelGroup {
  String header;
  String footer;
  List<HomeModelItem> items;

  HomeModelGroup.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = new List<HomeModelItem>();
      json['items'].forEach((value) {
        items.add(new HomeModelItem.fromJson(value));
      });
    }
    if (json['header'] != null) {
      header = json['header'];
    }
    if (json['footer'] != null) {
      footer = json['footer'];
    }
  }

  Map<String, dynamic> toJson() {
    final Map<String, dynamic> data = new Map<String, dynamic>();
    if (this.header != null) {
      data['header'] = this.header;
    }
    if (this.footer != null) {
      data['footer'] = this.footer;
    }
    if (this.items != null) {
      data['items'] = this.items.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
