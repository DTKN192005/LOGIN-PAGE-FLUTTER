import 'package:flutter/material.dart';
import 'main.dart';


class SignIn extends StatefulWidget {
  const SignIn({super.key});

  @override
  // ignore: library_private_types_in_public_api
  _SignInPage createState() => _SignInPage();
}

class _SignInPage extends State<MyApp> {
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();

  bool _isPasswordVisible = false;

  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      home: Scaffold(
        body: Container(
          padding: const EdgeInsets.fromLTRB(30, 0, 30, 0),
          constraints: const BoxConstraints.expand(),
          color: Colors.white,
          child: Column(
            mainAxisAlignment: MainAxisAlignment.end,
            crossAxisAlignment: CrossAxisAlignment.start,
            children: <Widget>[
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 40, 40),
                child: Container(
                    width: 70,
                    height: 70,
                    padding: const EdgeInsets.all(15),
                    decoration: const BoxDecoration(
                        shape: BoxShape.circle, color: Color(0xffd8d8d8)),
                    child: const FlutterLogo()),
              ),
              const Padding(
                  padding: EdgeInsets.fromLTRB(0, 0, 0, 60),
                  child: Text(
                    "Login",
                    style: TextStyle(
                        fontWeight: FontWeight.bold,
                        color: Colors.black,
                        fontSize: 30),
                  )),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: _usernameController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: const InputDecoration(
                      labelText: "USERNAME",
                      labelStyle:
                          TextStyle(color: Color(0xffd8d8d8), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: TextField(
                  controller: _emailController,
                  style: const TextStyle(fontSize: 18, color: Colors.black),
                  decoration: const InputDecoration(
                      labelText: "EMAIL",
                      labelStyle:
                          TextStyle(color: Color(0xffd8d8d8), fontSize: 15)),
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 40),
                child: Stack(
                  alignment: Alignment.centerRight,
                  children: <Widget>[
                    TextField(
                      controller: _passwordController,
                      style: const TextStyle(fontSize: 18, color: Colors.black),
                      obscureText: !_isPasswordVisible,
                      decoration: const InputDecoration(
                          labelText: "PASSWORD",
                          labelStyle: TextStyle(
                              color: Color(0xffd8d8d8), fontSize: 15)),
                    ),
                    GestureDetector(
                      onTap: _togglePasswordVisibility,
                      child: Text(
                        _isPasswordVisible ? "HIDE" : "SHOW",
                        style: const TextStyle(
                            color: Colors.blue,
                            fontSize: 13,
                            fontWeight: FontWeight.bold),
                      ),
                    ),
                  ],
                ),
              ),
              Padding(
                padding: const EdgeInsets.fromLTRB(0, 0, 0, 0),
                child: SizedBox(
                    width: double.infinity,
                    height: 56,
                    child: ElevatedButton(
                      style: ElevatedButton.styleFrom(
                        shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8)),
                      ),
                      onPressed: _onSignInClicked,
                      child: const Text(
                        "SIGN IN",
                        style: TextStyle(color: Colors.white, fontSize: 16),
                      ),
                    )),
              ),
              SizedBox(
                width: double.infinity,
                height: 100,
                child: Center(
                  child:  GestureDetector(
                    onTap: _onSignUpClicked,
                    child: const Text(
                      " HAVE AN ACCOUNT ? SIGN IN",
                      style: TextStyle(fontSize: 15, color: Color(0xffd8d8d8)),
                    ),
                  )
                ),
              ),
            ],
          ),
        ),
      ),
    );
  }

  void _togglePasswordVisibility() {
    setState(() {
      _isPasswordVisible = !_isPasswordVisible;
    });
  }

  void _onSignInClicked() {
    final username = _usernameController.text;
    final password = _passwordController.text;
    final email =_emailController.text;

    // Add your sign-in logic here

    // For example, you can validate the input and show a message
    if (username.isEmpty || password.isEmpty || email.isEmpty) {
      _showMessage('Please enter both username and password.');
    } else {
      _showMessage('Signed in successfully!');
    }
  }
  void _onSignUpClicked() {
    Navigator.push(
      context,
      MaterialPageRoute(builder: (context) => const MyApp()), // Điều hướng đến màn hình đăng ký
    );
  }

  void _showMessage(String message) {
    showDialog(
      context: context,
      builder: (context) => AlertDialog(
        content: Text(message),
        actions: <Widget>[
          TextButton(
            onPressed: () => Navigator.of(context).pop(),
            child: const Text('OK'),
          ),
        ],
      ),
    );
  }
}
