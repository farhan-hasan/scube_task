import 'dart:ui';

class DataCost {
  String title;
  String data;
  String cost;
  Color? color;


  DataCost({
    required this.title,
    required this.data,
    required this.cost,
    required this.color,
  });

  String get getTitle => title;
  String get getData => data;
  String get getCost => cost;
  Color? get getColor => color;

  void setTitle(String title) {
    this.title = title;
  }

  void setData(String data) {
    this.data = data;
  }

  void setCost(String cost) {
    this.cost = cost;
  }

  void setColor(Color color) {
    this.color = color;
  }

}