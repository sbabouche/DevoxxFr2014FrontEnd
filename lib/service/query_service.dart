library query_service;

import 'dart:async';

import 'package:angular/angular.dart';
import 'package:devoxx_2014/service/day.dart';

class QueryService {
  String _scheduleUrl = 'schedule.json';

  Future _loaded;
 
  List<Day> _daysCache;

  Http _http;

  QueryService(Http this._http) {
    _loaded = Future.wait([_loadDays()]);
  }

  Future _loadDays() {
    return _http.get(_scheduleUrl)
      .then((HttpResponse response) {
        _daysCache = new List<Day>();
        for (Map dayJson in response.data) {
          Day day = new Day.fromJsonMap(dayJson);
          _daysCache.add(day);
        }
      });
  }


  Future<List<Day>> getAllDays() {
    return _daysCache == null
        ? _loaded.then((_) => _daysCache)
        : new Future.value(_daysCache);
  }
}
