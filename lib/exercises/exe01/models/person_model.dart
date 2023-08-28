class PersonModel {
  String name = "";
  String yearBirth = "";

  PersonModel({required this.name, required this.yearBirth});

  PersonModel.fromJson(Map<String, dynamic> personJson) {
    name = personJson["name"];
    yearBirth = personJson["birth_year"];
  }
}
