library speaker;

import 'dart:convert';

class Speaker {
  String id;
  String lastname;
  String firstname;
  String twitter;

  Speaker(this.id, this.lastname,this.firstname,this.twitter);

  String toJsonString() {
    Map data ={ 
                "lastname":lastname, 
                "firstname":firstname,
                "twitter":twitter,
                 id:id } ;
    return JSON.encode(data);
  }

  factory Speaker.fromJsonMap(Map json) {
    return new Speaker(json['id'], json['lastname'],json['firstname'],json['twitter']);
  }
}