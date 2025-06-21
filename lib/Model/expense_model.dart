class ExpenseModel {
  final String item;
  final int amount;
  final DateTime date;
  final String type;
  final String note;
  ExpenseModel(
      {required this.item,
      required this.amount,
      required this.date,
      required this.type,
      required this.note});

  Map<String, dynamic> toMap() {
    return {
      'item': item,
      'amount': amount,
      'date': date.toString(),
      'type': type,
      'note': note
    };
  }

  factory ExpenseModel.fromMap(Map<String, dynamic> map) {
    return ExpenseModel(
        item: map['item'] ?? "",
        amount: map['amount'] ?? 0,
        date: DateTime.parse(map['date']),
        type: map['type'] ?? "",
        note: map['note'] ?? "");
  }
}
