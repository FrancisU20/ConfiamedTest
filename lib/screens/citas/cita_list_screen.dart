import 'package:confiamedtest/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

class CitaListScreen extends StatefulWidget {
  const CitaListScreen({Key? key}) : super(key: key);

  @override
  _CitaListScreenState createState() => _CitaListScreenState();
}

class _CitaListScreenState extends State<CitaListScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Citas'),
      ),
      body: const Center(
        child: Text('Citas List Screen'),
      ),
      bottomNavigationBar: const BottomNavBarWidget(
        currentIndex: 0,
      ),
    );
  }
}
