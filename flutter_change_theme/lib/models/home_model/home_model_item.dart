class HomeModelItem {
  String iconStr;
  String title;
  String subTitle;
  String pageRouter;
  bool tapHighlight;

  HomeModelItem({
    this.iconStr,
    this.title,
    this.subTitle,
    this.pageRouter,
    this.tapHighlight,
  });

  HomeModelItem.fromJson(Map<String, dynamic> json) {
    title = json['title'];
    if (json['subTitle'] != null) {
      subTitle = json['subTitle'];
    }
    if (json['iconStr'] != null) {
      iconStr = json['iconStr'];
    }
    if (json['pageRouter'] != null) {
      pageRouter = json['pageRouter'];
    }
    if (json['tapHighlight'] != null) {
      tapHighlight = json['tapHighlight'];
    }
  }

  Map<String, dynamic> toJson() {
    final data = <String, dynamic>{};
    data['title'] = title;
    if (iconStr != null) {
      data['iconStr'] = iconStr;
    }
    if (subTitle != null) {
      data['subTitle'] = subTitle;
    }
    if (pageRouter != null) {
      data['pageRouter'] = pageRouter;
    }
    if (tapHighlight != null) {
      data['tapHighlight'] = tapHighlight;
    }
    return data;
  }
}
