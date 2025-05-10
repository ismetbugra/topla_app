import 'package:flutter/material.dart';

class FindOpponentScreen extends StatelessWidget {
  const FindOpponentScreen({super.key});

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Rakip Bul'),
      ),
      body: const Center(
        child: Text(
          'Rakip Bul',
          style: TextStyle(fontSize: 24),
        ),
      ),
    );
  }
}
