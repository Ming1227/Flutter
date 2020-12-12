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
    final Map<String, dynamic> data = new Map<String, dynamic>();
    data['title'] = this.title;
    if (this.iconStr != null) {
      data['iconStr'] = this.iconStr;
    }
    if (this.subTitle != null) {
      data['subTitle'] = this.subTitle;
    }
    if (this.pageRouter != null) {
      data['pageRouter'] = this.pageRouter;
    }
    if (this.tapHighlight != null) {
      data['tapHighlight'] = this.tapHighlight;
    }
    return data;
  }
}
