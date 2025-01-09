import 'package:flutter/material.dart';
import 'package:qlhs/admin/views/admin_add_score.dart';
import 'package:qlhs/models/score_teacher.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminScoreScreen extends StatefulWidget {
  const AdminScoreScreen({super.key});

  @override
  State<AdminScoreScreen> createState() => _AdminScoreScreenState();
}

class _AdminScoreScreenState extends State<AdminScoreScreen> {
  List<ScoreTeacher> scores = [];
  final repository = RepositoryAdmin();
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
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            ElevatedButton(
              onPressed: () async {
                final res = await Navigator.push(
                  context,
                  MaterialPageRoute(
                    builder: (context) => AdminAddScore(),
                  ),
                );

                if (res == true) {
                  DialogService.showDialogSuccess(
                    context,
                    "Thêm Thời Bản Điểm thành công",
                  );
                  if (res == true) {
                    init();
                  }
                }
              },
              child: Text("Thêm"),
            ),
            SingleChildScrollView(
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
                  DataColumn(label: Text('Chức Năng')),
                ],
                rows: [
                  for (int i = 0; i < scores.length; i++)
                    DataRow(
                      cells: [
                        DataCell(
                          Text(scores[i].sinhvien['maSV'].toString()),
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
                        DataCell(
                          Row(
                            children: [
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.yellow),
                                ),
                                onPressed: () async {
                                  final res = await Navigator.push(
                                    context,
                                    MaterialPageRoute(
                                      builder: (context) => AdminAddScore(
                                        score: scores[i],
                                      ),
                                    ),
                                  );
                                  if (res == true) {
                                    init();
                                    DialogService.showDialogSuccess(
                                      context,
                                      "Cập nhật Điểm thành công",
                                    );
                                  }
                                },
                                child: Text('Cập nhật'),
                              ),
                              ElevatedButton(
                                style: ButtonStyle(
                                  backgroundColor:
                                      WidgetStatePropertyAll(Colors.red),
                                ),
                                onPressed: () async {
                                  try {
                                    await repository
                                        .deleteScore(scores[i].maBd);
                                    DialogService.showDialogSuccess(
                                      context,
                                      "Xóa Thời Điểm thành công",
                                    );

                                    init();
                                  } catch (e) {
                                    DialogService.showDialogFail(
                                      context,
                                      e.toString(),
                                    );
                                  }
                                },
                                child: Text('Xóa'),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                ],
              ),
            ),
          ],
        ),
      ),
    );
  }
}
