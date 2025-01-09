import 'package:flutter/material.dart';
import 'package:qlhs/models/semester.dart';
import 'package:qlhs/repository/repository_admin.dart';

class AdminHocKyScreen extends StatefulWidget {
  const AdminHocKyScreen({super.key});

  @override
  State<AdminHocKyScreen> createState() => _AdminHocKyScreenState();
}

class _AdminHocKyScreenState extends State<AdminHocKyScreen> {
  List<HocKy> semesters = [];
  final repository = RepositoryAdmin();
  init() async {
    semesters = await repository.getHocKy();
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
