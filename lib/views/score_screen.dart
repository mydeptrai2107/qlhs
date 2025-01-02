import 'package:flutter/material.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/repository/repository.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List<Score> scores = [];
  final repository = Repository();
  init() async {
    scores = await repository.getScore();
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
            DataColumn(label: Text('Mã sinh viên')),
            DataColumn(label: Text('Mã môn học')),
            DataColumn(label: Text('Điểm chuyên cần')),
            DataColumn(label: Text('Hệ số 3')),
            DataColumn(label: Text('Hệ số 6')),
          ],
          rows: [
            for (int i = 0; i < scores.length; i++)
              DataRow(
                cells: [
                  DataCell(
                    Text(scores[i].sinhvien.maSv.toString()),
                  ),
                  DataCell(
                    Text(scores[i].monhoc.maMh),
                  ),
                  DataCell(
                    Text(scores[i].heso1.toString()),
                  ),
                  DataCell(
                    Text(scores[i].heso3.toString()),
                  ),
                  DataCell(
                    Text(scores[i].heso6.toString()),
                  ),
                ],
              ),
          ],
        ),
      ),
    );
  }
}
