class Medication {
  String name;
  String dosage;
  int quantity;
  String startDate;
  String endDate;
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
}
