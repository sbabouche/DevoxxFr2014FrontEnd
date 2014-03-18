library conference;

import 'dart:convert';
import 'package:devoxx_2014/service/speaker.dart';
import 'package:json/json.dart';


class Conference {
  String id;
  String label;
  int date;
  String title;
  
  String room;
  String place;
  int crowds;
  int forecastcrowds;
  int nbfavorite;
  List<Speaker> speakers;

  Conference(this.id,this.title, this.room,this.place,this.crowds,this.forecastcrowds,this.nbfavorite,this.speakers);

  String toJsonString() {
    Map data =   {
              "title":title,
              "id":id,
              "room":room, 
                "place":place,
                  "crowds":crowds,
                  "forecastcrowds":forecastcrowds,
                  "nbfavorite":nbfavorite,
                  "speakers": speakers
            }  ;
    return JSON.encode(data);
  }

  factory Conference.fromJsonMap(Map json) {
    List speakersJson = parse( json['speakers'] );
    List<Speaker> speakersList  = new List<Speaker>();
    speakersJson.forEach((elmtSpeaker)=>speakersList.add(new Speaker.fromJsonMap(elmtSpeaker)));
    return new Conference(json['id'], json['title'],json['room'], json['place'],json['crowds'], json['forecastcrowds'],json['nbfavorite'], speakersList);
  }
}