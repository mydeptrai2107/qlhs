import 'package:flutter/material.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/repository/repository_admin.dart';

class AdminCategoryScreen extends StatefulWidget {
  const AdminCategoryScreen({super.key});

  @override
  State<AdminCategoryScreen> createState() => _AdminCategoryScreenState();
}

class _AdminCategoryScreenState extends State<AdminCategoryScreen> {
  List<Theloai> theloai = [];
  final repository = RepositoryAdmin();
  init() async {
    theloai = await repository.getTheLoai();
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
            DataColumn(label: Text('Mã Thể Loại')),
            DataColumn(label: Text('Thể Loại')),
          ],
          rows: [
            for (int i = 0; i < theloai.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(theloai[i].maTl),
                  ),
                  DataCell(
                    Text(theloai[i].tenTl),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
