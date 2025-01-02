import 'package:flutter/material.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/repository/repository.dart';

class PeriodScreen extends StatefulWidget {
  const PeriodScreen({super.key});

  @override
  State<PeriodScreen> createState() => _PeriodScreenState();
}

class _PeriodScreenState extends State<PeriodScreen> {
  List<Tinchi> periods = [];
  final repository = Repository();
  init() async {
    periods = await repository.getPeriod();
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
