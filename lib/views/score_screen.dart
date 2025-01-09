import 'package:flutter/material.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/repository/repository_student.dart';

class ScoreScreen extends StatefulWidget {
  const ScoreScreen({super.key});

  @override
  State<ScoreScreen> createState() => _ScoreScreenState();
}

class _ScoreScreenState extends State<ScoreScreen> {
  List<Score> scores = [];
  final repository = RepositoryStudent();
  bool isLoading = false;
  init() async {
    setState(() {
      isLoading = true;
    });
    scores = await repository.getScore();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    super.initState();
    init();
  }

  @override
  Widget build(BuildContext context) {
    return isLoading
        ? Center(
            child: CircularProgressIndicator(),
          )
        : Container(
            padding: EdgeInsets.all(15),
            child: SingleChildScrollView(
              scrollDirection: Axis.vertical,
              child: SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Mã sinh viên')),
                    DataColumn(label: Text('Mã môn học')),
                    DataColumn(label: Text('Điểm chuyên cần')),
                    DataColumn(label: Text('Hệ số 3')),
                    DataColumn(label: Text('Hệ số 6')),
                    DataColumn(label: Text('Tổng điểm')),
                    DataColumn(label: Text('Mã Giảng Viên')),
                    DataColumn(label: Text('Mã tín chỉ')),
                    DataColumn(label: Text('Mã thể loại')),
                    DataColumn(label: Text('Mã học kỳ')),
                    DataColumn(label: Text('Mã năm học')),
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
                          DataCell(
                            Text(scores[i].tongDiem.toString()),
                          ),
                          DataCell(
                            Text(scores[i].giangvien.maGv),
                          ),
                          DataCell(
                            Text(scores[i].tinchi.maTc),
                          ),
                          DataCell(
                            Text(scores[i].theloai.maTl),
                          ),
                          DataCell(
                            Text(scores[i].hocky.maHk),
                          ),
                          DataCell(
                            Text(scores[i].namhoc.maNh),
                          ),
                        ],
                      ),
                  ],
                ),
              ),
            ),
          );
  }
}
