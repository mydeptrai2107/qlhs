import 'package:flutter/material.dart';
import 'package:qlhs/models/khoa.dart';
import 'package:qlhs/repository/repository.dart';

class DepartmentScreen extends StatefulWidget {
  const DepartmentScreen({super.key});

  @override
  State<DepartmentScreen> createState() => _DepartmentScreenState();
}

class _DepartmentScreenState extends State<DepartmentScreen> {
  List<Khoa> departments = [];
  final repository = Repository();
  init() async {
    departments = await repository.getDepartment();
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
            DataColumn(label: Text('Mã khoa')),
            DataColumn(label: Text('Khoa')),
            DataColumn(label: Text('Liên hệ')),
          ],
          rows: [
            for (int i = 0; i < departments.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(departments[i].maKh.toString()),
                  ),
                  DataCell(
                    Text(departments[i].tenKh),
                  ),
                  DataCell(
                    Text(departments[i].lienheKh),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
