// import 'package:get/get.dart';
//
// class AnalyticsController extends GetxController{
//
//   final _expenseController = Get.find();
//   RxString selectedType = 'Expense'.obs;
//   var incomeData = <String, double>{}.obs;
//   var expenseData = <String, double>{}.obs;
//
//   RxDouble totalIncome = 0.0.obs;
//   RxDouble totalExpense = 0.0.obs;
//
//   void onInit(){
//     super.onInit();
//
//     ever(_expenseController.expenseList,(_){
//       setAnalyticsData();
//     });
//
//   }
//
//   void setAnalyticsData(){
//     var items = _expenseController.expense.List;
//     var Item;
//
//     var shownIncome = {};
//     var shownExpense = {};
//
//     double incomeSum =0;
//     double expenseSum =0;
//
//     for( Item in items )
// {
//   if (Item.type == "Income"){
//     incomeSum += Item.amount;
//     shownIncome[Item.item] = (shownIncome[Item.item]);
//
//   }
//   else
// }
//
//   }
//
//
// }