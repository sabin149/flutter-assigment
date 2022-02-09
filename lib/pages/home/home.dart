import 'package:flutter/material.dart';
import 'package:frontend/http/httppost.dart';
import 'package:frontend/model/post_model.dart';
import 'package:flutter_svg/flutter_svg.dart';

class Home extends StatefulWidget {
  const Home({Key? key}) : super(key: key);
  @override
  _HomeState createState() => _HomeState();
}

class _HomeState extends State<Home> {
  late Future<List<PostModel>> futurePost;
 
  @override
  void initState() {
    super.initState();
    futurePost = HttpConnectPost().getPosts();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      appBar: AppBar(
        title: const Text('Post Information'),
      ),
      body: FutureBuilder<List<PostModel>>(
        future: futurePost,
        builder: (context, snapshot) {
          if (snapshot.hasData) {
            return ListView.builder(
              itemCount: snapshot.data!.length,
              itemBuilder: (context, index) {
                return Column(
                  children: [
                    userDetails(snapshot.data![index]),
                    postDetails(snapshot.data![index]),
                    const SizedBox(
                      height: 10,
                    ),
                    iconButtonDetails(snapshot.data![index]), 
                    reactionDetails(snapshot.data![index])
                  ],
                );
              },
            );
          } else if (snapshot.hasError) {
            return Text("${snapshot.error}");
          }
          return const CircularProgressIndicator();
        },
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

Widget postDetails(PostModel obj) {
  return Container(
    height: 400,
    decoration: const BoxDecoration(
      image: DecorationImage(
          image: NetworkImage(
              "https://www.bhaktiphotos.com/wp-content/uploads/2018/04/Mahadev-Bhagwan-Photo-for-Devotee.jpg"),
          fit: BoxFit.cover),
    ),
  );
}

Widget iconButtonDetails(PostModel obj) {
  return Padding(
    padding: const EdgeInsets.only(left: 15,right: 15,top: 3),
    child: Row(
      mainAxisAlignment: MainAxisAlignment.spaceBetween,
      children: [ 
        Row(
          children: [
            InkWell(
              child: SvgPicture.asset( 
                "assets/images/love_icon.svg",
                width: 27,
                color: Colors.black,
              ),
               onTap: (){
                print("like btn"); 
              },

            )
            ,  
            const SizedBox(
              width: 20,   
            ),
            InkWell(
              child: SvgPicture.asset(
                "assets/images/comment_icon.svg", 
                width: 27, 
                 color: Colors.black, 
              ),
              onTap: (){
                print("comment"); 
              }, 
            ),
            const SizedBox(
              width: 20, 
            ),
            SvgPicture.asset(
              "assets/images/message_icon.svg",
              width: 27,
               color: Colors.black,
            ), 
            
          ],
        ),
        SvgPicture.asset(
          "assets/images/save_icon.svg",     
          width: 27,  
           color: Colors.black,
        ),
      ], 
    ),
  );
}

Widget reactionDetails(PostModel obj){
  return Column(
    children: [
      Text("${obj.likes!.length} likes", style:const TextStyle(
        fontWeight: FontWeight.bold,
        fontSize: 20, 
      ),
      
      textAlign: TextAlign.left)
    ],
  );
}    