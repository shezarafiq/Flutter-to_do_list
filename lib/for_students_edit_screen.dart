import 'package:flutter/material.dart';
import 'main.dart';

class ForStudentsEditScreen extends StatefulWidget {
final Student studentModelToEdit;

const ForStudentsEditScreen({
  super.key,
  required this.studentModelToEdit,

});

@override
State<ForStudentsEditScreen> createState() =>
_ForStudentsEditScreenState();
}

class _ForStudentsEditScreenState
extends State<ForStudentsEditScreen> {

final TextEditingController nameController =
TextEditingController();

final TextEditingController fatherNameController =
TextEditingController();

// =====================================================
// SAVE EDIT
// =====================================================

void saveEdit() {
String name = nameController.text;
String fatherName = fatherNameController.text;

if (name.isNotEmpty && fatherName.isNotEmpty) {

final updatedStudent = Student(
id: widget.studentModelToEdit.id,
name: name,
fatherName: fatherName,
);

Navigator.pop(
context,
updatedStudent,
);
}
}
@override
  void initState() {
    // TODO: implement ==
    super.initState();
    nameController.text=widget.studentModelToEdit.name;
    fatherNameController.text=widget.studentModelToEdit.fatherName;
  }
// =====================================================
// BUILD
// =====================================================

@override
Widget build(BuildContext context) {
  return Scaffold(
appBar: AppBar(
title: const Text(
"Edit Student",
),
),

body: Column(
  mainAxisAlignment: MainAxisAlignment.center,
children: [

Text(
widget.studentModelToEdit.id.toString(),
style: const TextStyle(
fontSize: 30,
),
),

TextField(
controller: nameController,
decoration: const InputDecoration(
hintText: "Enter name",
),
),

const SizedBox(height: 50),

TextField(
controller: fatherNameController,
decoration: const InputDecoration(
hintText: "Enter father name",
),
),

const SizedBox(height: 50),

InkWell(
onTap: saveEdit,

child: Container(
height: 50,
width: 180,

decoration: BoxDecoration(
color: Colors.purple,
borderRadius: BorderRadius.circular(15),
),

child: Row(
mainAxisAlignment:
MainAxisAlignment.center,

children: [

const Icon(
Icons.edit,
color: Colors.white,
size: 25,
),

const SizedBox(width: 8),

const Text(
"Save Edit",
style: TextStyle(
color: Colors.white,
fontWeight: FontWeight.bold,
fontSize: 18,
),
),
],
),
),
),
],
),
);
}
}