import 'package:flutter/material.dart';
import 'package:qlhs/repository/repository.dart';

class SchoolYearScreen extends StatefulWidget {
  const SchoolYearScreen({super.key});

  @override
  State<SchoolYearScreen> createState() => _SchoolYearScreenState();
}

class _SchoolYearScreenState extends State<SchoolYearScreen> {
  List<Map<String, dynamic>> schoolYears = [];
  final repository = Repository();
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
                    Text(schoolYears[i]['maNH']),
                  ),
                  DataCell(
                    Text(schoolYears[i]['tenNH']),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
