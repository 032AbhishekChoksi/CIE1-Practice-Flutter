import 'package:flutter/material.dart';
import 'package:intl/intl.dart';

class RegistrationScreen extends StatefulWidget {
  const RegistrationScreen({super.key});

  @override
  State<RegistrationScreen> createState() => _RegistrationScreenState();
}

class _RegistrationScreenState extends State<RegistrationScreen> {
  TextEditingController txtEmail = TextEditingController();
  TextEditingController txtPassword = TextEditingController();
  TextEditingController txtdob = TextEditingController();
  TextEditingController txtJoiningTime = TextEditingController();
  String selectedGender = 'Male';
  List<String> listOfCity = [
    'Ahmedabad',
    'Vadodara',
    'Bharuch',
    'Ankleshware',
    'Surat',
    'Bardoli',
  ];
  String selectedCity = 'Bardoli';
  var selectedDOB;

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Registration'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(12.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              // Title
              const Text(
                'Registration Form',
                style: TextStyle(
                  fontSize: 30,
                  fontWeight: FontWeight.bold,
                  color: Colors.lightBlue,
                ),
              ),
              const SizedBox(height: 30),
              // Email Text Field
              TextField(
                controller: txtEmail,
                keyboardType: TextInputType.emailAddress,
                decoration: InputDecoration(
                  labelText: 'Email ID',
                  hintText: 'Email ID',
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  prefixIcon: const Icon(Icons.alternate_email),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              //   Password Text Field
              TextField(
                controller: txtPassword,
                obscureText: true,
                obscuringCharacter: '#',
                decoration: InputDecoration(
                  labelText: 'Password',
                  hintText: 'Password',
                  prefixIcon: const Icon(Icons.password),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
              ),
              const SizedBox(height: 15),
              // Male Radio Button
              RadioListTile(
                title: const Text('Male'),
                value: 'Male',
                groupValue: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
              ),
              const SizedBox(height: 2),
              // Female Radio Button
              RadioListTile(
                title: const Text('Female'),
                value: 'Female',
                groupValue: selectedGender,
                onChanged: (newValue) {
                  setState(() {
                    selectedGender = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15),
              //   List of City
              DropdownButton(
                value: selectedCity,
                items: listOfCity
                    .map<DropdownMenuItem<String>>(
                        (String city) => DropdownMenuItem(
                            value: city,
                            child: Padding(
                              padding: const EdgeInsets.all(10.0),
                              child: Text(
                                city,
                                style: const TextStyle(fontSize: 20),
                              ),
                            )))
                    .toList(),
                onChanged: (String? newValue) {
                  setState(() {
                    selectedCity = newValue!;
                  });
                },
              ),
              const SizedBox(height: 15),
              //   Date Of Birth
              TextField(
                controller: txtdob,
                readOnly: true,
                showCursor: true,
                decoration: InputDecoration(
                  labelText: 'DOB',
                  hintText: 'DOB',
                  suffixIcon: const Icon(Icons.calendar_month),
                  enabledBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blueAccent),
                    borderRadius: BorderRadius.circular(20),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                    borderRadius: BorderRadius.circular(20),
                  ),
                ),
                onTap: () async {
                  DateTime? datePicker = await showDatePicker(
                    context: context,
                    initialDate: DateTime.now(),
                    firstDate: DateTime(2000),
                    lastDate: DateTime.now(),
                  );
                  if (datePicker != null) {
                    setState(() {
                      selectedDOB = DateFormat('dd-MM-yyy').format(datePicker);
                      txtdob.text = selectedDOB;
                    });
                  }
                },
              ),
              // SignIn Button
              ElevatedButton(
                onPressed: () =>
                    Navigator.pushReplacementNamed(context, '/login'),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Sign In',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
