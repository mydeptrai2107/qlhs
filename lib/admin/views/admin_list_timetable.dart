import 'package:flutter/material.dart';
import 'package:qlhs/admin/views/admin_add_timetable.dart';
import 'package:qlhs/models/time_table.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminListTimeTable extends StatefulWidget {
  const AdminListTimeTable({super.key});

  @override
  State<AdminListTimeTable> createState() => _AdminListTimeTableState();
}

class _AdminListTimeTableState extends State<AdminListTimeTable> {
  final repositoryAdmin = RepositoryAdmin();
  List<TimeTable> timeTables = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    timeTables = await repositoryAdmin.getTimeTable();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thời khóa biểu'),
      ),
      body: Container(
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
                      builder: (context) => AdminAddTimeTable(),
                    ),
                  );

                  if (res == true) {
                    DialogService.showDialogSuccess(
                      context,
                      "Thêm Thời Khóa Biểu thành công",
                    );
                    if (res == true) {
                      initData();
                    }
                  }
                },
                child: Text("Thêm"),
              ),
              SingleChildScrollView(
                scrollDirection: Axis.horizontal,
                child: DataTable(
                  columns: [
                    DataColumn(label: Text('Mã Thời Khóa Biểu')),
                    DataColumn(label: Text('Mã Lớp')),
                    DataColumn(label: Text('Mã Môn Học')),
                    DataColumn(label: Text('Mã Giảng Viên')),
                    DataColumn(label: Text('Ngày Học')),
                    DataColumn(label: Text('Giờ Bắt Đầu')),
                    DataColumn(label: Text('Giờ Kết Thúc')),
                    DataColumn(label: Text('Phòng Học')),
                    DataColumn(label: Text('Chức Năng')),
                  ],
                  rows: [
                    for (int i = 0; i < timeTables.length; i++)
                      DataRow(
                        cells: [
                          DataCell(
                            Text(timeTables[i].maTkb.toString()),
                          ),
                          DataCell(
                            Text(timeTables[i].maLop.toString()),
                          ),
                          DataCell(
                            Text(timeTables[i].maMh),
                          ),
                          DataCell(
                            Text(timeTables[i].maGv.toString()),
                          ),
                          DataCell(
                            Text(timeTables[i].ngayHoc),
                          ),
                          DataCell(
                            Text(timeTables[i].gioBatDau),
                          ),
                          DataCell(
                            Text(timeTables[i].gioKetThuc),
                          ),
                          DataCell(
                            Text(timeTables[i].phongHoc),
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
                                        builder: (context) => AdminAddTimeTable(
                                          timeTable: timeTables[i],
                                        ),
                                      ),
                                    );
                                    if (res == true) {
                                      DialogService.showDialogSuccess(
                                        context,
                                        "Cập nhật Thời Khóa Biểu thành công",
                                      );
                                      if (res == true) {
                                        initData();
                                      }
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
                                      await repositoryAdmin
                                          .deleteTimeTable(timeTables[i].maTkb);
                                      DialogService.showDialogSuccess(
                                        context,
                                        "Xóa Thời Khóa Biểu thành công",
                                      );

                                      initData();
                                    } catch (e) {}
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
      ),
    );
  }
}
