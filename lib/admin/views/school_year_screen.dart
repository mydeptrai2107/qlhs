import 'package:flutter/material.dart';
import 'package:qlhs/models/namhoc.dart';
import 'package:qlhs/repository/repository_admin.dart';

class AdminSchoolYearScreen extends StatefulWidget {
  const AdminSchoolYearScreen({super.key});

  @override
  State<AdminSchoolYearScreen> createState() => _AdminSchoolYearScreenState();
}

class _AdminSchoolYearScreenState extends State<AdminSchoolYearScreen> {
  List<NamHoc> schoolYears = [];
  final repository = RepositoryAdmin();
  init() async {
    schoolYears = await repository.getSchoolYear();
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
            DataColumn(label: Text('Mã Năm Học')),
            DataColumn(label: Text('Tên Năm Học')),
          ],
          rows: [
            for (int i = 0; i < schoolYears.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(schoolYears[i].maNh),
                  ),
                  DataCell(
                    Text(schoolYears[i].tenNh),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
