import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:firebase_auth/firebase_auth.dart';
import 'package:get/get.dart';
import '../Model/expense_model.dart';

class ExpenseController extends GetxController {
  RxDouble totalIncome = 0.0.obs;
  RxDouble totalExpense = 0.0.obs;
  RxDouble balance = 0.0.obs;
  var expenseList = <ExpenseModel>[].obs;
  final _firestore = FirebaseFirestore.instance;
  final _auth = FirebaseAuth.instance;
  
  Future<void> addExpense(ExpenseModel expense) async {
    final currentUser = _auth.currentUser;
    
    if (currentUser == null) {
      print("Cannot add expense: No user is logged in.");
      return;
    }
    
    final data = expense.toMap();
    data['userId'] = currentUser.uid;

    try {
      await _firestore.collection('expenses').add(data);
      print("Expense added successfully.");
      fetchExpense();
    } catch (e) {
      print("Failed to add expense: $e");
    }
  }

  void fetchExpense() {
    final currentUser = _auth.currentUser;

    if (currentUser == null) {
      print("Cannot fetch expenses: No user is logged in.");
      return;
    }

    _firestore
        .collection('expenses')
        .where(currentUser.uid)
        .snapshots()
        .listen((snapshot) {
      expenseList.value = snapshot.docs
          .map((doc) => ExpenseModel.fromMap(doc.data()))
          .toList();
      double income = 0;
      double expense = 0;

      for (var item in expenseList.value) {
        if (item.type == "Income") {
          income += item.amount;
        } else {
          expense += item.amount;
        }
      }

      totalIncome.value = income;
      totalExpense.value = expense;
      balance.value = income - expense;

      print("Expenses fetched: ${expenseList.length} item(s).");
    }, onError: (e) {
      print("Error while fetching expenses: $e");
    });
  }
}
