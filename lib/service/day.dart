library day;

import 'dart:convert';
import 'package:devoxx_2014/service/slot.dart';
class Day {
  String label;
  int date;
  List<Slot> slots;

  Day(this.label, this.date);

  String toJsonString() {
    Map data ={
               "label":label,
               "date":date,
               } ;
    return JSON.encode(data);
  }

  factory Day.fromJsonMap(Map json) {
    return new Day(json['label'], json['date']);
  }
}
