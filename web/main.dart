library devoxx_2014;

import 'package:angular/angular.dart';
import 'package:di/di.dart';
import 'package:logging/logging.dart';

import 'package:devoxx_2014/schedule.dart';
import 'package:devoxx_2014/filter/day_filter.dart';
import 'package:devoxx_2014/service/query_service.dart';

// Temporary, please follow https://github.com/angular/angular.dart/issues/476
@MirrorsUsed(
  targets: const ['day', 'query_service'],
  override: '*')
import 'dart:mirrors';

class DevoxxFrModule extends Module {
  DevoxxFrModule() {
    type(ScheduleController);
//    type(RatingComponent);
    type(DayFilter);
//    type(SearchConf);
//    type(ViewRecipeComponent);
    type(QueryService);
  }
}

void main() {
  Logger.root.level = Level.FINEST;
  Logger.root.onRecord.listen((LogRecord r) { print(r.message); });
  ngBootstrap(module: new DevoxxFrModule());
}
