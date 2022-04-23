class Medication {
  String name;
  String dosage;
  int quantity;
  DateTime initDate;
  DateTime endDate;
  String? notes;

  Medication(
      this.name, this.dosage, this.quantity, this.initDate, this.endDate);

  Map<String, dynamic> toMap() {
    return {
      'name': name,
      'dosage': dosage,
      'quantity': quantity,
      'init_date': initDate,
      'end_date': endDate,
      'notes': notes
    };
  }
}
