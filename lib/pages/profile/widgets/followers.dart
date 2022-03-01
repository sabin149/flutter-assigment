import 'package:flutter/material.dart';
import 'package:frontend/pages/shared/themes.dart';
import '../../../model/post_model.dart';
import '../../../model/user_model.dart';

class FollowersPage extends StatefulWidget {
  const FollowersPage({
    Key? key,
    PostModel? post,
  }) : super(key: key);

  @override
  State<FollowersPage> createState() => _FollowersPageState();
}

class _FollowersPageState extends State<FollowersPage> {
  @override
  Widget build(BuildContext context) {
    final user = ModalRoute.of(context)!.settings.arguments as UserModel;
    var avatar = user.followers!.map((follower) => follower.avatar).toList();

// print(avatar);

    return Scaffold(
      appBar: AppBar(
        title: const Text('Followers'),
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
                    child: CircleAvatar(
                      backgroundImage: NetworkImage("${avatar[index]}"),
                    ),
                  ),
                  
                  title: Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      
                      Text("${user.followers![index].username}",
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 20,
                          ),),

                      ElevatedButton(
                        style: ElevatedButton.styleFrom(
                          primary: blueColor
                          ),
                        
                        onPressed: (){}, child: Text("Follow",style: TextStyle(
                        color: whiteColor,

                      ),))
                    ],
                  ),
                );
              })
        ],  
      )),
    );
  }
}
