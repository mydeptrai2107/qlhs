import 'package:flutter/material.dart';
import 'package:qlhs/admin/widgets/admin_text_field.dart';
import 'package:qlhs/models/class.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminAddStudent extends StatefulWidget {
  const AdminAddStudent({super.key, this.student});

  final Student? student;

  @override
  State<AdminAddStudent> createState() => _AdminAddStudentState();
}

class _AdminAddStudentState extends State<AdminAddStudent> {
  final RepositoryAdmin repo = RepositoryAdmin();
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;
  int? malop;

  List<Lop> lops = [];

  initData() async {
    lops = await repo.getClass();
    setState(() {});
  }

  @override
  void initState() {
    initData();
    nameController = TextEditingController(text: widget.student?.tenSv);
    addressController = TextEditingController(text: widget.student?.diaChi);
    phoneController =
        TextEditingController(text: widget.student?.sdt.toString());
    emailController = TextEditingController(text: widget.student?.email);
    malop = widget.student?.lop.maLop;
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.student == null
            ? 'Thêm Học Sinh'
            : 'Cập nhật thông tin Học Sinh'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AdminTextField(
                label: 'Tên Học Sinh',
                controller: nameController,
              ),
              AdminTextField(
                label: 'Địa chỉ',
                controller: addressController,
              ),
              AdminTextField(
                label: 'Số điện thoại',
                controller: phoneController,
              ),
              AdminTextField(
                label: 'Email',
                controller: emailController,
              ),
              Padding(
                padding: const EdgeInsets.symmetric(vertical: 10),
                child: DropdownButtonFormField(
                  value: widget.student?.lop.maLop,
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
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          widget.student == null
                              ? await repo.addStudent(
                                  nameController.text,
                                  addressController.text,
                                  phoneController.text,
                                  emailController.text,
                                  malop!,
                                )
                              : await repo.updateStudent(
                                  widget.student!.maSv,
                                  nameController.text,
                                  addressController.text,
                                  phoneController.text,
                                  emailController.text,
                                  malop!,
                                );
                          Navigator.pop(context, true);
                        } on Exception catch (e) {
                          DialogService.showDialogFail(context, e.toString());
                        }
                      }
                    },
                    child: Text(widget.student == null ? 'Thêm' : 'Cập nhật'),
                  ),
                  SizedBox(
                    width: 10,
                  ),
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(Colors.red),
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
    );
  }
}
