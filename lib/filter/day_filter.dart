library day_filter;

import 'package:angular/angular.dart';

@NgFilter(name: 'dayfilter')
class DayFilter {
  List call(dayList,day) {
   return dayList;
  }
}
