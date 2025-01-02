import 'package:flutter/material.dart';
import 'package:qlhs/models/class.dart';
import 'package:qlhs/repository/repository.dart';

class ClassScreen extends StatefulWidget {
  const ClassScreen({super.key});

  @override
  State<ClassScreen> createState() => _ClassScreenState();
}

class _ClassScreenState extends State<ClassScreen> {
  List<Lop> classs = [];
  final repository = Repository();
  init() async {
    classs = await repository.getClass();
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
            DataColumn(label: Text('Mã Lớp')),
            DataColumn(label: Text('Tên Lớp')),
            DataColumn(label: Text('Mã Khoa')),
          ],
          rows: [
            for (int i = 0; i < classs.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(classs[i].maLop.toString()),
                  ),
                  DataCell(
                    Text(classs[i].tenLop),
                  ),
                  DataCell(
                    Text(classs[i].khoa.maKh),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
