import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:form_field_validator/form_field_validator.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/services/httpcomment.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../model/post_model.dart';

class CommentsPage extends StatefulWidget {
  const CommentsPage({
    Key? key,
    PostModel? post,
  }) : super(key: key);
  @override
  _CommentsPageState createState() => _CommentsPageState();
}

class _CommentsPageState extends State<CommentsPage> {
  final _formKey = GlobalKey<FormState>();
  String content = "";

  Future<String> createComments(Comments comment) {
    var res = HttpConnectComment().createComment(comment);
    return res;
  }

  Future<String> deleteComments(String id) {
    var res = HttpConnectComment().deleteComment(id);
    return res;
  }

  Future<String> likeComments(String commentId, String userId) {
    var res = HttpConnectComment().likeComment(commentId, userId);
    return res;
  }

  Future<String> unlikeComments(String commentId, String userId) {
    var res = HttpConnectComment().unLikeComment(commentId, userId);
    return res;
  }

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as PostModel;
    var postId = post.sId;
    var userId = post.user!.sId;
    var postUserId = post.user!.sId;
    var time = post.createdAt.toString().substring(5, 10);

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
                      const SizedBox(
                        width: 5,),
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
                    time,
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
                                  const SizedBox(
                        width: 5,),
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
                            crossAxisAlignment: CrossAxisAlignment.start,
                            mainAxisAlignment: MainAxisAlignment.spaceBetween,
                            children: [
                              Text(
                                post.comments![index].createdAt
                                    .toString()
                                    .substring(5, 10),
                                style: TextStyle(
                                    fontWeight: medium,
                                    color: const Color.fromARGB(
                                        255, 126, 124, 124),
                                    letterSpacing: 2),
                              ),
                              Text(
                                "${post.comments![index].likes!.length} likes",
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
                              InkWell(
                                onTap: () async {
                                  if (post.comments![index].likes!.isEmpty) {
                                    await likeComments(
                                        "${post.comments![index].sId}",
                                        userId!);

                                        AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                    id: 1,
                                    channelKey: 'letsconnect',
                                    title: 'Success',
                                    body: 'Comment Liked ',
                                  ));

                                    MotionToast.success(
                                      description: const Text('Comment Liked'),
                                    ).show(context);
                                    Navigator.pushNamed(context, '/');
                                  } else {
                                    await unlikeComments(
                                        "${post.comments![index].sId}",
                                        userId!);


                                    MotionToast.success(
                                      description:
                                          const Text('Comment UnLiked'),
                                    ).show(context);
                                    Navigator.pushNamed(context, '/');
                                  }
                                },
                                child: post.comments![index].likes!.isNotEmpty
                                    ? Icon(Icons.favorite, color: redColor)
                                    : const Icon(Icons.favorite_border),
                              ),
                              InkWell(
                                onTap: () => showDialog<String>(
                                  context: context,
                                  builder: (BuildContext context) =>
                                      AlertDialog(
                                    title: const Text('Change Comment'),
                                    content: const Text(
                                        'Are you sure you want to make changes into this comment?'),
                                    actions: [
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, '/comments'),
                                        child: const Text('Cancel'),
                                      ),
                                      TextButton(
                                        onPressed: () =>
                                            Navigator.pop(context, '/comments'),
                                        child: const Text('Edit'),
                                      ),
                                      TextButton(
                                        onPressed: () async {
                                          var res = await deleteComments(
                                              "${post.comments![index].sId}");

                                          if (res == "Deleted Comment!") {
                                            Navigator.pushReplacementNamed(
                                                context, "/");
                                            MotionToast.success(
                                              description: Text(res),
                                            ).show(context);
                                          } else {
                                            MotionToast.error(
                                                    description: Text(res))
                                                .show(context);
                                          }
                                        },
                                        child: const Text("Delete"),
                                      ),
                                    ],
                                  ),
                                ),
                                child: const Icon(FontAwesomeIcons.ellipsisV),
                              ),
                            ],
                          ),
                        ),
                      ],
                    ),
                  );
                }),
            const SizedBox(
              height: 20,
            ),
            SizedBox(
              height: MediaQuery.of(context).size.height * .2,
              child: Form(
                key: _formKey,
                child: Column(
                  children: [
                    Card(
                      child: Stack(
                        children: [
                          Column(
                            mainAxisAlignment: MainAxisAlignment.center,
                            children: [
                              Container(
                                margin:
                                    const EdgeInsets.symmetric(horizontal: 20),
                                child: TextFormField(
                                  onSaved: (newValue) => content = newValue!,
                                  validator:
                                      RequiredValidator(errorText: '*Required'),
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
                                      fontStyle: FontStyle.normal,
                                      decorationColor:
                                          blackColor.withOpacity(.5),
                                    ),
                                  ),
                                ),
                              ),
                            ],
                          ),
                          Positioned(
                            top: 10,
                            right: 45,
                            child: IconButton(
                              onPressed: () async {
                                if (_formKey.currentState!.validate()) {
                                  _formKey.currentState!.save();

                                  Comments comment = Comments(
                                      content: content,
                                      postId: postId,
                                      postUserId: postUserId);

                                  var isCreated = await createComments(comment);
                                  if (isCreated == "true") {
                                    _formKey.currentState!.reset();
                                    Navigator.pushReplacementNamed(
                                        context, '/');
                                      AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                    id: 1,
                                    channelKey: 'letsconnect',
                                    title: 'Success',
                                    body: 'Comment Created ',
                                  ));
                                    MotionToast.success(
                                      description:
                                          const Text("Comment Created"),
                                    ).show(context);
                                  } else {
                                    MotionToast.error(
                                      description:
                                          const Text("Comment not Created"),
                                    ).show(context);
                                  }
                                }
                              },
                              icon: Icon(Icons.send, color: blueColor),
                            ),
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
            ),
          ],
        ),
      ),

      // bottomSheet: SizedBox(
      //   height: MediaQuery.of(context).size.height * .1,
      //   child: Card(
      //     child: Stack(
      //       children: [
      //         Column(
      //           mainAxisAlignment: MainAxisAlignment.center,
      //           children: [
      //             Container(
      //               margin: const EdgeInsets.symmetric(horizontal: 20),
      //               child: TextFormField(
      //                 onSaved: (newValue) => content = newValue!,
      //                 validator: RequiredValidator(errorText: '*Required'),
      //                 textAlignVertical: TextAlignVertical.center,
      //                 decoration: InputDecoration(
      //                   border: InputBorder.none,
      //                   hintText: "Write a comment",
      //                   hintStyle: TextStyle(
      //                     color: blackColor.withOpacity(.5),
      //                     fontWeight: normal,
      //                     fontSize: 18,
      //                     letterSpacing: 1,
      //                     height: 1.5,
      //                     fontStyle: FontStyle.normal,
      //                     decorationColor: blackColor.withOpacity(.5),
      //                   ),
      //                 ),
      //               ),
      //             ),
      //           ],
      //         ),
      //         Positioned(
      //           top: 10,
      //           right: 45,
      //           child: IconButton(
      //             onPressed: ()async {
      //               if (_formKey.currentState!.validate()) {
      //                 _formKey.currentState!.save();

      //                 //  var isCreated= await createComments(
      //                 //     // post.id, content, post.user!.id

      //                 //     content, post.sId, post.user!.id
      //                 //  );

      //               }
      //             },
      //             icon:  Icon(Icons.send, color: blueColor),
      //           ),
      //         ),

      //       ],
      //     ),
      //   ),
      // ),
    );
  }
}
