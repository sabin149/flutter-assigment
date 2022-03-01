import 'package:flutter/material.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/services/httpuser.dart';

import '../../../model/post_model.dart';
import '../../../model/user_model.dart';

class FollowingsPage extends StatefulWidget {
  const FollowingsPage({
    Key? key,
    PostModel? post,
  }) : super(key: key);

  @override
  State<FollowingsPage> createState() => _FollowingsPageState();
}

class _FollowingsPageState extends State<FollowingsPage> {

  
  Future<String> unFollowUsers(String loginUserId, String otherUserId) {
    var res = HttpConnectUser().unFollowUser(loginUserId, otherUserId);
    return res;
  }
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    var avatar = user.following!.map((following) => following.avatar).toList();
    var notAvatar = "https://res.cloudinary.com/sabin149/image/upload/v1645003189/s-network/lwuzv4lma4suvqhkt4oc.png";

    return Scaffold(
      appBar: AppBar( 
        title: const Text('Followings'),
      ),
      body: SingleChildScrollView(
        child: Column(
          children: [
            const SizedBox(height: 20),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: user.followers!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    subtitle: const SizedBox(height: 15), 
                    leading: AspectRatio(
                      aspectRatio: 1, 
                      child: InkWell(
                        child: CircleAvatar(
                          backgroundImage: NetworkImage(avatar[index] ?? notAvatar),
                        ),
                      ),
                    ),
                    title: Row(
                      mainAxisAlignment: MainAxisAlignment.spaceBetween,
                      children: [
                        Text(
                          "${user.followers![index].username}",
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 20,
                          ),
                        ),
                        ElevatedButton(
                            style: ElevatedButton.styleFrom(primary: blackColor),
                            onPressed: () {

                            },
                            child: Text(
                              "Following",
                              style: TextStyle(
                                color: whiteColor,
                              ),
                            ),)
                      ],
                    ),
                  );
                })
          ],
        ),
      ),
    );
  }
}
