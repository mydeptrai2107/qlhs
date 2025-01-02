import 'package:flutter/material.dart';
import 'package:qlhs/models/semester.dart';
import 'package:qlhs/repository/repository.dart';

class SemesterScreen extends StatefulWidget {
  const SemesterScreen({super.key});

  @override
  State<SemesterScreen> createState() => _SemesterScreenState();
}

class _SemesterScreenState extends State<SemesterScreen> {
  List<Semester> semesters = [];
  final repository = Repository();
  init() async {
    semesters = await repository.getSemester();
    setState(() {});
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return Container(
      padding: EdgeInsets.all(15),
      child: SingleChildScrollView(
        scrollDirection: Axis.horizontal,
        child: DataTable(
          columns: [
            DataColumn(label: Text('Mã Học Kỳ')),
            DataColumn(label: Text('Tên Học Kỳ')),
          ],
          rows: [
            for (int i = 0; i < semesters.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(semesters[i].maHk.toString()),
                  ),
                  DataCell(
                    Text(semesters[i].tenHk),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
