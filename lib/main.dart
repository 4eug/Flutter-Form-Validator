import 'package:flutter/material.dart';

void main() {
  runApp(MyApp());
}

class MyApp extends StatelessWidget {
  // This widget is the root of your application.
  @override
  Widget build(BuildContext context) {
    return MaterialApp(
      title: 'Flutter Demo',
      theme: ThemeData(
        primarySwatch: Colors.black,
      ),
      home: FormValidator(),
    );
  }
}

class FormValidator extends StatefulWidget {
  FormValidator({Key key, this.title}) : super(key: key);

  final String title;

  @override
  _FormValidatorState createState() => _FormValidatorState();
}

class _FormValidatorState extends State<FormValidator> {
  final _formKey = GlobalKey<FormState>();
  final _passwordController = TextEditingController();
  final _confirmPasswordController = TextEditingController();

  @override
  void dispose() {
    _passwordController.dispose();
    _confirmPasswordController.dispose();
    super.dispose();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      body: Container(
        padding: EdgeInsets.symmetric(
          vertical: 50.0,
          horizontal: 10.0,
        ),
        child: Column(
          children: [
            _buildForm(),
          ],
        ),
      ),
    );
  }

  Form _buildForm() {
    return Form(
      key: _formKey,
      child: Column(
        children: <Widget>[
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Index No cannot be empty';
                } else if (value.length < 3) {
                  return 'Index No must be at least 3 characters long.';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Index Number',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: const EdgeInsets.all(8.0),
            child: TextFormField(
              obscureText: true,
              controller: _passwordController,
              validator: (String value) {
                if (value.isEmpty) {
                  return 'Password cannot be empty';
                } else if (value.length < 6) {
                  return 'Password must be at least 6 characters long.';
                }
                return null;
              },
              decoration: InputDecoration(
                labelText: 'Password',
                border: OutlineInputBorder(
                    borderRadius: BorderRadius.circular(20.0)),
              ),
            ),
          ),
          Padding(
            padding: EdgeInsets.all(
              40.0,
            ),
            child: Container(
              width: double.infinity,
              margin: EdgeInsets.only(top: 20, bottom: 50),
              decoration: BoxDecoration(
                  color: Color(0xff19327d),
                  borderRadius: BorderRadius.all(Radius.circular(100)),
                  boxShadow: [
                    BoxShadow(
                      color: Color(0x60008FFF),
                      blurRadius: 10,
                      offset: Offset(0, 5),
                      spreadRadius: 0,
                    ),
                  ]),
              child: FlatButton(
                onPressed: () {
                  if (_formKey.currentState.validate()) {
                    debugPrint('Validated');
                  }
                },
                child: Text(
                  'Login',
                  style: TextStyle(
                    fontFamily: 'Poppins',
                    fontSize: 20,
                    color: Colors.white,
                    letterSpacing: 0.168,
                    fontWeight: FontWeight.w500,
                  ),
                ),
              ),
            ),
          )
        ],
      ),
    );
  }
}
