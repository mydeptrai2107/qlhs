// ignore_for_file: use_build_context_synchronously

import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qlhs/admin/views/admin_home_screen.dart';
import 'package:qlhs/repository/repository_student.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/views/home_screen.dart';
import 'package:qlhs/views/register_screen.dart';
import 'package:qlhs/widgets/dialog_service.dart';
import 'package:qlhs/widgets/text_field_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  final usernameController = TextEditingController(text: 'admin');
  final passController = TextEditingController(text: '123');
  final repository = RepositoryStudent();
  bool isLoading = false;
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: 100, horizontal: 20),
        decoration: BoxDecoration(
          color: primaryColor,
        ),
        child: Container(
          padding: EdgeInsets.all(16),
          decoration: BoxDecoration(
            borderRadius: BorderRadius.circular(16),
            color: Colors.white,
          ),
          child: Column(
            children: [
              Text(
                'Đăng Nhập',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 23,
                ),
              ),
              Image.asset(
                'assets/img-01.png',
                width: size.width / 2,
                height: size.width / 2,
              ),
              SizedBox(height: 30),
              TextFieldApp(
                controller: usernameController,
                hintText: 'UserName',
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 10),
              TextFieldApp(
                controller: passController,
                hintText: 'Password',
                prefixIcon: Icon(Icons.password),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                      EdgeInsets.symmetric(vertical: 18),
                    ),
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ),
                  onPressed: () async {
                    try {
                      DialogService.showLoading(context);
                      String role = await repository.login(
                          usernameController.text, passController.text);
                      Navigator.pop(context);
                      Navigator.pushReplacement(
                        context,
                        MaterialPageRoute(
                          builder: (context) => role == "1" ? AdminHomeScreen() : HomeScreen(
                            userName: usernameController.text,
                          ),
                        ),
                      );
                    } on FormatException catch (e) {
                      Navigator.pop(context);
                      DialogService.showDialogFail(context, e.message);
                    }
                  },
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Chưa có tài khoản? ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Đăng ký ngay',
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => RegisterScreen(),
                            ),
                          );
                        },
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
