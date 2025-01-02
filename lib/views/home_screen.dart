import 'package:flutter/material.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/utils/storage.dart';
import 'package:qlhs/views/category_screen.dart';
import 'package:qlhs/views/class_screen.dart';
import 'package:qlhs/views/department_screen.dart';
import 'package:qlhs/views/login_screen.dart';
import 'package:qlhs/views/nien_khoa_screen.dart';
import 'package:qlhs/views/period_screen.dart';
import 'package:qlhs/views/profile_screen.dart';
import 'package:qlhs/views/school_year_screen.dart';
import 'package:qlhs/views/score_screen.dart';
import 'package:qlhs/views/semester_screen.dart';
import 'package:qlhs/views/subject_screen.dart';

class HomeScreen extends StatefulWidget {
  const HomeScreen({super.key});

  @override
  State<HomeScreen> createState() => _HomeScreenState();
}

class _HomeScreenState extends State<HomeScreen> {
  int _selectedIndex = 0;
  int _inforOption = -1;
  int _subjectOption = -1;
  int _khoaOption = -1;
  String title = 'Trang Chủ';
  List<Widget> contents = [
    ProfileScreen(),
    ScoreScreen(),
    SemesterScreen(),
    SchoolYearScreen(),
    NienKhoaScreen(),
    SubjectScreen(),
    CategoryScreen(),
    PeriodScreen(),
    DepartmentScreen(),
    ClassScreen(),
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
                      Text(
                        '   Ngoc My',
                        style: TextStyle(
                          fontWeight: FontWeight.bold,
                          color: Colors.white,
                        ),
                      )
                    ],
                  )
                ],
              ),
            ),
            ListTile(
              leading: const Icon(Icons.account_circle),
              title: const Text('Profile'),
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
              leading: const Icon(Icons.table_chart_rounded),
              title: const Text('Xem Điểm'),
              onTap: () {
                setState(() {
                  _selectedIndex = 1;
                  _khoaOption = -1;
                  _inforOption = -1;
                  _subjectOption = -1;
                  title = 'Bảng Điểm';
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
            value: 2,
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
            value: 3,
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
            value: 4,
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
            value: 5,
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
            value: 6,
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
            value: 7,
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
            value: 8,
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
            value: 9,
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
