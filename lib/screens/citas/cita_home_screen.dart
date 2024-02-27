import 'package:confiamedtest/providers/cita_provider.dart';
import 'package:confiamedtest/widgets/bottom_navbar_widget.dart';
import 'package:flutter/material.dart';

class CitaHomeScreen extends StatefulWidget {
  const CitaHomeScreen({Key? key}) : super(key: key);

  @override
  _CitaHomeScreenState createState() => _CitaHomeScreenState();
}

class _CitaHomeScreenState extends State<CitaHomeScreen> {

  @override
  void initState() {
    CitaProvider().getCitas();
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
        appBar: AppBar(
          title: const Text('Citas'),
        ),
        body: const Center(
          child: Text('Citas Home Screen'),
        ),
        bottomNavigationBar: const BottomNavBarWidget(
          currentIndex: 1,
        ));
  }
}
