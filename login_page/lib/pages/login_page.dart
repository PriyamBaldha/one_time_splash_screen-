import 'package:flutter/material.dart';
import 'package:shared_preferences/shared_preferences.dart';

class LoginPage extends StatefulWidget {
  const LoginPage({Key? key}) : super(key: key);

  @override
  State<LoginPage> createState() => _LoginPageState();
}

class _LoginPageState extends State<LoginPage> {
  final TextEditingController EmailController = TextEditingController();

  final TextEditingController PasswordController = TextEditingController();

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Page"),
        centerTitle: true,
      ),
      body: Container(
        padding: EdgeInsets.all(12),
        child: Column(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            TextFormField(
              keyboardType: TextInputType.emailAddress,
              // validator: (val) {
              //   if (val!.isEmpty) {
              //     return "Please Enter your Email Id...";
              //   }
              //   return null;
              // },
              // onSaved: (val) {
              //   Global.Email = val.toString();
              // },
              controller: EmailController,
              decoration: InputDecoration(
                  labelText: "Email",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextFormField(
              keyboardType: TextInputType.name,
              // validator: (val) {
              //   if (val!.isEmpty) {
              //     return "Please Enter your Password...";
              //   }
              //   return null;
              // },
              // onSaved: (val) {
              //   Global.Password = val.toString();
              // },
              controller: PasswordController,
              decoration: InputDecoration(
                  labelText: "Passsword",
                  labelStyle:
                      TextStyle(fontSize: 15, color: Colors.grey.shade400),
                  border: OutlineInputBorder(
                      borderRadius: BorderRadius.circular(10))),
            ),
            const SizedBox(
              height: 10,
            ),
            TextButton(
              onPressed: () {
                //forgot password screen
              },
              child: const Text(
                'Forgot Password',
              ),
            ),
            Container(
              height: 50,
              width: double.infinity,
              padding: const EdgeInsets.fromLTRB(10, 0, 10, 0),
              child: ElevatedButton(
                child: const Text('Login'),
                onPressed: () async {
                  String email = EmailController.text;
                  String password = PasswordController.text;

                  // if (LoginKey.currentState!.validate()) {
                  //   LoginKey.currentState!.save();
                  // }
                  //
                  // print("Course/Degree: ${Global.Email}");
                  // print("Course/Degree: ${Global.Password}");

                  SharedPreferences prefs =
                      await SharedPreferences.getInstance();

                  if (email == "admin@gmail.com" && password == "123") {
                    await prefs.setBool('isLoggedIn', true);

                    Navigator.of(context).pushReplacementNamed('HomePage');
                  } else {
                    ScaffoldMessenger.of(context).showSnackBar(
                      SnackBar(
                        content: Text("Wrong EmailId or Password !"),
                        backgroundColor: Colors.red,
                        behavior: SnackBarBehavior.floating,
                      ),
                    );
                  }
                },
              ),
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
              children: [
                const Text('Does not have account?'),
                TextButton(
                  child: const Text(
                    'Sign in',
                    style: TextStyle(fontSize: 20),
                  ),
                  onPressed: () {},
                )
              ],
            )
          ],
        ),
      ),
    );
  }
}
