import 'package:flutter/material.dart';
import 'screens/leave_management_screen.dart'; // استيراد صفحتك الجديدة

void main() {
  runApp(const HRApp());
}

class HRApp extends StatelessWidget {
  const HRApp({super.key});

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      debugShowCheckedModeBanner: false,
      title: 'HR App',
      theme: ThemeData(
        fontFamily: 'Arial',
        primarySwatch: Colors.indigo,
      ),
      home: const LeaveManagementScreen(), // تشغيل الصفحة مباشرة
    );
  }
}
