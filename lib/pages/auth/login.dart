import 'package:flutter/material.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../services/httpuser.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState();
}

class _LoginState extends State<Login> {
  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  Future<bool> loginPost(String username, String password) {
    var res = HttpConnectUser().loginPosts(username, password);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text("Login Screen"),
        
      ),
      body: Form(
        key: _formkey,
        child: Padding(
          padding: const EdgeInsets.all(10.0),
          child: ListView(
            children: [
              const SizedBox(
                height: 30,
              ),
              const CircleAvatar(
                backgroundImage: AssetImage("assets/images/profile_image.png"),
                radius: 80,
              ), 
              const SizedBox(
                height: 30,
              ),
              TextFormField(
                onSaved: (value) => email = value!,
                validator: MultiValidator([
                  RequiredValidator(errorText: "*Email Required"),
                  EmailValidator(errorText: "*Invalid Email")
                ]),
                style: const TextStyle(
                  fontSize: 20,
                ),
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.mail),
                    labelText: "Email",
                    hintText: 'Enter your email',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              TextFormField(
                onSaved: (value) => password = value!,
                validator: MultiValidator([
                  MaxLengthValidator(15,
                      errorText: "should be less than 15 characters "),
                  MinLengthValidator(5,
                      errorText: "should be lat least 5 characters "),
                  RequiredValidator(errorText: "*Required")
                ]),
                style: const TextStyle(
                  fontSize: 20,
                ),
                obscureText: true,
                decoration: const InputDecoration(
                    prefixIcon: Icon(Icons.lock),
                    labelText: "Password",
                    hintText: 'Enter your password',
                    border: OutlineInputBorder()),
              ),
              const SizedBox(
                height: 15,
              ),
              ElevatedButton(
                style: ElevatedButton.styleFrom(
                    minimumSize: const Size(double.infinity, 50)),
                onPressed: () async {
                  if (_formkey.currentState!.validate()) {
                    _formkey.currentState!.save();
                    await loginPost(email, password);
                 
                      _formkey.currentState!.reset();
                      // Navigator.pushNamed(context, '/');
                      Navigator.pushReplacementNamed(context, "/");
                      MotionToast.success(
                              description: const Text('Login Successfull'))
                          .show(context);
                    } else {
                      MotionToast.error(
                              description: const Text('Login UnSuccessfull'))
                          .show(context);
                    
                  }
                },
                child: const Text("Login"),
              ),
              Row(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  const Text("Don't have an account?"),
                  TextButton(
                    onPressed: () {
                      Navigator.pushNamed(context, '/register');
                    },
                    child: const Text("Register"),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }
}
