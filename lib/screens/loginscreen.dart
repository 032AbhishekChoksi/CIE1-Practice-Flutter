import 'package:flutter/gestures.dart';
import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginScreen extends StatelessWidget {
  const LoginScreen({super.key});

  @override
  Widget build(BuildContext context) {
    TextEditingController txtEmail = TextEditingController();
    TextEditingController txtPassword = TextEditingController();

    loginClick() async {
      final SharedPreferences pref = await SharedPreferences.getInstance();
      if (txtEmail.text == "19bmiit032@gmail.com" &&
          txtPassword.text == "12345") {
        pref.setBool('isLogging', true);
        pref.setString('UserEmailID', txtEmail.text.toString());
        Navigator.pushReplacementNamed(context, '/dashboard');
      } else {
        print("Invalid Email ID and Password");
      }
    }

    return Scaffold(
      appBar: AppBar(
        title: const Text('Login'),
      ),
      body: Center(
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
              const SizedBox(height: 30),
              const Text(
                'Login Form',
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
                  helperText: 'Email ID',
                  suffixIcon: const Icon(Icons.email_outlined),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue, width: 2),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Password Text Field
              TextField(
                controller: txtPassword,
                keyboardType: TextInputType.visiblePassword,
                obscureText: true,
                obscuringCharacter: '#',
                decoration: InputDecoration(
                  labelText: 'Password',
                  helperText: 'Password',
                  suffixIcon: const Icon(Icons.password),
                  enabledBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blueAccent),
                  ),
                  focusedBorder: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20),
                    borderSide: const BorderSide(color: Colors.blue, width: 4),
                  ),
                ),
              ),
              const SizedBox(
                height: 25,
              ),
              // Login Button
              ElevatedButton(
                onPressed: () => loginClick(),
                child: const Padding(
                  padding: EdgeInsets.all(8.0),
                  child: Text(
                    'Login',
                    style: TextStyle(fontSize: 20),
                  ),
                ),
              ),
              const SizedBox(
                height: 20,
              ),
              // Sign In Link
              RichText(
                text: TextSpan(
                  text: "Don't have an account?\t",
                  style: TextStyle(
                    color: Colors.grey[500],
                    fontSize: 20,
                  ),
                  children: [
                    TextSpan(
                      recognizer: TapGestureRecognizer()
                        ..onTap =
                            () => Navigator.pushNamed(context, '/register'),
                      text: 'Create',
                      style: const TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black54,
                        fontSize: 20,
                      ),
                    )
                  ],
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }
}
