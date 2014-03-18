library schedule_controller;

import 'package:angular/angular.dart';

import 'package:devoxx_2014/service/day.dart';
import 'package:devoxx_2014/service/slot.dart';
import 'package:devoxx_2014/service/query_service.dart';
//
//import 'tooltip/tooltip_directive.dart';
//import 'service/recipe.dart';
//import 'service/query_service.dart';

@NgController(
    selector: '[schedule]',
    publishAs: 'ctrl')
class ScheduleController {

  static const String LOADING_MESSAGE = "Loading schedule...";
  static const String ERROR_MESSAGE = """Sorry! Some error not schduled!""";

  Http _http;
  QueryService _queryService;
  QueryService get queryService => _queryService;

  // Determine the initial load state of the app
  String message = LOADING_MESSAGE;
  bool daysLoaded = false;

  // Data objects that are loaded from the server side via json
 


  ScheduleController(Http this._http, QueryService this._queryService) {
    _loadData();
  }

  Day selectedDay;
  
  List<Day> days;

  void selectDay(Day day) {
    selectedDay = day;
  }


  void _loadData() {
    _queryService.getAllDays()
      .then((List<Day> allDays) {
        days = allDays;
        daysLoaded = true;
      })
      .catchError((e) {
        print(e);
        daysLoaded = false;
        message = ERROR_MESSAGE;
      });
  }
  
  List<Slot> getSelectedDaySlots(){
    
    return selectedDay == null ? null : selectedDay.slots;
  }
}