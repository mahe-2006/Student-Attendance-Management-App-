class Student {
  int id;
  String name;
  String rollNumber;
  bool present;

  Student({
    required this.id,
    required this.name,
    required this.rollNumber,
    this.present = false,
  });
}
