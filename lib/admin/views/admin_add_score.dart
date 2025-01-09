import 'package:flutter/material.dart';
import 'package:qlhs/admin/widgets/admin_text_field.dart';
import 'package:qlhs/models/namhoc.dart';
import 'package:qlhs/models/score.dart';
import 'package:qlhs/models/score_teacher.dart';
import 'package:qlhs/models/semester.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/models/subject.dart';
import 'package:qlhs/models/teacher.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminAddScore extends StatefulWidget {
  const AdminAddScore({super.key, this.score});

  final ScoreTeacher? score;

  @override
  State<AdminAddScore> createState() => _AdminAddScoreState();
}

class _AdminAddScoreState extends State<AdminAddScore> {
  final RepositoryAdmin repo = RepositoryAdmin();
  late TextEditingController he1Controller;
  late TextEditingController he3Controller;
  late TextEditingController he6Controller;

  List<Teacher> teacher = [];
  List<Tinchi> tinchis = [];
  List<Theloai> theloai = [];
  List<Student> students = [];
  List<NamHoc> namhocs = [];
  List<Subject> subjects = [];
  List<HocKy> hockys = [];

  String? maGiangVien;
  String? maTinChi;
  String? maTheLoai;
  int? maSV;
  String? maNamHoc;
  String? maHocKy;
  String? maMonHoc;

  bool isLoading = false;

  initData() async {
    setState(() {
      isLoading = true;
    });
    teacher = await repo.getAllTeacher();
    tinchis = await repo.getTinChi();
    theloai = await repo.getTheLoai();
    students = await repo.getAllStudent();
    namhocs = await repo.getSchoolYear();
    subjects = await repo.getSubject();
    hockys = await repo.getHocKy();

    maGiangVien = widget.score?.giangvien.maGv;
    maTinChi = widget.score?.tinchi.maTc;
    maTheLoai = widget.score?.theloai.maTl;
    maSV = widget.score?.sinhvien['maSV'];
    maNamHoc = widget.score?.namhoc.maNh;
    maHocKy = widget.score?.hocky.maHk;
    maMonHoc = widget.score?.monhoc.maMh;

    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    initData();
    he1Controller = TextEditingController(text: widget.score?.heso1.toString());
    he3Controller = TextEditingController(text: widget.score?.heso3.toString());
    he6Controller = TextEditingController(text: widget.score?.heso6.toString());
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.score == null ? 'Thêm Điểm' : 'Cập nhật Điểm'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: isLoading
            ? Center(
                child: CircularProgressIndicator(),
              )
            : Form(
                key: formKey,
                child: SingleChildScrollView(
                  child: Column(
                    children: [
                      //Học Sinh
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.sinhvien['maSV'],
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Tên Sinh Viên',
                          ),
                          items: students
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maSv,
                                  child: Text(e.tenSv),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maSV = value;
                          },
                        ),
                      ),
                      //Giang Vien
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.giangvien.maGv,
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Giảng Viên',
                          ),
                          items: teacher
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maGv,
                                  child: Text(e.tenGv),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maGiangVien = value;
                          },
                        ),
                      ),

                      //Tin Chi
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.tinchi.maTc,
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Số Tín Chỉ',
                          ),
                          items: tinchis
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maTc,
                                  child: Text(e.soTc.toString()),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maTinChi = value;
                          },
                        ),
                      ),

                      //Thể Loại
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.theloai.maTl,
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Thể Loại',
                          ),
                          items: theloai
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maTl,
                                  child: Text(e.tenTl),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maTheLoai = value;
                          },
                        ),
                      ),

                      //Môn Học
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.monhoc.maMh,
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Môn Học',
                          ),
                          items: subjects
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maMh,
                                  child: Text(e.tenMh),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maMonHoc = value;
                          },
                        ),
                      ),

                      //Năm Học
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.namhoc.maNh,
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Năm Học',
                          ),
                          items: namhocs
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maNh,
                                  child: Text(e.tenNh),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maNamHoc = value;
                          },
                        ),
                      ),

                      //Năm Học
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.score?.hocky.maHk,
                          validator: (value) {
                            if (value == null) {
                              return "Vui lòng điền thông tin";
                            }
                            return null;
                          },
                          decoration: InputDecoration(
                            border: OutlineInputBorder(
                              borderRadius: BorderRadius.circular(16),
                            ),
                            labelText: 'Học Kỳ',
                          ),
                          items: hockys
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maHk,
                                  child: Text(e.tenHk),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maHocKy = value;
                          },
                        ),
                      ),

                      // Hệ 1

                      AdminTextField(
                          label: 'Hệ số 1', controller: he1Controller),
                      AdminTextField(
                          label: 'Hệ số 3', controller: he3Controller),
                      AdminTextField(
                          label: 'Hệ số 6', controller: he6Controller),

                      Row(
                        children: [
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(primaryColor),
                            ),
                            onPressed: () async {
                              if (formKey.currentState!.validate()) {
                                try {
                                  widget.score == null
                                      ? await repo.addScore(
                                          maMonHoc!,
                                          maHocKy!,
                                          maNamHoc!,
                                          maGiangVien!,
                                          maTinChi!,
                                          maTheLoai!,
                                          maSV!,
                                          double.parse(he1Controller.text),
                                          double.parse(he3Controller.text),
                                          double.parse(he6Controller.text),
                                        )
                                      : await repo.updateScore(
                                          widget.score!.maBd,
                                          maMonHoc!,
                                          maHocKy!,
                                          maNamHoc!,
                                          maGiangVien!,
                                          maTinChi!,
                                          maTheLoai!,
                                          maSV!,
                                          double.parse(he1Controller.text),
                                          double.parse(he3Controller.text),
                                          double.parse(he6Controller.text),
                                        );
                                  Navigator.pop(context, true);
                                } on Exception catch (e) {
                                  DialogService.showDialogFail(
                                    context,
                                    e.toString(),
                                  );
                                }
                              }
                            },
                            child: Text(
                                widget.score == null ? 'Thêm' : 'Cập nhật'),
                          ),
                          SizedBox(
                            width: 10,
                          ),
                          ElevatedButton(
                            style: ButtonStyle(
                              backgroundColor:
                                  WidgetStatePropertyAll(Colors.red),
                            ),
                            onPressed: () {},
                            child: Text('Hủy'),
                          ),
                        ],
                      )
                    ],
                  ),
                ),
              ),
      ),
    );
  }
}
