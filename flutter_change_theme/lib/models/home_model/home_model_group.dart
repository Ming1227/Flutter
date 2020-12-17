import 'package:flutter_change_theme/models/home_model/home_model_item.dart';

class HomeModelGroup {
  String header;
  String footer;
  List<HomeModelItem> items;

  HomeModelGroup.fromJson(Map<String, dynamic> json) {
    if (json['items'] != null) {
      items = <HomeModelItem>[];
      json['items'].forEach((value) {
        items.add(HomeModelItem.fromJson(value));
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
    final data = <String, dynamic>{};
    if (header != null) {
      data['header'] = header;
    }
    if (footer != null) {
      data['footer'] = footer;
    }
    if (items != null) {
      data['items'] = items.map((e) => e.toJson()).toList();
    }
    return data;
  }
}
