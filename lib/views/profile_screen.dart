import 'package:flutter/material.dart';
import 'package:qlhs/models/student.dart';
import 'package:qlhs/repository/repository_student.dart';
import 'package:qlhs/widgets/dialog_service.dart';

class ProfileScreen extends StatefulWidget {
  const ProfileScreen({super.key});

  @override
  State<ProfileScreen> createState() => _ProfileScreenState();
}

class _ProfileScreenState extends State<ProfileScreen> {
  final repository = RepositoryStudent();
  late Student student;

  final nameController = TextEditingController();
  final addressController = TextEditingController();
  final phoneNumberController = TextEditingController();
  final emailController = TextEditingController();

  String statusUpdaye = '';
  bool isLoading = false;

  initData() async {
    student = await repository.profile();
    nameController.text = student.tenSv;
    phoneNumberController.text = student.sdt.toString();
    addressController.text = student.diaChi;
    emailController.text = student.email;
  }

  @override
  void initState() {
    super.initState();
    initData();
  }

  @override
  Widget build(BuildContext context) {
    return Padding(
      padding: const EdgeInsets.all(15),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        mainAxisSize: MainAxisSize.min,
        children: [
          Text(
            'Cập nhật thông tin sinh viên',
            style: TextStyle(
              fontSize: 18,
              fontWeight: FontWeight.bold,
            ),
          ),
          Text(
            'Tên sinh viên',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: nameController,
            decoration: InputDecoration(
              hintText: 'Tên sinh viên',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),

          //Address
          Text(
            'Địa chỉ',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: addressController,
            decoration: InputDecoration(
              hintText: 'Địa chỉ',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          //Phone Number
          Text(
            'Số điện thoại',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: phoneNumberController,
            decoration: InputDecoration(
              hintText: 'Số điện thoại',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          //Email
          Text(
            'Email',
            style: TextStyle(
              fontSize: 14,
              fontWeight: FontWeight.bold,
            ),
          ),
          TextFormField(
            controller: emailController,
            decoration: InputDecoration(
              hintText: 'Email',
              border: OutlineInputBorder(
                borderRadius: BorderRadius.circular(8),
              ),
            ),
          ),
          SizedBox(height: 10),
          Center(
            child: Text(
              statusUpdaye,
              style: TextStyle(
                  fontSize: 18,
                  fontWeight: FontWeight.bold,
                  color: Colors.green),
            ),
          ),
          SizedBox(height: 10),
          Row(
            children: [
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ),
                  onPressed: () async {
                    try {
                      DialogService.showLoading(context);
                      await repository.updateProfile(
                        nameController.text,
                        addressController.text,
                        phoneNumberController.text,
                        emailController.text,
                      );
                      Navigator.pop(context);
                      setState(() {
                        statusUpdaye = 'Cập nhật thành công!';
                      });
                    } catch (e) {
                      statusUpdaye = e.toString();
                    }
                  },
                  child: Text(
                    'Cập Nhật',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                width: 20,
              ),
              Expanded(
                flex: 1,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 15),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.grey),
                  ),
                  onPressed: () {},
                  child: Text(
                    'Hủy',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
            ],
          )
        ],
      ),
    );
  }
}
