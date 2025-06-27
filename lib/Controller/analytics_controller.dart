import 'package:get/get.dart';
import 'package:expense_tracker_app/Controller/expense_controller.dart';

class AnalyticsController extends GetxController {
  final ExpenseController _expenseController = Get.find<ExpenseController>();

  RxString selectedType = ''.obs;

  var incomeData = <String, double>{}.obs;
  var expenseData = <String, double>{}.obs;


  RxDouble totalIncome = 0.0.obs;
  RxDouble totalExpense = 0.0.obs;

  @override
  void onInit() {
    super.onInit();


    ever(_expenseController.expenseList, (_) {
      setAnalyticsData();
    });
  }

  void setAnalyticsData() {
    var items = _expenseController.expenseList;

    var Item;

    var shownIncome = <String, double>{};
    var shownExpense = <String, double>{};

    double incomeSum = 0;
    double expenseSum = 0;

    for (Item in items) {
      if (Item.type == "Income") {
        incomeSum += Item.amount;
        shownIncome[Item.item] = (shownIncome[Item.item] ?? 0) + Item.amount;
      } else {
        expenseSum += Item.amount;
        shownExpense[Item.item] = (shownExpense[Item.item] ?? 0) + Item.amount;
      }
    }

    incomeData.value = shownIncome;
    expenseData.value = shownExpense;
    totalIncome.value = incomeSum;
    totalExpense.value = expenseSum;
  }
}
