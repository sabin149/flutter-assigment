import 'package:flutter/material.dart';
import 'package:flutter/cupertino.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/model/updateuser_model.dart';
import 'package:frontend/model/user_model.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/services/httpuser.dart';
import 'package:motion_toast/motion_toast.dart';


class EditProfile extends StatefulWidget {
  const EditProfile({Key? key}) : super(key: key);

  @override
  _EditProfileState createState() => _EditProfileState();
}

class _EditProfileState extends State<EditProfile> {
  final _formkey = GlobalKey<FormState>();
  String? fullname;
  String? username;
  String? email;
  String? mobile;
  String? story;
  String? id;

  Future<String> updateUserDetails(UpdateUserModel user) {
    var res = HttpConnectUser().updateUser(user);
    return res;
  }

  

  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    Size size = MediaQuery.of(context).size;

    var userFullname = user.fullname;
    var userUsername = user.username;
    var userEmail = user.email;
    var userMobile = user.mobile;
    var userStory = user.story;
    var userId = user.sId;
    var avatar = user.avatar;

    return Scaffold(
        appBar: AppBar(
          title: const Text('User Profile'),
          centerTitle: true,
          actions: <Widget>[
            IconButton(
              icon: const Icon(CupertinoIcons.multiply),
              onPressed: () {
                Navigator.pop(context);
              },
              color: Colors.white,
            )
          ],
        ),
        body: ListView.builder(
          shrinkWrap: true,
          physics: const ClampingScrollPhysics(),
          scrollDirection: Axis.vertical,
          itemCount: 1,
          itemBuilder: (context, index) {
            return SizedBox(
              height: size.height * 1,
              child: SingleChildScrollView(
                padding: const EdgeInsets.all(20),
                child: Form(
                  key: _formkey,
                  child: Column(
                    children: [
                      Stack(
                        children: [
                          CircleAvatar(
                            radius: 80,
                            backgroundImage: NetworkImage("${user.avatar}"),
                            child: InkWell(
                              onTap: () {},
                            ),
                          ),
                        ],
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: userFullname ?? "",
                        validator: RequiredValidator(errorText: 'Required'),
                        onSaved: (value) {
                          fullname = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelStyle: TextStyle(
                              fontWeight: bold, fontSize: 20, letterSpacing: 2),
                          labelText: 'Fullname',
                          hintText: 'Fullname',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: userUsername ?? "",
                        // initialValue: userUsername,
                        validator: RequiredValidator(errorText: 'Required'),
                        onSaved: (value) {
                          username = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelStyle: TextStyle(
                              fontWeight: bold, fontSize: 20, letterSpacing: 2),
                          labelText: 'Username',
                          hintText: 'Username',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: userEmail ?? "",
                        // initialValue: userEmail,

                        validator: MultiValidator(
                          [
                            RequiredValidator(errorText: 'Required'),
                            EmailValidator(errorText: "Email is not valid"),
                          ],
                        ),
                        onSaved: (value) {
                          email = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelStyle: TextStyle(
                              fontWeight: bold, fontSize: 20, letterSpacing: 2),
                          labelText: 'Email',
                          hintText: 'Email',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: userMobile ?? "",
                        // initialValue: userMobile,
                        validator: RequiredValidator(errorText: 'Required'),
                        onSaved: (value) {
                          mobile = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelStyle: TextStyle(
                              fontWeight: bold, fontSize: 20, letterSpacing: 2),
                          labelText: 'Mobile',
                          hintText: 'Mobile',
                        ),
                      ),
                      const SizedBox(height: 20),
                      TextFormField(
                        initialValue: userStory ?? "",
                        // initialValue: userStory,
                        validator: RequiredValidator(errorText: 'Required'),
                        onSaved: (value) {
                          story = value;
                        },
                        decoration: InputDecoration(
                          border: const OutlineInputBorder(
                            borderRadius: BorderRadius.all(Radius.circular(10)),
                          ),
                          labelStyle: TextStyle(
                              fontWeight: bold, fontSize: 20, letterSpacing: 2),
                          labelText: 'Story',
                          hintText: 'Story',
                        ),
                      ),
                      const SizedBox(height: 20),
                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          minimumSize: const Size(double.infinity, 50),
                        ),
                        onPressed: () async {
                          if (_formkey.currentState!.validate()) {
                            _formkey.currentState!.save();
                            UpdateUserModel user = UpdateUserModel(
                              fullname: fullname,
                              username: username,
                              email: email,
                              mobile: mobile,
                              avatar: avatar,
                              story: story,
                              sId: userId,
                            );

                            var isCreated = await updateUserDetails(user);
                            if (isCreated == "true") {
                              MotionToast.success( 
                                      description:
                                          const Text("Profile Updated"))
                                  .show(context);
                             
                                 
                            } else {
                              MotionToast.error(
                                description: Text(isCreated),
                              ).show(context);
                            } 
                          }
                        },
                        child: const Text('Update Profile'),
                      ),
                      const SizedBox(height: 10),
                    ],
                  ),
                ),
              ),
            );
          },
        ));
  }
}
