import 'package:flutter/material.dart';

class MyAnalysisView extends StatelessWidget {
  const MyAnalysisView({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(title: const Text('تحاليلِي'), centerTitle: true),
      body: Center(
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Icon(
              Icons.science_outlined,
              size: 80,
              color: Theme.of(context).primaryColor,
            ),
            const SizedBox(height: 20),
            const Text(
              'سجل تحاليلك',
              style: TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
            ),
            const SizedBox(height: 10),
            const Text(
              'سيظهر هنا سجل تحاليلك ونتائجك الطبية',
              textAlign: TextAlign.center,
            ),
          ],
        ),
      ),
    );
  }
}
