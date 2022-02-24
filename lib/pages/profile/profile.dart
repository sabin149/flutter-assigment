import 'package:flutter/material.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '/model/user_model.dart';
import "package:provider/provider.dart";
import '../../model/post_model.dart'; 
import '../../services/httpuser.dart';
import '../shared/theme.dart';
// import 'profile_item.dart';

class Profile extends StatefulWidget {
    final PostModel? post;
  const Profile( {Key? key, this.post}) : super(key: key);
  @override 
  _ProfileState createState() => _ProfileState();
} 
class _ProfileState extends State<Profile> {
    bool isApiCallProcess = false;
     @override
  void initState() { 
    super.initState(); 
  }
  @override 
  Widget build(BuildContext context) { 
 final post = ModalRoute.of(context)!.settings.arguments as PostModel; 
    return Scaffold( 
      appBar: AppBar( 
        title: const Text('Profile'),
        actions: [
          IconButton(
            icon: const Icon(Icons.brightness_6),
            onPressed: () {
              Provider.of<ThemeProvider>(context, listen: false).swapTheme();
            },
          )
        ],
      ), 
      body: ProgressHUD(
        child: loadUserDetails(post.user!.sId),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ), 
    );
  }

Widget loadUserDetails(userid) {

  return FutureBuilder( 
    future: HttpConnectUser().getUserDetails(userid),
    builder: (
      BuildContext context, 
      AsyncSnapshot<UserModel?> model,
    ) {
      if (model.hasData) {
        // print(model.data);
        return Column(children: [   
Text("${model.data!.email}"),
Text("${model.data!.fullname}")
        ],); 
      }
      return const Center(
        child: CircularProgressIndicator(), 
      );
    },
  );

}
Widget userList(userde) {

    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [
               
            ],
          )
        ],
      ),
    );
  }
}


  // Map<String, dynamic> map = json.decode(response.body);

  //     var user = UserModel.fromJson(map);
  //       return user; 

// FutureBuilder<List<UserModel>>(
//         future: HttpConnectUser.getUserDetails("${post.user!.sId}"),
//         builder: (context, userdetails) {
//           // print(userdetails);
//           if (userdetails.hasData) {
//             return ListView.builder(
//                 itemCount: userdetails.data!.length,
//                 itemBuilder: (context, index) {
//                   return Padding(
//                     padding:const EdgeInsets.only(top: 10.0),
//                     child:  Text("${userdetails.data![index].username}"),
                    
//                   ); 
//                 } 
//                 );
//           } else if (userdetails.hasError) {
//             return Text('${userdetails.error}');
//           }
//           return const CircularProgressIndicator();
//         },
//       ),