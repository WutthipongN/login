import 'package:flutter/material.dart';
import 'package:login/widgets/logo_widget.dart';
import 'package:login/widgets/main_button.dart';

class ForgotPasswordPage extends StatelessWidget {
  const ForgotPasswordPage({super.key});

  @override
  Widget build(BuildContext context) {
    final TextEditingController emailController = TextEditingController();

    return Scaffold(
      backgroundColor: const Color(0xFF00A6A6),
      body: Column(
        children: [
          const SizedBox(height: 150),
          const LogoWidget(),
          const SizedBox(height: 12),
          const Text(
            "บริษัท เมจิกเทคโซลูชั่น จำกัด",
            style: TextStyle(
              color: Colors.white,
              fontSize: 16,
            ),
          ),
          const SizedBox(height: 40),
          Expanded(
            child: Container(
              width: double.infinity,
              padding: const EdgeInsets.symmetric(horizontal: 20, vertical: 30),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  const Center(
                    child: Text(
                      'กู้คืนรหัสผ่าน',
                      style: TextStyle(
                        fontSize: 18,
                        fontWeight: FontWeight.bold,
                        color: Color(0xFF00A6A6),
                      ),
                    ),
                  ),
                  const SizedBox(height: 30),
                  const Text(
                    'อีเมล หรือ ชื่อผู้ใช้งาน',
                  ),
                  const SizedBox(height: 12),
                  TextField(
                    controller: emailController,
                    decoration: InputDecoration(
                      hintText: 'กรอกอีเมล',
                      filled: true,
                      fillColor: const Color(0xFFF2F2F2),
                      border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(30),
                        borderSide: BorderSide.none,
                      ),
                      prefixIcon: const Icon(Icons.email),
                    ),
                  ),
                  const SizedBox(height: 20),
                  Align(
                    alignment: Alignment.center,
                    child: MainButton(
                      title: 'กู้รหัสผ่าน',
                      onPressed: () {},
                    ),
                  ),
                  const SizedBox(height: 20),
                  Center(
                    child: TextButton(
                      onPressed: () {
                        Navigator.pop(context);
                      },
                      child: const Text(
                        'ย้อนกลับไปหน้าเข้าสู่ระบบ',
                        style: TextStyle(color: Color(0xFF00A6A6)),
                      ),
                    ),
                  ),
                ],
              ),
            ),
          ),
        ],
      ),
    );
  }
}
