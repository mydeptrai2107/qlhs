import 'package:flutter/material.dart';
import 'package:qlhs/admin/views/admin_category_screen.dart';
import 'package:qlhs/admin/views/admin_class_screen.dart';
import 'package:qlhs/admin/views/admin_department_screen.dart';
import 'package:qlhs/admin/views/admin_hocky_screen.dart';
import 'package:qlhs/admin/views/admin_list_student.dart';
import 'package:qlhs/admin/views/admin_list_teacher.dart';
import 'package:qlhs/admin/views/admin_list_timetable.dart';
import 'package:qlhs/admin/views/admin_nien_khoa_screen.dart';
import 'package:qlhs/admin/views/admin_score_screen.dart';
import 'package:qlhs/admin/views/admin_subject_screen.dart';
import 'package:qlhs/admin/views/admin_tinchi_screen.dart';
import 'package:qlhs/admin/views/school_year_screen.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/utils/storage.dart';
import 'package:qlhs/views/login_screen.dart';

class AdminHomeScreen extends StatefulWidget {
  const AdminHomeScreen({
    super.key,
  });

  @override
  State<AdminHomeScreen> createState() => _AdminHomeScreenState();
}

class _AdminHomeScreenState extends State<AdminHomeScreen> {
  int _selectedIndex = 0;
  int _inforOption = -1;
  int _subjectOption = -1;
  int _khoaOption = -1;
  String title = 'Trang Chủ';
  List<Widget> contents = [
    AdminListStudent(),
    AdminListTeacher(),
    AdminScoreScreen(),
    AdminListTimeTable(),
    AdminHocKyScreen(),
    AdminSchoolYearScreen(),
    AdminNienKhoaScreen(),
    AdminSubjectScreen(),
    AdminCategoryScreen(),
    AdminTinChiScreen(),
    AdminDepartmentScreen(),
    AdminClassScreen(),
  ];

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: Text(title),
      ),
      body: contents[_selectedIndex],
      drawer: Drawer(
        child: ListView(
          children: [
            DrawerHeader(
              decoration: BoxDecoration(
                color: Colors.blue,
              ),
              child: Column(
                mainAxisSize: MainAxisSize.min,
                children: [
                  Text(
                    'Trang học sinh',
                    style: TextStyle(
                      color: Colors.white,
                      fontSize: 24,
                    ),
                  ),
                  Row(
                    mainAxisAlignment: MainAxisAlignment.start,
                    children: [
                      Container(
                        width: 50,
                        height: 50,
                        decoration: BoxDecoration(
                          shape: BoxShape.circle,
                          image: DecorationImage(
                            image: AssetImage(
                              'assets/avatar.jpg',
                            ),
                            fit: BoxFit.fill,
                          ),
                        ),
                      ),
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.grid_on_rounded),
              title: const Text('Danh sách học sinh'),
              onTap: () {
                setState(() {
                  _selectedIndex = 0;
                  _khoaOption = -1;
                  _inforOption = -1;
                  _subjectOption = -1;
                  title = 'Profile';
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.grid_on_rounded),
              title: const Text('Danh sách giảng viên'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                  _khoaOption = -1;
                  _inforOption = -1;
                  _subjectOption = -1;
                  title = 'Profile';
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart_rounded),
              title: const Text('Xem Điểm'),
              onTap: () {
                setState(() {
                  _selectedIndex = 2;
                  _khoaOption = -1;
                  _inforOption = -1;
                  _subjectOption = -1;
                  title = 'Bảng Điểm';
                  Navigator.pop(context);
                });
              },
            ),
            ListTile(
              leading: const Icon(Icons.table_chart_rounded),
              title: const Text('Thời Khóa Biểu'),
              onTap: () {
                setState(() {
                  _selectedIndex = 3;
                  _khoaOption = -1;
                  _inforOption = -1;
                  _subjectOption = -1;
                  title = 'Thời Khóa Biểu';
                  Navigator.pop(context);
                });
              },
            ),
            getInfor(),
            getSubject(),
            getDepartment(),
            ListTile(
              onTap: () async {
                Storage.remove(kToken);
                Navigator.pushReplacement(
                  context,
                  MaterialPageRoute(
                    builder: (context) => LoginScreen(),
                  ),
                );
              },
              leading: const Icon(
                Icons.logout,
                color: Colors.red,
              ),
              title: const Text(
                'Đăng Xuất',
                style: TextStyle(
                  color: Colors.red,
                ),
              ),
            )
          ],
        ),
      ),
    );
  }

  getInfor() {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.edit_document),
        title: const Text('Thông tin chung'),
        children: [
          RadioListTile<int>(
            title: Text('Học Kỳ'),
            value: 4,
            groupValue: _inforOption,
            onChanged: (value) {
              setState(() {
                _inforOption = value!;
                _selectedIndex = _inforOption;
                _khoaOption = -1;
                _subjectOption = -1;
                title = 'Học Kỳ';
                Navigator.pop(context);
              });
            },
          ),
          RadioListTile<int>(
            title: Text('Năm Học'),
            value: 5,
            groupValue: _inforOption,
            onChanged: (value) {
              setState(() {
                _inforOption = value!;
                _selectedIndex = _inforOption;
                _khoaOption = -1;
                _subjectOption = -1;
                title = 'Năm Học';
                Navigator.pop(context);
              });
            },
          ),
          RadioListTile<int>(
            title: Text('Niên Khóa'),
            value: 6,
            groupValue: _inforOption,
            onChanged: (value) {
              setState(() {
                _inforOption = value!;
                _selectedIndex = _inforOption;
                _khoaOption = -1;
                _subjectOption = -1;
                title = 'Niên Khóa';
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  getSubject() {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.subject),
        title: const Text('Thông Tin Môn Học'),
        children: [
          RadioListTile<int>(
            title: Text('Môn Học'),
            value: 7,
            groupValue: _subjectOption,
            onChanged: (value) {
              setState(() {
                _subjectOption = value!;
                _selectedIndex = _subjectOption;
                _inforOption = -1;
                _khoaOption = -1;
                title = 'Môn Học';
                Navigator.pop(context);
              });
            },
          ),
          RadioListTile<int>(
            title: Text('Thể Loại'),
            value: 8,
            groupValue: _subjectOption,
            onChanged: (value) {
              setState(() {
                _subjectOption = value!;
                _selectedIndex = _subjectOption;
                _inforOption = -1;
                _khoaOption = -1;
                title = 'Thể Loại';
                Navigator.pop(context);
              });
            },
          ),
          RadioListTile<int>(
            title: Text('Tiết'),
            value: 9,
            groupValue: _subjectOption,
            onChanged: (value) {
              setState(() {
                _subjectOption = value!;
                _selectedIndex = _subjectOption;
                _inforOption = -1;
                _khoaOption = -1;
                title = 'Tiết Học';
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }

  getDepartment() {
    return Theme(
      data: ThemeData(dividerColor: Colors.transparent),
      child: ExpansionTile(
        leading: const Icon(Icons.track_changes),
        title: const Text('Khoa'),
        children: [
          RadioListTile<int>(
            title: Text('Khoa'),
            value: 10,
            groupValue: _khoaOption,
            onChanged: (value) {
              setState(() {
                _khoaOption = value!;
                _selectedIndex = _khoaOption;
                _subjectOption = -1;
                _inforOption = -1;
                title = 'Khoa';
                Navigator.pop(context);
              });
            },
          ),
          RadioListTile<int>(
            title: Text('Lớp'),
            value: 11,
            groupValue: _khoaOption,
            onChanged: (value) {
              setState(() {
                _khoaOption = value!;
                _selectedIndex = _khoaOption;
                _subjectOption = -1;
                _inforOption = -1;
                title = 'Lớp';
                Navigator.pop(context);
              });
            },
          ),
        ],
      ),
    );
  }
}
