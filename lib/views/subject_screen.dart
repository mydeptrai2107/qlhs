import 'package:flutter/material.dart';
import 'package:qlhs/models/subject.dart';
import 'package:qlhs/repository/repository.dart';

class SubjectScreen extends StatefulWidget {
  const SubjectScreen({super.key});

  @override
  State<SubjectScreen> createState() => _SubjectScreenState();
}

class _SubjectScreenState extends State<SubjectScreen> {
  List<Subject> subjects = [];
  final repository = Repository();
  init() async {
    subjects = await repository.getSubject();
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
            DataColumn(label: Text('Mã Môn Học')),
            DataColumn(label: Text('Tên Môn Học')),
            DataColumn(label: Text('Số Tín Chỉ')),
            DataColumn(label: Text('Thể Loại')),
          ],
          rows: [
            for (int i = 0; i < subjects.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(subjects[i].maMh.toString()),
                  ),
                  DataCell(
                    Text(subjects[i].tenMh),
                  ),
                  DataCell(
                    Text(subjects[i].tinChi.soTc.toString()),
                  ),
                  DataCell(
                    Text(subjects[i].theLoai.tenTl.toString()),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
