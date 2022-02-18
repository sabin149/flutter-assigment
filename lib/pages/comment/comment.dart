import 'package:flutter/material.dart';
import 'package:frontend/pages/shared/themes.dart';
import '../../../model/post_model.dart';

class Comments extends StatefulWidget {
  const Comments({
    Key? key,
  }) : super(key: key);
  @override
  _CommentsState createState() => _CommentsState();
}

class _CommentsState extends State<Comments> {
  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
      appBar: AppBar(
        centerTitle: true,
        title: const Text(
          "Comments",
          style: TextStyle(fontSize: 30),
        ),
        actions: [
          IconButton(
            icon: const Icon(
              Icons.share,
              size: 20,
            ),
            onPressed: () {},
          ),
        ],
      ),
      body: SingleChildScrollView(
        child: Column(
          crossAxisAlignment: CrossAxisAlignment.start,
          children: [
            const SizedBox(
              height: 20,
            ),
            ListTile(
              leading: CircleAvatar(
                backgroundImage: NetworkImage('${post.user!.avatar}'),
              ),
              title: Column(
                crossAxisAlignment: CrossAxisAlignment.start,
                children: [
                  Row(
                    children: [
                      Text(
                        "${post.user!.username}",
                        style: TextStyle(
                            color: blackColor.withOpacity(.8),
                            fontWeight: bold,
                            fontSize: 21),
                      ),
                      Text(
                        "${post.content}",
                        style: TextStyle(
                            color: blackColor.withOpacity(.8),
                            fontWeight: normal,
                            fontSize: 21),
                      )
                    ],
                  ),
                  Text(
                    "2h",
                    style: TextStyle(
                        fontWeight: medium,
                        color: const Color.fromARGB(255, 126, 124, 124),
                        letterSpacing: 2),
                  )
                ],
              ),
            ),
            Divider(
              height: 5,
              color: blackColor.withOpacity(.5),
              thickness: 1,
            ),
            ListView.builder(
                shrinkWrap: true,
                physics: const ClampingScrollPhysics(),
                scrollDirection: Axis.vertical,
                itemCount: post.comments!.length,
                itemBuilder: (context, index) {
                  return ListTile(
                    leading: CircleAvatar(
                      backgroundImage:
                          NetworkImage("${post.comments![index].user!.avatar}"),
                    ),
                    title: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [
                        Row(
                          children: [
                            Text(
                              "${post.comments![index].user!.username}",
                              style: TextStyle(
                                  color: blackColor.withOpacity(.8),
                                  fontWeight: bold,
                                  fontSize: 21),
                            ),
                            Text(
                              "${post.comments![index].content}",
                              style: TextStyle(
                                  color: blackColor.withOpacity(.8),
                                  fontWeight: normal,
                                  fontSize: 21),
                            )
                          ],
                        ),
                        Container(
                          margin: const EdgeInsets.symmetric(vertical: 3),
                          child: Row(
                            mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                            children: [
                              Text(
                                "2h",
                                style: TextStyle(
                                    fontWeight: medium,
                                    color: const Color.fromARGB(
                                        255, 126, 124, 124),
                                    letterSpacing: 2),
                              ),
                              Text(
                                "63 likes",
                                style: TextStyle(
                                    fontWeight: medium,
                                    color: const Color.fromARGB(
                                        255, 126, 124, 124),
                                    wordSpacing: 2),
                              ),
                              Text(
                                "Reply",
                                style: TextStyle(
                                  fontWeight: medium,
                                  color:
                                      const Color.fromARGB(255, 126, 124, 124),
                                ),
                              ),
                              IconButton(
                                  onPressed: () {},
                                  icon: const Icon(Icons.favorite_border))
                            ],
                          ),
                        )
                      ],
                    ),
                  );
                }),
            //  SizedBox(
            //   height: MediaQuery.of(context).size.height * .48,
            // ),
            // Stack(
            //   children: [
            //     Container(
            //       margin: const EdgeInsets.symmetric(horizontal: 20),
            //       child: TextFormField(
            //         decoration: InputDecoration(
            //           hintText: "Write a comment",
            //           hintStyle: TextStyle(
            //               color: blackColor.withOpacity(.5),
            //               fontWeight: normal,
            //               fontSize: 18,
            //               letterSpacing: 1,
            //               height: 1.5,
            //               fontFamily: 'Montserrat',
            //               fontStyle: FontStyle.normal,
            //               decorationStyle: TextDecorationStyle.solid,
            //               decorationColor: blackColor.withOpacity(.5),
            //               decoration: TextDecoration.none),
            //         ),
            //       ),
            //     ),
            //       Positioned(
            //         right: 45,
            //         child: IconButton(onPressed: (){}, icon: const Icon(Icons.send)))
            //   ],
            // ),
          ],
        ),
      ),
      bottomSheet: SizedBox(
        height: MediaQuery.of(context).size.height * .1,
        child: Card( 
          child: Stack(

            children: [
             
              Column(
                mainAxisAlignment: MainAxisAlignment.center,
                children: [
                  Container(
                    margin: const EdgeInsets.symmetric(horizontal: 20),
                    child: TextFormField(
                      textAlignVertical: TextAlignVertical.center,
                      decoration: InputDecoration(

                        border: InputBorder.none,
                        hintText: "Write a comment",
                        hintStyle: TextStyle(
                          
                            color: blackColor.withOpacity(.5),
                            fontWeight: normal,
                            fontSize: 18,
                            letterSpacing: 1,
                            height: 1.5,
                            fontFamily: 'Montserrat',
                            fontStyle: FontStyle.normal, 
                        
                            decorationColor: blackColor.withOpacity(.5),
                           ),
                      ), 
                    ),
                  ),
                ],
              ),
              Positioned( 
                top: 10,
                  right: 45,
                  child:
                      IconButton(onPressed: () {}, icon: const Icon(Icons.send),),),
            ],
          ),
        ),
      ),
    );
  }
}
