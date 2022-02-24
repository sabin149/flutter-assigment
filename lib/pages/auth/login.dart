import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../services/httpuser.dart';
import '../shared/themes.dart';

class Login extends StatefulWidget {
  const Login({Key? key}) : super(key: key);

  @override
  _LoginState createState() => _LoginState(); 
}

class _LoginState extends State<Login> {
  final TextEditingController _emailController = TextEditingController();
  final TextEditingController _passwordController = TextEditingController();

  bool _isEmailValid = false;
  bool _isPasswordValid = false;

  bool _isHidePassword = false;

  final _formkey = GlobalKey<FormState>();
  String email = "";
  String password = "";

  @override
  void dispose() {
    _emailController.dispose();
    _passwordController.dispose();
    super.dispose();
  }

  Future<String?> loginPost(String username, String password) {
    var res = HttpConnectUser().loginPosts(username, password);
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
                  maxHeight: MediaQuery.of(context).size.height - 90),
              child: Container(
                margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                child: Column(
                  mainAxisAlignment: MainAxisAlignment.center,
                  children: [
                  const Text(" Let's Connect",textWidthBasis: TextWidthBasis.parent,style: TextStyle(fontSize: 35,fontWeight: FontWeight.bold),),
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
                    const SizedBox(height: 20),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.end,
                      children: [
                        Text(
                          'Forgot Password?',
                          style: TextStyle(
                            color: blueColor,
                            fontWeight: medium,
                            fontSize: 12,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    SizedBox(
                      height: 45,
                      width: double.infinity,
                      child: ElevatedButton(
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
                                var isCreated= await loginPost(email, password);
                              
                             
                                if(isCreated=="true"){
                                  _formkey.currentState!.reset();
                                
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                    id: 1,
                                    channelKey: 'letsconnect',
                                    title: 'Login Successfull',
                                    body: 'user email is : $email ',
                                  ));
                                  MotionToast.success( 
                                          description:
                                   const Text('Login Successfull'),
                                       
                                       )
                                      .show(context);
                                        Navigator.pushReplacementNamed(context, '/');
                                }else {
                                   MotionToast.error(
                                          description:
                                               Text('$isCreated'))
                                      .show(context);
                                   AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                    id: 1,
                                    channelKey: 'letsconnect',
                                    title: '$isCreated',
                                    body: 'user email is : $email ',
                                  ));
                                } }
                              }
                            : null,
                        child: Text(
                          'Log In',
                          style: TextStyle(
                            color: whiteColor,
                          ),
                        ),
                      ),
                    ),
                    const SizedBox(height: 20),
                    Row(
                      children: [
                        Expanded(
                          child: Divider(
                            color: greyBorderColor,
                            thickness: 0.3,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Text(
                          'OR',
                          style: TextStyle(
                            color: greyDarkColor,
                            fontWeight: medium,
                          ),
                        ),
                        const SizedBox(width: 20),
                        Expanded(
                          child: Divider(
                            color: greyBorderColor,
                            thickness: 0.3,
                          ),
                        ),
                      ],
                    ),
                    const SizedBox(height: 25),
                    Row(
                      mainAxisAlignment: MainAxisAlignment.center,
                      children: [
                        Image.asset('assets/logo/facebook.png', height: 20),
                        const SizedBox(width: 10),
                        Text(
                          'Log In With Facebook',
                          style: TextStyle(
                            color: blueColor,
                            fontWeight: medium,
                          ),
                        ),
                      ],
                    ),
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
              "Don't have an account? ",
              style: TextStyle(
                color: greyDarkColor, 
                letterSpacing: 0.1,
              ),
            ),
            InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/register');
              },
              child: Text(
                ' Sign Up.',
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
