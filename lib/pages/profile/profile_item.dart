import "package:flutter/material.dart";
import 'package:frontend/model/user_model.dart';

class ProfileItem extends StatelessWidget {
  final UserModel? user;
  const ProfileItem({ Key? key, this.user }) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      child: Text("${user!.fullname}"),
    );
  }
}