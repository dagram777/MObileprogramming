class Year{
  String name;
  String value;
  

  Year({
   required this.name,
   required this.value
  }
  );
  static List<Year> valueOfyears=[
   Year(name:"First Year Courses", value: '1'),
   Year(name:"Second Year Courses", value:'2'),
   Year(name:"Third Year Courses",value:'3'),
   Year(name:"Fourth Year Courses",value:'4'),
   Year(name:"Fifth Year Courses",value:'5'),
  ];
}