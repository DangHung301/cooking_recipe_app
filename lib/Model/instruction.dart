class Instructions {
  int? number;
  String? step;

  Instructions({required this.number, required this.step});

  factory Instructions.fromJson(Map<String, dynamic> json) {
    return Instructions(number: json['number'], step: json['step']);
  }
}
