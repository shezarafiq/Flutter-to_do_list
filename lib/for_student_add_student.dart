import 'dart:math';
import 'package:flutter/material.dart';
import 'package:to_do_list/components/custom_button.dart';
import 'package:to_do_list/components/custom_text_file.dart';
import 'main.dart';

class ForStudentAddStudent extends StatefulWidget {
  const ForStudentAddStudent({super.key});
  @override
  State<ForStudentAddStudent> createState() {
    return _ForStudentAddStudentState();
  }
}
class _ForStudentAddStudentState
    extends State<ForStudentAddStudent> {
  final TextEditingController nameController =
  TextEditingController();

  final TextEditingController fatherNameController =
  TextEditingController();

  void saveStudent() {
    String name = nameController.text;
    String fatherName = fatherNameController.text;

    if (name.isNotEmpty && fatherName.isNotEmpty) {
      final newStudent = Student(
        id: Random().nextInt(10),
        name: name,
        fatherName: fatherName,
      );

      Navigator.pop(
        context,
        newStudent,
      );
    } else {
      ScaffoldMessenger.of(context).showSnackBar(
        const SnackBar(
          content: Text(
            "Name and Father name can't be empty",
          ),
          behavior: SnackBarBehavior.floating,
          duration: Duration(seconds: 2),
          backgroundColor: Colors.black87,
        ),
      );
    }
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Add Student"),
      ),

      body: Padding(
        padding: const EdgeInsets.all(20),

        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,

          children: [
            // ==============================
            // NAME
            // ==============================

            CustomTextField(
              componentController: nameController,
              hintText: "Enter Name",
            ),

            // GAP
            const SizedBox(height: 25),

            // ==============================
            // FATHER NAME
            // ==============================

            CustomTextField(
              componentController: fatherNameController,
              hintText: "Enter Father Name",
            ),

            // GAP
            const SizedBox(height: 35),

            // ==============================
            // ADD BUTTON
            // ==============================

            CustomButton(
              onButtonTap: () {
                saveStudent();
              },
              label: "Add",
            ),
          ],
        ),
      ),
    );
  }
}