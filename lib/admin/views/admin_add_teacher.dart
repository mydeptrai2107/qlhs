import 'package:flutter/material.dart';
import 'package:qlhs/admin/widgets/admin_text_field.dart';
import 'package:qlhs/models/teacher.dart';
import 'package:qlhs/repository/repository_admin.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class AdminAddTeacher extends StatefulWidget {
  const AdminAddTeacher({super.key, this.teacher});

  final Teacher? teacher;

  @override
  State<AdminAddTeacher> createState() => _AdminAddTeacherState();
}

class _AdminAddTeacherState extends State<AdminAddTeacher> {
  final RepositoryAdmin repo = RepositoryAdmin();
  late TextEditingController nameController;
  late TextEditingController addressController;
  late TextEditingController phoneController;
  late TextEditingController emailController;

  @override
  void initState() {
    nameController = TextEditingController(text: widget.teacher?.tenGv);
    addressController = TextEditingController(text: widget.teacher?.diaChi);
    phoneController =
        TextEditingController(text: widget.teacher?.sdt.toString());
    emailController = TextEditingController(text: widget.teacher?.email);
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final formKey = GlobalKey<FormState>();
    return Scaffold(
      appBar: AppBar(
        title: Text(widget.teacher == null
            ? 'Thêm Giảng Viên'
            : 'Cập nhật thông tin Giảng Viên'),
      ),
      body: Padding(
        padding: EdgeInsets.all(15),
        child: Form(
          key: formKey,
          child: Column(
            children: [
              AdminTextField(
                label: 'Tên Giảng Viên',
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
              Row(
                children: [
                  ElevatedButton(
                    style: ButtonStyle(
                      backgroundColor: WidgetStatePropertyAll(primaryColor),
                    ),
                    onPressed: () async {
                      if (formKey.currentState!.validate()) {
                        try {
                          widget.teacher == null
                              ? await repo.addGiangVien(
                                  nameController.text,
                                  addressController.text,
                                  phoneController.text,
                                  emailController.text,
                                )
                              : await repo.updateGiangVien(
                                  widget.teacher!.maGv,
                                  nameController.text,
                                  addressController.text,
                                  phoneController.text,
                                  emailController.text,
                                );
                          Navigator.pop(context, true);
                        } on Exception catch (e) {
                          DialogService.showDialogFail(context, e.toString());
                        }
                      }
                    },
                    child: Text(widget.teacher == null ? 'Thêm' : 'Cập nhật'),
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
