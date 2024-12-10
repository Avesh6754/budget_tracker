class BudgetModalClass {
  int? id, isIncome;
  double? amount;
  String? date, category;

  BudgetModalClass(
      {required this.id,
      required this.isIncome,
      required this.amount,
      required this.date,
      required this.category});

  factory BudgetModalClass.fromMap(Map m1) {
    return BudgetModalClass(
        id: m1['id'],
        isIncome: m1['isIncome'],
        amount: m1['amount'],
        date: m1['date'],
        category: m1['category']);
  }
}
