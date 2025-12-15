class AnalyticsInfoCard {
  String title;
  String iconPath;

  AnalyticsInfoCard({required this.title, required this.iconPath});

  String get getTitle => title;
  String get getIconPath => iconPath;

  void setTitle(String title) {
    this.title = title;
  }
  void setIconPath(String iconPath) {
    this.iconPath = iconPath;
  }
}
