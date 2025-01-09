import 'package:flutter/material.dart';
import 'package:qlhs/admin/views/admin_add_teacher.dart';
import 'package:qlhs/models/teacher.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminListTeacher extends StatefulWidget {
  const AdminListTeacher({super.key});

  @override
  State<AdminListTeacher> createState() => _AdminListTeacherState();
}

class _AdminListTeacherState extends State<AdminListTeacher> {
  final repositoryAdmin = RepositoryAdmin();
  List<Teacher> teachers = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    teachers = await repositoryAdmin.getAllTeacher();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: Text('Danh sách giảng viên'),
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
                        builder: (context) => AdminAddTeacher(),
                      ),
                    );

                    if (res == true) {
                      DialogService.showDialogSuccess(
                        context,
                        "Thêm Giảng Viên thành công",
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
                      DataColumn(label: Text('Mã Giảng Viên')),
                      DataColumn(label: Text('Tên Giảng Viên')),
                      DataColumn(label: Text('Địa Chỉ')),
                      DataColumn(label: Text('Số Điện Thoại')),
                      DataColumn(label: Text('Chức Năng')),
                    ],
                    rows: [
                      for (int i = 0; i < teachers.length; i++)
                        DataRow(
                          cells: [
                            DataCell(
                              Text(teachers[i].maGv),
                            ),
                            DataCell(
                              Text(teachers[i].tenGv),
                            ),
                            DataCell(
                              Text(teachers[i].diaChi),
                            ),
                            DataCell(
                              Text(teachers[i].sdt.toString()),
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
                                          builder: (context) => AdminAddTeacher(
                                              teacher: teachers[i]),
                                        ),
                                      );
                                      if (res == true) {
                                        DialogService.showDialogSuccess(
                                          context,
                                          "Cập nhật Giảng Viên thành công",
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
                                            .deleteGiangVien(teachers[i].maGv);
                                        DialogService.showDialogSuccess(
                                          context,
                                          "Xóa Giảng Viên thành công",
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
        ));
  }
}
