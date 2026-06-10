import 'package:flutter/material.dart';
import '../models/student.dart';
import '../widgets/student_card.dart';
import 'student_detail_screen.dart';

class StudentListScreen extends StatelessWidget {
  const StudentListScreen({super.key});

  @override
  Widget build(BuildContext context) {
    final students = [
      Student(name: "Andri", nim: "123", jurusan: "Informatika"),
      Student(name: "Budi", nim: "456", jurusan: "Sistem Informasi"),
      Student(name: "Citra", nim: "789", jurusan: "Teknik Komputer"),
      Student(name: "Dewi", nim: "012", jurusan: "Informatika"),
      Student(name: "Eka", nim: "345", jurusan: "Sistem Informasi"),
    ];

    return Scaffold(
      appBar: AppBar(title: const Text("Daftar Mahasiswa")),
      body: ListView.builder(
        itemCount: students.length,
        itemBuilder: (context, index) {
          return StudentCard(
            student: students[index],
            onTap: () {
              Navigator.push(
                context,
                MaterialPageRoute(
                  builder: (_) => StudentDetailScreen(student: students[index]),
                ),
              );
            },
          );
        },
      ),
    );
  }
}
