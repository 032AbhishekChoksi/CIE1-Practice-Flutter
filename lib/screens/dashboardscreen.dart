import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class DashboardScreen extends StatefulWidget {
  const DashboardScreen({super.key});

  @override
  State<DashboardScreen> createState() => _DashboardScreenState();
}

class _DashboardScreenState extends State<DashboardScreen> {
  var arrName = ['Abhishek', 'Deep', 'Monish', 'Kevin', 'Raj', 'Abhi'];
  var arrContact = [
    '7877884455',
    '9999884455',
    '7810203055',
    '9918884455',
    '9999991122',
    '88117722222'
  ];

  logout() async {
    final SharedPreferences pref = await SharedPreferences.getInstance();
    pref.setBool('isLogging', false);
    pref.setString('UserEmailID', '');
    Navigator.pushReplacementNamed(context, '/login');
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Dashboard'),
        leading: IconButton(
          icon: const Icon(Icons.logout),
          onPressed: () => logout(),
        ),
      ),
      body: Center(
        child: ListView.builder(
          padding: const EdgeInsets.all(10.0),
          itemCount: arrName.length,
          itemBuilder: (context, index) => ListTile(
            leading: const CircleAvatar(
              maxRadius: 20,
              foregroundColor: Colors.transparent,
              child: Icon(
                Icons.account_circle_rounded,
                size: 30,
                color: Colors.blueAccent,
              ),
            ),
            title: Text(
              arrName[index],
              style: const TextStyle(fontSize: 22, fontWeight: FontWeight.w700),
            ),
            subtitle: Text(
              arrContact[index],
              style: const TextStyle(fontSize: 18, fontStyle: FontStyle.italic),
            ),
          ),
        ),
      ),
    );
  }
}
