library slot;

import 'dart:convert';
import 'package:devoxx_2014/service/conference.dart';
import 'package:json/json.dart';

class Slot {
  String id;
  String hourBegin;
  String hourEnd;
  List<Conference> conferences;

  Slot(this.id, this.hourBegin, this.hourEnd, this.conferences);

  String toJsonString() {
    Map data = {
                "id":id,
                 "hourBegin":hourBegin,
                 "hourEnd":hourEnd,
     "conferences":conferences
     };    
      
 
    return JSON.encode(data);
  }

  factory Slot.fromJsonMap(Map json) {
    List conferencesJson = parse( json['conferences'] );
    List<Conference> conferencesList  = new List<Conference>();
    conferencesJson.forEach((elmtConf)=>conferencesList.add(new Conference.fromJsonMap(elmtConf)));
    return new Slot(json['id'], json['hourBegin'], json['hourEnd'],conferencesList);
  }
}
        

