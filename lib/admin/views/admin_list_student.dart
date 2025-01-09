import 'package:flutter/material.dart';
import 'package:qlhs/admin/views/admin_add_student.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminListStudent extends StatefulWidget {
  const AdminListStudent({super.key});

  @override
  State<AdminListStudent> createState() => _AdminListStudentState();
}

class _AdminListStudentState extends State<AdminListStudent> {
  final repositoryAdmin = RepositoryAdmin();
  List<Student> students = [];

  @override
  void initState() {
    initData();
    super.initState();
  }

  initData() async {
    students = await repositoryAdmin.getAllStudent();
    setState(() {});
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text('Danh sách học sinh'),
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
                      builder: (context) => AdminAddStudent(),
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
                    DataColumn(label: Text('Mã Học Sinh')),
                    DataColumn(label: Text('Tên Học Sinh')),
                    DataColumn(label: Text('Địa Chỉ')),
                    DataColumn(label: Text('Số Điện Thoại')),
                    DataColumn(label: Text('Lớp')),
                    DataColumn(label: Text('Chức Năng')),
                  ],
                  rows: [
                    for (int i = 0; i < students.length; i++)
                      DataRow(
                        cells: [
                          DataCell(
                            Text(students[i].maSv.toString()),
                          ),
                          DataCell(
                            Text(students[i].tenSv),
                          ),
                          DataCell(
                            Text(students[i].diaChi),
                          ),
                          DataCell(
                            Text(students[i].sdt.toString()),
                          ),
                          DataCell(
                            Text(students[i].lop.tenLop),
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
                                        builder: (context) => AdminAddStudent(
                                          student: students[i],
                                        ),
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
                                          .deleteStudent(students[i].maSv);
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
      ),
    );
  }
}
