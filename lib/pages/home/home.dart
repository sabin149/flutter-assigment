import 'package:flutter/material.dart';
import 'package:frontend/http/httppost.dart';
import 'package:frontend/model/post_model.dart';
import 'package:frontend/pages/home/components/post_item.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  // late Future<List<PostModel>> futurePost;

  // @override
  // void initState() {
  //   super.initState();
  //   futurePost = HttpConnectPost().getPosts();
  // }
  bool isApiCallProcess = false;
  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        automaticallyImplyLeading: false,
        
        backgroundColor: Colors.white,
        centerTitle: true,
        title: const Text(
          "Let's Connect",
          style:
              TextStyle(fontFamily: "Genel", fontSize: 30, color: Colors.black),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.messenger,  
              size: 20, 
              color: Colors.black,
            ),
            onPressed: () { 
             
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
                      model:posts[index]
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

Widget userDetails(PostModel obj) {
  return Card(
    child: Row(
      children: [
        Container(
          decoration: BoxDecoration(
            border: Border.all(
                width: 3, color: const Color.fromARGB(255, 184, 183, 183)),
            borderRadius: const BorderRadius.all(
              Radius.circular(55),
            ),
          ),
          child: Padding(
            padding: const EdgeInsets.all(4.0),
            child: Container(
              decoration: BoxDecoration(
                border: Border.all(width: 2, color: Colors.white),
                borderRadius: const BorderRadius.all(
                  Radius.circular(55),
                ),
              ),
              child: CircleAvatar(
                backgroundColor: Colors.white,
                radius: 35,
                child: Image.network(
                  "${obj.user!.avatar}",
                ),
              ),
            ),
          ),
        ),
        const SizedBox(
          width: 20,
        ),
        Text(
          "${obj.user!.username}",
          style: const TextStyle(fontSize: 22, fontWeight: FontWeight.bold),
        ),
      ],
    ),
  );
}
