import 'package:flutter/material.dart';
import 'package:frontend/services/httppost.dart';
import 'package:frontend/model/post_model.dart';
import '../shared/config.dart';
import '/pages/home/widgets/post_item.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Home extends StatefulWidget {
  final PostModel ?post;

  const Home( {Key? key, this.post}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}
 
class _HomeState extends State<Home> {

  bool isApiCallProcess = false;
  @override
  void initState() {
  Config.loadToken();
  Config.loaduserId();
    super.initState(); 
  }
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        centerTitle: true,
        title: const Text(
          "Let's Connect",
          style:
              TextStyle(fontFamily: "Genel", fontSize: 30,),
        ), 
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger,  
              size: 20, 
            ),
            onPressed: () { 
              Navigator.pushNamed(context, "/settings",

              );
             
            }, 
          ),
        ],
      ),
      body: ProgressHUD(
        child: loadPosts(),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

Widget loadPosts() {
  return FutureBuilder(
    future: HttpConnectPost().getPosts(),
    builder: (
      BuildContext context,
      AsyncSnapshot<List<PostModel>?> model,
    ) {

      if (model.hasData) {
        return postList(model.data);
      }
      return const Center( 
        child: CircularProgressIndicator(),
      );
    },
  );
}

Widget postList(posts) {
    return SingleChildScrollView(
      child: Column(
        mainAxisAlignment: MainAxisAlignment.spaceAround,
        crossAxisAlignment: CrossAxisAlignment.center,
        children: [
          Column(
            mainAxisAlignment: MainAxisAlignment.start,
            children: [

              ListView.builder(
                shrinkWrap: true, 
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: posts.length,
                itemBuilder: (context, index) {
                  return PostItem(
                      post:posts[index]
                  );
                },
              ),
            ],
          )
        ],
      ),
    );
  }
}
