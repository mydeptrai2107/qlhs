import 'package:flutter/material.dart';
import 'package:qlhs/models/time_table.dart';
import 'package:qlhs/repository/repository_student.dart';

class ListTimeTable extends StatefulWidget {
  const ListTimeTable({super.key});

  @override
  State<ListTimeTable> createState() => _ListTimeTableState();
}

class _ListTimeTableState extends State<ListTimeTable> {
  final repository = RepositoryStudent();
  List<TimeTable> timeTables = [];

  bool isLoading = false;

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    setState(() {
      isLoading = true;
    });
    timeTables = await repository.getTimeTable();
    setState(() {
      isLoading = false;
    });
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Thời khóa biểu'),
      ),
      body: isLoading
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
                      DataColumn(label: Text('Mã Thời Khóa Biểu')),
                      DataColumn(label: Text('Mã Lớp')),
                      DataColumn(label: Text('Mã Môn Học')),
                      DataColumn(label: Text('Mã Giảng Viên')),
                      DataColumn(label: Text('Ngày Học')),
                      DataColumn(label: Text('Giờ Bắt Đầu')),
                      DataColumn(label: Text('Giờ Kết Thúc')),
                      DataColumn(label: Text('Phòng Học')),
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
                          ],
                        ),
                    ],
                  ),
                ),
              ),
            ),
    );
  }
}
