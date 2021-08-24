import 'package:flutter/cupertino.dart';
import 'package:flutter/material.dart';
import 'package:konnect/modal/modal.dart';

class LoginPage extends StatelessWidget {
  final controllerEmailId = TextEditingController();
  final controllerPassword = TextEditingController();

  TextStyle get _style => TextStyle(
        color: Colors.white,
        fontWeight: FontWeight.bold,
      );

  @override
  Widget build(BuildContext context) {
    bool _obscureText = true;
    return Scaffold(
      body: ListView(
          padding: EdgeInsets.only(left: 24, right: 24),
          shrinkWrap: true,
          children: [
            Container(
              padding: EdgeInsets.all(48),
              child: Image.asset(
                'assets/logo.png',
                height: 120,
              ),
            ),
            TextFormField(
              style: _style,
              controller: controllerEmailId,
              decoration: InputDecoration(
                prefixIcon: Icon(
                  Icons.email_outlined,
                  color: Colors.white,
                ),
                hintText: 'Email Id',
              ),
            ),
            SizedBox(height: 24),
            StatefulBuilder(
              builder: (_, setState) => TextFormField(
                style: _style,
                controller: controllerPassword,
                decoration: InputDecoration(
                  suffixIcon: IconButton(
                    icon: Icon(
                      _obscureText ? Icons.visibility : Icons.visibility_off,
                      color: Colors.white,
                    ),
                    onPressed: () =>
                        setState(() => _obscureText = !_obscureText),
                  ),
                  prefixIcon: Icon(
                    Icons.lock_open,
                    color: Colors.white,
                  ),
                  hintText: 'Password',
                ),
                obscureText: _obscureText,
              ),
            ),
            SizedBox(height: 40),
            TextButton(
              onPressed: () {},
              child: Container(
                  padding: EdgeInsets.all(18),
                  child: Text('Forgotten Password?')),
            ),
            SizedBox(height: 20),
            ElevatedButton(
              onPressed: () async {
                var emailId = controllerEmailId.text;
                var password = controllerPassword.text;
                if (emailId.length == 0 || password.length == 0) {
                  ScaffoldMessenger.of(context).showSnackBar(SnackBar(
                    content: Container(
                      height: 60,
                      alignment: Alignment.center,
                      child: Text('All Fields are Required'),
                    ),
                  ));
                  return;
                }
                var modal = AuthModel.of(context);
                modal.logIn(email: emailId, password: password);
              },
              child: Container(
                padding: EdgeInsets.all(18),
                child: Text(
                  'SUBMIT',
                  style: TextStyle(
                    fontSize: 18,
                    fontWeight: FontWeight.bold,
                  ),
                ),
              ),
            ),
          ]),
    );
  }
}
