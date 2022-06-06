import 'package:flutter/cupertino.dart';
import 'package:flutter_application_9/Domain/Year.dart';
import 'package:flutter_application_9/Domain/school.dart';

class YearState extends ChangeNotifier{
 Year? selectedYear;
  List<Year> years = Year.valueOfyears;
  void selectYear(year){
    selectedYear = year;
    print(selectedYear);
    notifyListeners();
  }
}