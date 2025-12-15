import 'dart:ui';

class SourceLoadData {
  String title;
  double dataOne;
  double dataTwo;
  String iconPath;
  bool isActive;
  Color? color;


  SourceLoadData({
    required this.title,
    required this.dataOne,
    required this.dataTwo,
    required this.iconPath,
    required this.isActive,
    required this.color,
  });

  String get getTitle => title;
  double get getDataOne => dataOne;
  double get getDataTwo => dataTwo;
  String get getIconPath => iconPath;
  bool get getIsActive => isActive;
  Color? get getColor => color;

  void setTitle(String title) {
    this.title = title;
  }

  void setDataOne(double dataOne) {
    this.dataOne = dataOne;
  }

  void setDataTwo(double dataTwo) {
    this.dataTwo = dataTwo;
  }

  void setIconPath(String iconPath) {
    this.iconPath = iconPath;
  }

  void setIsActive(bool isActive) {
    this.isActive = isActive;
  }

  void setColor(Color color) {
    this.color = color;
  }

}