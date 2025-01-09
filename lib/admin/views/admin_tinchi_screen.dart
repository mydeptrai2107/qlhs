import 'package:flutter/material.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/repository/repository_admin.dart';

class AdminTinChiScreen extends StatefulWidget {
  const AdminTinChiScreen({super.key});

  @override
  State<AdminTinChiScreen> createState() => _AdminTinChiScreenState();
}

class _AdminTinChiScreenState extends State<AdminTinChiScreen> {
  List<Tinchi> periods = [];
  final repository = RepositoryAdmin();
  init() async {
    periods = await repository.getTinChi();
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
            DataColumn(label: Text('Mã Tiết Học')),
            DataColumn(label: Text('Số Tiết Học')),
          ],
          rows: [
            for (int i = 0; i < periods.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(periods[i].maTc),
                  ),
                  DataCell(
                    Text(periods[i].soTc.toString()),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
