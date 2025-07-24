import 'package:flutter/material.dart';
import 'package:login/widgets/custom_field.dart';
import 'package:login/widgets/logo_widget.dart';
import 'package:login/widgets/main_button.dart';
import 'package:provider/provider.dart';
import '../viewmodels/login_viewmodel.dart';

class LoginPage extends StatelessWidget {
  const LoginPage({super.key});

  @override
  Widget build(BuildContext context) {
    print('---- build');
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
              padding: const EdgeInsets.all(24),
              decoration: const BoxDecoration(
                color: Colors.white,
                borderRadius: BorderRadius.vertical(top: Radius.circular(40)),
              ),
              child: SingleChildScrollView(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    const SizedBox(height: 12),
                    const Center(
                      child: Text(
                        "ลงชื่อเข้าสู่ระบบ",
                        textAlign: TextAlign.center,
                        style: TextStyle(
                          fontSize: 16,
                          color: Color(0xFF00A6A6),
                        ),
                      ),
                    ),
                    const SizedBox(height: 24),
                    const Text('ชื่อผู้ใช้งาน'),
                    const SizedBox(height: 12),
                    CustomField(
                      label: 'ชื่อผู้ใช้งาน',
                      icon: Icons.person,
                      onChanged: context.read<LoginViewModel>().setUsername,
                    ),
                    const SizedBox(height: 16),
                    const Text('รหัสผ่าน'),
                    const SizedBox(height: 12),
                    Consumer<LoginViewModel>(
                      builder: (_, vm, __) {
                        return CustomField(
                          label: 'รหัสผ่าน',
                          icon: Icons.lock,
                          obscureText: vm.obscurePassword,
                          onChanged: context.read<LoginViewModel>().setPassword,
                          onToggleVisibility: context.read<LoginViewModel>().togglePassword,
                        );
                      }
                    ),
                    Align(
                      alignment: Alignment.centerRight,
                      child: TextButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/forgot_password');
                        },
                        child: const Text(
                          "ลืมรหัสผ่าน?",
                          style: TextStyle(color: Color(0xFF00A6A6)),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Consumer<LoginViewModel>(
                      builder: (_, vm, __) {
                        return Padding(
                          padding: const EdgeInsets.all(8.0),
                          child: Center(
                            child: Text(
                              vm.errorMessage ?? '',
                              style: const TextStyle(color: Colors.red),
                            ),
                          ),
                        );
                      },
                    ),
                    Align(
                      alignment: Alignment.center,
                      child: MainButton(
                          title: "เข้าสู่ระบบ",
                          onPressed: () {
                            if (context.read<LoginViewModel>().validateInputs()) {
                              ScaffoldMessenger.of(context).showSnackBar(
                                const SnackBar(content: Text("เข้าสู่ระบบสำเร็จ")),
                              );
                            }
                          }),
                    ),
                  ],
                ),
              ),
            ),
          ),
        ],
      ),
    );
  }
}
