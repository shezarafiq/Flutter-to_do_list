import 'package:flutter/material.dart';
import 'for_student_add_student.dart';
import 'for_students_edit_screen.dart';

void main() {
 runApp(const StudentApp());
}

class Student {
 int id;
 String name;
 String fatherName;
 List<String>? subjects;

 Student({
  required this.id,
  required this.name,
  required this.fatherName,
  this.subjects,
 });
}

class StudentApp extends StatelessWidget {
 const StudentApp({super.key});

 @override
 Widget build(BuildContext context) {
  return const MaterialApp(
   debugShowCheckedModeBanner: false,
   home: StudentListScreen(),
  );
 }
}

// =====================================================
// SCREEN 1: STUDENT LIST
// =====================================================

class StudentListScreen extends StatefulWidget {
 const StudentListScreen({super.key});

 @override
 State<StudentListScreen> createState() =>
     _StudentListScreenState();
}

class _StudentListScreenState extends State<StudentListScreen> {
 // Student list
 List<Student> students = [
  Student(
   id: 1,
   name: "Sheza",
   fatherName: "Rafiq",
  ),
  Student(
   id: 2,
   name: "Hasan",
   fatherName: "Faizan",
  ),
  Student(
   id: 3,
   name: "Zainab",
   fatherName: "Hasan",
  ),
  Student(
   id: 4,
   name: "Muhib",
   fatherName: "Arif",
  ),
 ];

 // =====================================================
 // OPEN SECOND SCREEN
 // =====================================================

 void addStudent() async {
  final result = await Navigator.push(
   context,
   MaterialPageRoute(
    builder: (context) => const ForStudentAddStudent(),
   ),
  );

  if (result != null && result is Student) {
   setState(() {
    students.add(result);
   });
  }
 }

 // =====================================================
 // REMOVE STUDENT
 // =====================================================

 void removeStudent(int id) {
  setState(() {
   students.removeWhere(
        (student) => student.id == id,
   );
  });
 }

 // =====================================================
 // EDIT STUDENT
 // =====================================================

 void editStudent(Student studentModelToEdit) async {
  final result = await Navigator.push(
   context,
   MaterialPageRoute(
    builder: (context) => ForStudentsEditScreen(
     studentModelToEdit: studentModelToEdit,
    ),
   ),
  );

  if (result != null && result is Student) {
   int foundIndex = students.indexWhere(
        (student) => student.id == result.id,
   );

   if (foundIndex != -1) {
    setState(() {
     students[foundIndex] = result;
    });
   }
  }
 }

 // =====================================================
 // STUDENT CARD
 // =====================================================

 Widget myStudentCard(Student student) {
  return Container(
   width: double.infinity,
   margin: const EdgeInsets.only(bottom: 10),
   decoration: BoxDecoration(
    color: Colors.blue.shade50,
    borderRadius: BorderRadius.circular(10),
   ),
   child: Row(
    children: [
     Expanded(
      child: Container(
       padding: const EdgeInsets.all(12),
       child: Row(
        children: [
         Expanded(
          child: Column(
           crossAxisAlignment:
           CrossAxisAlignment.start,
           children: [
            Text(
             student.name,
             style: const TextStyle(
              fontWeight: FontWeight.bold,
              fontSize: 18,
             ),
            ),

            const SizedBox(height: 5),

            Text(
             "ID: ${student.id}",
             style: const TextStyle(
              fontWeight: FontWeight.bold,
              color: Colors.blue,
             ),
            ),

            const SizedBox(height: 5),

            Text(
             student.fatherName,
            ),
           ],
          ),
         ),

         Row(
          children: [
           // EDIT BUTTON
           InkWell(
            onTap: () {
             editStudent(student);
            },
            child: Container(
             padding: const EdgeInsets.all(8),
             decoration: const BoxDecoration(
              color: Colors.white,
              shape: BoxShape.circle,
             ),
             child: const Icon(
              Icons.edit,
             ),
            ),
           ),

           const SizedBox(width: 10),

           // DELETE BUTTON
           InkWell(
            onTap: () {
             removeStudent(student.id);
            },
            child: Container(
             padding: const EdgeInsets.all(8),
             decoration: const BoxDecoration(
              color: Colors.red,
              shape: BoxShape.circle,
             ),
             child: const Icon(
              Icons.delete,
              color: Colors.white,
             ),
            ),
           ),
          ],
         ),
        ],
       ),
      ),
     ),
    ],
   ),
  );
 }

 // =====================================================
 // BUILD
 // =====================================================

 @override
 Widget build(BuildContext context) {
  return Scaffold(
   appBar: AppBar(
    title: const Text(
     'STUDENT MANAGEMENT LIST ',
    ),
   ),

   body: SingleChildScrollView(
    child: Container(
     padding: const EdgeInsets.all(16),
     child: Column(
      children: [
       ListView.builder(
        itemCount: students.length,
        shrinkWrap: true,
        physics: const NeverScrollableScrollPhysics(),
        itemBuilder: (context, index) {
         return myStudentCard(
          students[index],
         );
        },
       ),
      ],
     ),
    ),
   ),

   // =================================================
   // PLUS BUTTON
   // =================================================

   floatingActionButton: InkWell(
    onTap: addStudent,
    child: Container(
     padding: const EdgeInsets.all(15),
     decoration: const BoxDecoration(
      color: Colors.blue,
      shape: BoxShape.circle,
     ),
     child: const Icon(
      Icons.add,
      color: Colors.white,
     ),
    ),
   ),
  );
 }
}