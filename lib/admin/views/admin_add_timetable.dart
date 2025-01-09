import 'package:flutter/material.dart';
import 'package:qlhs/admin/widgets/admin_text_field.dart';
import 'package:qlhs/models/class.dart';
import 'package:qlhs/models/subject.dart';
import 'package:qlhs/models/teacher.dart';
import 'package:qlhs/models/time_table.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminAddTimeTable extends StatefulWidget {
  const AdminAddTimeTable({super.key, this.timeTable});

  final TimeTable? timeTable;

  @override
  State<AdminAddTimeTable> createState() => _AdminAddTimeTableState();
}

class _AdminAddTimeTableState extends State<AdminAddTimeTable> {
  final RepositoryAdmin repo = RepositoryAdmin();
  late TextEditingController dayController;
  late TextEditingController startController;
  late TextEditingController endController;
  late TextEditingController roomController;
  int? malop;
  String? maMonHoc;
  String? maGV;
  DateTime? ngayHoc;
  TimeOfDay? startTime;
  TimeOfDay? endTime;

  List<Lop> lops = [];
  List<Subject> subjects = [];
  List<Teacher> teachers = [];

  bool isLoading = false;

  initData() async {
    setState(() {
      isLoading = true;
    });
    lops = await repo.getClass();
    subjects = await repo.getSubject();
    teachers = await repo.getAllTeacher();
    setState(() {
      isLoading = false;
    });
  }

  @override
  void initState() {
    initData();
    dayController = TextEditingController(text: widget.timeTable?.ngayHoc);
    startController = TextEditingController(text: widget.timeTable?.gioBatDau);
    endController =
        TextEditingController(text: widget.timeTable?.gioKetThuc.toString());
    roomController = TextEditingController(text: widget.timeTable?.phongHoc);
    malop = widget.timeTable?.maLop;
    maGV = widget.timeTable?.maGv;
    maMonHoc = widget.timeTable?.maMh;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.timeTable == null
            ? 'Thêm Học Sinh'
            : 'Cập nhật thông tin Học Sinh'),
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
                      AdminTextField(
                        controller: dayController,
                        label: 'Ngày Học',
                        readOnly: true,
                        onTap: () async {
                          ngayHoc = await showDatePicker(
                            context: context,
                            firstDate: DateTime.now(),
                            lastDate: DateTime(2030),
                          );
                          if (ngayHoc == null) return;
                          dayController.text =
                              '${ngayHoc?.year}-${ngayHoc?.month}-${ngayHoc?.day}';
                          setState(() {});
                        },
                      ),
                      AdminTextField(
                        controller: startController,
                        label: 'Giờ bắt đầu',
                        readOnly: true,
                        onTap: () async {
                          startTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (startTime == null) return;
                          startController.text =
                              '${startTime?.hour}:${startTime?.minute}';
                          setState(() {});
                        },
                      ),

                      AdminTextField(
                        controller: endController,
                        label: 'Giờ kết thức',
                        readOnly: true,
                        onTap: () async {
                          endTime = await showTimePicker(
                            context: context,
                            initialTime: TimeOfDay.now(),
                          );
                          if (endTime == null) return;
                          endController.text =
                              '${endTime?.hour}:${endTime?.minute}';
                          setState(() {});
                        },
                      ),
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
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
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
                          value: widget.timeTable?.maLop,
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
                            labelText: 'Lớp',
                          ),
                          items: lops
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maLop,
                                  child: Text(e.tenLop),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            malop = value;
                          },
                        ),
                      ),

                      //Giang Vien
                      Padding(
                        padding: const EdgeInsets.symmetric(vertical: 10),
                        child: DropdownButtonFormField(
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
                          items: teachers
                              .map(
                                (e) => DropdownMenuItem(
                                  value: e.maGv,
                                  child: Text(e.tenGv),
                                ),
                              )
                              .toList(),
                          onChanged: (value) {
                            maGV = value;
                          },
                        ),
                      ),

                      AdminTextField(
                        label: 'Phòng Học',
                        controller: roomController,
                      ),
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
                                  widget.timeTable == null
                                      ? await repo.addTimeTable(
                                          maLop: malop!,
                                          maGv: maGV!,
                                          maMH: maMonHoc!,
                                          day: dayController.text,
                                          end: endController.text,
                                          start: startController.text,
                                          room: roomController.text)
                                      : await repo.updateTimeTable(
                                          maTKB: widget.timeTable!.maTkb,
                                          maLop: malop!,
                                          maGv: maGV!,
                                          maMH: maMonHoc!,
                                          day: dayController.text,
                                          end: endController.text,
                                          start: startController.text,
                                          room: roomController.text,
                                        );
                                  Navigator.pop(context, true);
                                } on Exception catch (e) {
                                  DialogService.showDialogFail(
                                      context, e.toString());
                                }
                              }
                            },
                            child: Text(
                                widget.timeTable == null ? 'Thêm' : 'Cập nhật'),
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
