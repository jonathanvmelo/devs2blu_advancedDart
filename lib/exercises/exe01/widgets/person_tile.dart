import 'package:flutter/material.dart';
import 'package:flutter_advanced_dart/exercises/exe01/models/person_model.dart';

class PersonTile extends StatelessWidget {
  PersonTile({super.key, required this.person});
  PersonModel person;

  @override
  Widget build(BuildContext context) {
    return ListTile(
      leading: Icon(
        Icons.person,
        color: Colors.blueAccent,
      ),
      title: Text(person.name),
      subtitle: Text(person.yearBirth),
    );
  }
}
