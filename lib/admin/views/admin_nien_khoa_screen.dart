import 'package:flutter/material.dart';
import 'package:qlhs/repository/repository_admin.dart';

class AdminNienKhoaScreen extends StatefulWidget {
  const AdminNienKhoaScreen({super.key});

  @override
  State<AdminNienKhoaScreen> createState() => _AdminNienKhoaScreenState();
}

class _AdminNienKhoaScreenState extends State<AdminNienKhoaScreen> {
  List<Map<String, dynamic>> nienKhoa = [];
  final repository = RepositoryAdmin();
  init() async {
    nienKhoa = await repository.getNienKhoa();
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
            DataColumn(label: Text('Mã Niên Khóa')),
            DataColumn(label: Text('Tên Niên Khóa')),
          ],
          rows: [
            for (int i = 0; i < nienKhoa.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(nienKhoa[i]['maNK']),
                  ),
                  DataCell(
                    Text(nienKhoa[i]['tenNK']),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
