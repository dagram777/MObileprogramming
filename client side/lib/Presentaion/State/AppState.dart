import 'package:flutter/cupertino.dart';
import 'package:flutter_application_9/Domain/Course.dart';
import 'package:flutter_application_9/Domain/Year.dart';
import 'package:flutter_application_9/Domain/school.dart';

class SchoolAppState extends ChangeNotifier{
 Year? selectedYear;
  List<Year> years = Year.valueOfyears;
  void selectYear(year){
    selectedYear = year;
    print(selectedYear);
    notifyListeners();
  }

  
  Schools? selectedSchool;
  List<Schools> schools = Schools.nameOfdepartment;
  void selectSchool(Schools? school){
    selectedSchool = school;
    print(selectedSchool);
    notifyListeners();
  }
  Course? selectedCourse;
  void selectCourse(Course? course){
    selectedCourse = course;
    notifyListeners();
  }

}