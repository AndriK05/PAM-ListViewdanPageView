import 'package:flutter/material.dart';
import '../models/student.dart';

class StudentDetailScreen extends StatefulWidget {
  final Student student;

  const StudentDetailScreen({super.key, required this.student});

  @override
  State<StudentDetailScreen> createState() => _StudentDetailScreenState();
}

class _StudentDetailScreenState extends State<StudentDetailScreen> {
  final PageController _controller = PageController();
  int currentPage = 0;

  void onPageChanged(int index) {
    setState(() => currentPage = index);
  }

  Widget buildIndicator() {
    return Row(
      mainAxisAlignment: MainAxisAlignment.center,
      children: List.generate(3, (index) {
        return Container(
          margin: const EdgeInsets.all(4),
          width: currentPage == index ? 12 : 8,
          height: currentPage == index ? 12 : 8,
          decoration: BoxDecoration(
            color: currentPage == index ? Colors.blue : Colors.grey,
            shape: BoxShape.circle,
          ),
        );
      }),
    );
  }

  @override
  Widget build(BuildContext context) {
    final student = widget.student;

    return Scaffold(
      appBar: AppBar(title: Text(student.name)),
      body: Column(
        children: [
          Expanded(
            child: PageView(
              controller: _controller,
              onPageChanged: onPageChanged,
              children: [
                // PROFIL
                _buildPage("Profil", [
                  "Nama: ${student.name}",
                  "NIM: ${student.nim}",
                  "Jurusan: ${student.jurusan}",
                ]),

                // JADWAL
                _buildPage("Jadwal", [
                  "Senin: Pemrograman",
                  "Selasa: Basis Data",
                  "Rabu: Jaringan",
                  "Kamis: Algoritma",
                  "Jumat: Sistem Operasi",
                ]),

                // NILAI
                _buildPage("Nilai", [
                  "Pemrograman: A",
                  "Basis Data: B+",
                  "Jaringan: A-",
                  "Algoritma: B",
                  "Sistem Operasi: A",
                ]),
              ],
            ),
          ),

          const SizedBox(height: 10),
          buildIndicator(), // BONUS ✅
          const SizedBox(height: 20),
        ],
      ),
    );
  }

  Widget _buildPage(String title, List<String> content) {
    return Padding(
      padding: const EdgeInsets.all(20),
      child: Card(
        elevation: 5,
        child: Padding(
          padding: const EdgeInsets.all(16),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.center,
            children: [
              Text(
                title,
                style: const TextStyle(
                  fontSize: 22,
                  fontWeight: FontWeight.bold,
                ),
              ),
              const SizedBox(height: 20),
              ...content.map(
                (e) =>
                    Padding(padding: const EdgeInsets.all(4), child: Text(e)),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
