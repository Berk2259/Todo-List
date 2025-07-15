import 'package:flutter/material.dart';

class DescriptionScreen extends StatelessWidget {
  const DescriptionScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Center(
        child: Text(
          'Bu uygulama bir bilgisayar mühendisi öğrencisi tarafından geliştirilmiştir.Uygulamanın amacı tamamıyla kendime bir şeyler katıp flutter ve android geliştirme alanında bir şeyler öğrenmektir',
        ),
      ),
    );
  }
}
