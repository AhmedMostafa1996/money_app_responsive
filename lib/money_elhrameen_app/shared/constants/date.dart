import 'package:intl/intl.dart';

class UniqueDateList {
  final List<String> dates = [];

  // // الدالة لإضافة التواريخ المختلفة إلى القائمة
  // void addUniqueDates(List<String> newDates) {
  //   for (var date in newDates) {
  //     if (!_dates.contains(date)) {
  //       _dates.add(date);
  //     }
  //   }
  // }


  void addDate(information){
    if(dates.isEmpty){
      dates.add(DateFormat('yyyy-MM-dd').format(DateTime.now()));
    }else{
      if(information[information.length-1]['date']!= DateFormat('yyyy-MM-dd').format(DateTime.now())){
      dates.add(DateFormat('yyyy-MM-dd').format(DateTime.now()));
      }

      }

  }
}

// void main() {
//   // إنشاء قائمة جديدة من نوع UniqueDateList
//   var uniqueDateList = UniqueDateList();
//
//   // تاريخ القائمة الأولي (يمكن تغييره بمجرد تغيير التاريخ في القائمة الجديدة)
//   uniqueDateList.addUniqueDates(['2023-08-01']);
//
//   // إضافة تواريخ جديدة (قد تحتوي على التاريخ الأولي أو تكون جديدة)
//   uniqueDateList.addUniqueDates(['2023-08-01', '2023-08-02', '2023-08-03']);
//
//   // طباعة القائمة النهائية
//   uniqueDateList.printDates(); // النتيجة المتوقعة: [2023-08-01, 2023-08-02, 2023-08-03]
// }
