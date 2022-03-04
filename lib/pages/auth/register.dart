import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../model/register_model.dart';
import '../../services/httpuser.dart';
import '../shared/themes.dart';

class Register extends StatefulWidget {
  const Register({Key? key}) : super(key: key);

  @override
  _RegisterState createState() => _RegisterState();
}

class _RegisterState extends State<Register> {
  final TextEditingController _fullnameController = TextEditingController();
  final TextEditingController _usernameController = TextEditingController();
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;
  bool _isFullnameValid = false;
  bool _isUsernameValid = false;

  bool _isHidePassword = false;

  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";
  String username = "";
  String fullname = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    _usernameController.dispose();
    _fullnameController.dispose();
    super.dispose();
  }

  Future<String> registerUser(User u) {
    var res = HttpConnectUser().registerUser(u);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: whiteColor,
      body: SafeArea(
        child: Form(
          key: _formkey,
          child: SingleChildScrollView(
            child: ConstrainedBox(
              constraints: BoxConstraints(
                  maxHeight: MediaQuery.of(context).size.height - 100),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                    const Text(
                      " Let's Connect",
                      textWidthBasis: TextWidthBasis.parent,
                      style:
                          TextStyle(fontSize: 35, fontWeight: FontWeight.bold),
                    ),
                    const SizedBox(
                      height: 30,
                    ),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: greyBorderColor,
                          width: 0.3,
                        ),
                      ),
                      child: TextFormField(
                        key:const ValueKey("fullname"),
                        controller: _fullnameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Full Name',
                          hintStyle: TextStyle(
                            color: greyDarkColor,
                            fontSize: 14,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isFullnameValid = !_isFullnameValid;
                                _fullnameController.clear();
                              });
                            },
                            child: _isFullnameValid
                                ? const Icon(Icons.close_rounded)
                                : const SizedBox(),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            fullname = value;
                            _isFullnameValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      key: const ValueKey("container"),
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: greyBorderColor,
                          width: 0.3,
                        ),
                      ),
                      child: TextFormField(
                           key:const ValueKey("username"),
                        controller: _usernameController,
                        keyboardType: TextInputType.text,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Username',
                          hintStyle: TextStyle(
                            color: greyDarkColor,
                            fontSize: 14,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isUsernameValid = !_isUsernameValid;
                                _usernameController.clear();
                              });
                            },
                            child: _isUsernameValid
                                ? const Icon(Icons.close_rounded)
                                : const SizedBox(),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            username = value;
                            _isUsernameValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: greyBorderColor,
                          width: 0.3,
                        ),
                      ),
                      child: TextFormField(
                        key:const ValueKey("email"),
                        controller: _emailController,
                        keyboardType: TextInputType.emailAddress,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Email',
                          hintStyle: TextStyle(
                            color: greyDarkColor,
                            fontSize: 14,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isEmailValid = !_isEmailValid;
                                _emailController.clear();
                              });
                            },
                            child: _isEmailValid
                                ? const Icon(Icons.close_rounded)
                                : const SizedBox(),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            email = value;
                            _isEmailValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                    const SizedBox(height: 15),
                    Container(
                      height: 50,
                      width: double.infinity,
                      padding: const EdgeInsets.symmetric(horizontal: 15),
                      decoration: BoxDecoration(
                        color: greyColor,
                        borderRadius: BorderRadius.circular(8),
                        border: Border.all(
                          color: greyBorderColor,
                          width: 0.3,
                        ),
                      ),
                      child: TextFormField(
                        key:const ValueKey("password"),
                        controller: _passwordController,
                        keyboardType: TextInputType.text,
                        obscureText: !_isHidePassword,
                        decoration: InputDecoration(
                          border: InputBorder.none,
                          hintText: 'Password',
                          hintStyle: TextStyle(
                            color: greyDarkColor,
                            fontSize: 14,
                          ),
                          suffixIcon: GestureDetector(
                            onTap: () {
                              setState(() {
                                _isHidePassword = !_isHidePassword;
                              });
                            },
                            child: (!_isHidePassword)
                                ? const Icon(Icons.visibility_off)
                                : const Icon(Icons.visibility),
                          ),
                        ),
                        onChanged: (value) {
                          setState(() {
                            password = value;
                            _isPasswordValid = value.isNotEmpty;
                          });
                        },
                      ),
                    ),
                   
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
                        key:const ValueKey("signupButton"),
                        style: ElevatedButton.styleFrom(
                          primary: _isPasswordValid && _isEmailValid
                              ? blueColor
                              : blueSkyColor,
                          onSurface: blueColor,
                          elevation: 0,
                          shape: RoundedRectangleBorder(
                            borderRadius: BorderRadius.circular(8),
                          ),
                        ),
                        onPressed: _isPasswordValid && _isEmailValid
                            ? () async {
                                if (_formkey.currentState!.validate()) {
                                  _formkey.currentState!.save();
                                   User u = User(
                          fullname: fullname,
                          email: email,
                          username: username,
                          password: password);
                                  var isCreated =
                           await registerUser(u);
                                  if (isCreated == "Register Success!") {
                                    _formkey.currentState!.reset();
                                          Navigator.pushNamed(
                                        context, '/login');
                                    AwesomeNotifications().createNotification(
                                        content: NotificationContent(
                                      id: 1,
                                      channelKey: 'letsconnect',
                                      title: 'Register Successful',
                                      body: 'user email is : $email ',
                                    ));
                                    MotionToast.success(
                                      description:
                                           Text(isCreated),
                                    ).show(context);
                              
                                  } else {
                                    MotionToast.error(
                                            description: Text(isCreated))
                                        .show(context);
                                    AwesomeNotifications().createNotification(
                                        content: NotificationContent(
                                      id: 1,
                                      channelKey: 'letsconnect',
                                      title: isCreated,
                                      body: 'user email is : $email ',
                                    ));
                                  }
                                }
                              }
                            : null,
                        child: Text(
                          'Sign Up',
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                  
                  ],
                ),
              ),
            ),
          ),
        ),
      ),
      bottomNavigationBar: Container(
        height: 45,
        decoration: BoxDecoration(
          border: Border(
            top: BorderSide(
              color: greyBorderColor,
              width: 0.3,
            ),
          ),
        ),
        child: Row(
          mainAxisAlignment: MainAxisAlignment.center,
          children: [
            Text(
              "Already, have an account? ",
              style: TextStyle(
                color: greyDarkColor,
                letterSpacing: 0.1,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/login');
              },
              child: Text(
                ' Log In.',
                style: TextStyle(
                  color: blueColor,
                  fontWeight: medium,
                ),
              ),
            ),
          ],
        ),
      ),
    );
  }
}
