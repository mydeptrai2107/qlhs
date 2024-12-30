import 'package:flutter/material.dart';
import 'package:qlhs/utils/constant.dart';
import 'package:qlhs/widgets/text_field_app.dart';

class LoginScreen extends StatefulWidget {
  const LoginScreen({
    super.key,
  });

  @override
  State<LoginScreen> createState() => _LoginScreenState();
}

class _LoginScreenState extends State<LoginScreen> {
  @override
  Widget build(BuildContext context) {
    final size = MediaQuery.sizeOf(context);
    return Scaffold(
      body: Container(
        height: size.height,
        width: size.width,
        padding: EdgeInsets.symmetric(vertical: 50, horizontal: 20),
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
                'Quản Trị Viên',
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
                hintText: 'Email',
                prefixIcon: Icon(Icons.email),
              ),
              SizedBox(height: 10),
              TextFieldApp(
                hintText: 'Password',
                prefixIcon: Icon(Icons.password),
              ),
              SizedBox(height: 30),
              SizedBox(
                width: size.width,
                child: ElevatedButton(
                  style: ButtonStyle(
                    padding: WidgetStatePropertyAll(
                        EdgeInsets.symmetric(vertical: 18)),
                    backgroundColor: WidgetStatePropertyAll(Colors.green),
                  ),
                  onPressed: () {},
                  child: Text(
                    'ĐĂNG NHẬP',
                    style: TextStyle(color: Colors.white),
                  ),
                ),
              )
            ],
          ),
        ),
      ),
    );
  }
}
