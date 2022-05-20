class Medication {
  String name;
  String dosage;
  int quantity;
  DateTime startDate;
  DateTime endDate;
  String? notes;

  Medication(
      {required this.name,
      required this.dosage,
      required this.quantity,
      required this.startDate,
      required this.endDate,
      this.notes});

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dosage': dosage,
      'quantity': quantity,
      'startDate': startDate,
      'endDate': endDate,
      'notes': notes
    };
  }

  static Medication fromMap(Map<String, dynamic> mdc) {
    //Todo change this to medication
    return Medication(
        name: mdc['name']!,
        dosage: mdc['dosage']!,
        quantity: mdc['quantity']!,
        startDate: mdc['startDate']!,
        endDate: mdc['endDate']!,
        notes: mdc['notes']);
  }
}
