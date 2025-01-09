import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:qlhs/repository/repository_student.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/views/login_screen.dart';
import 'package:qlhs/widgets/text_field_app.dart';

class RegisterScreen extends StatefulWidget {
  const RegisterScreen({
    super.key,
  });

  @override
  State<RegisterScreen> createState() => _RegisterScreenState();
}

class _RegisterScreenState extends State<RegisterScreen> {
  final emailController = TextEditingController();
  final passController = TextEditingController();
  final nameController = TextEditingController();
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
                'Đăng Ký Tài Khoản',
                style: TextStyle(
                  fontWeight: FontWeight.w900,
                  fontSize: 20,
                ),
              ),
              Image.asset(
                'assets/img-01.png',
                width: size.width / 2,
                height: size.width / 2,
              ),
              SizedBox(height: 30),
              TextFieldApp(
                controller: nameController,
                hintText: 'Name',
                prefixIcon: Icon(Icons.person),
              ),
              SizedBox(height: 10),
              TextFieldApp(
                controller: emailController,
                hintText: 'Email',
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
                    await repository.register(
                      context,
                      nameController.text,
                      passController.text,
                      emailController.text,
                    );
                  },
                  child: Text(
                    'ĐĂNG Ký',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              ),
              SizedBox(
                height: 10,
              ),
              RichText(
                text: TextSpan(
                  text: 'Đã có tài khoản? ',
                  style: TextStyle(
                    color: Colors.grey,
                  ),
                  children: [
                    TextSpan(
                      text: 'Đăng nhập ngay',
                      recognizer: TapGestureRecognizer()
                        ..onTap = () {
                          Navigator.push(
                            context,
                            MaterialPageRoute(
                              builder: (context) => LoginScreen(),
                            ),
                          );
                        },
                      style: TextStyle(
                        color: primaryColor,
                        fontWeight: FontWeight.bold,
                      ),
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
