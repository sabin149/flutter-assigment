

import 'package:flutter/material.dart';
import 'package:flutter_svg/svg.dart';

import '../../../model/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel? model;

  const PostItem({Key? key, this.model}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Column(
      children: [
        postDetails(model!),
        // userDetails(model!),
        // postDetails(model!),
        // const SizedBox(
        //   height: 10,
        // ),
        // iconButtonDetails(model!),
        // reactionDetails(model!)
      ],
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

Widget postDeeetails(PostModel obj) {
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
    padding: const EdgeInsets.only(left: 15, right: 15, top: 3),
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
              onTap: () {
                print("like btn");
              },
            ),
            const SizedBox(
              width: 20,
            ),
            InkWell(
              child: SvgPicture.asset(
                "assets/images/comment_icon.svg",
                width: 27,
                color: Colors.black,
              ),
              onTap: () {
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

Widget reactionDetails(PostModel obj) {
  return Column(
    children: [
      Text("${obj.likes!.length} likes",
          style: const TextStyle(
            fontWeight: FontWeight.bold,
            fontSize: 20,
          ),
          textAlign: TextAlign.left)
    ],
  );
}

Widget postDetails(PostModel obj) {
  return Container(
    decoration: BoxDecoration(
        color: Colors.white,
        border: Border(top: BorderSide(color: Colors.grey.withOpacity(.3)))),
    child: Column(
      crossAxisAlignment: CrossAxisAlignment.start,
      children: <Widget>[
        ListTile(
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              '${obj.user!.avatar}',
            ),
          ),
          title: Text(
            "${obj.user!.username}",
            style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w400,
                fontSize: 21),
          ),
          trailing: const Icon(Icons.more_vert),
        ),
        Image.network(
          "${obj.images![0].url}",
          fit: BoxFit.cover,
          width: double.infinity,
        ),
        Padding(
          padding: const EdgeInsets.all(8.0),
          child: Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              Row(
                children: [
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.favorite_border,
                      size: 31,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon( 
                      Icons.comment,
                      size: 31,
                    ),
                  ),
                  IconButton(
                    onPressed: () {},
                    icon: const Icon(
                      Icons.send,
                      size: 31,
                    ),
                  ),
                ],
              ),
              IconButton(
                onPressed: () {},
                icon: const Icon(
                  Icons.bookmark_border,
                  size: 31,
                ),
              ),
            ],
          ),
        ),
        Padding(
          padding: const EdgeInsets.symmetric(horizontal: 12, vertical: 5),
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.start,
            children: [
              Text(
                '${obj.likes!.length} likes',
                // "liked by ${obj.likes![0].username} and ${obj.likes!.length-1} others",
                style:
                    const TextStyle(fontSize: 16, fontWeight: FontWeight.bold),
              ),
              Row(
                children: [
                  Text(
                    "${obj.user!.username}",
                    style: const TextStyle(
                        fontWeight: FontWeight.bold, fontSize: 16),
                  ),
                  Text(
                    " ${obj.content}",
                    style: const TextStyle(fontSize: 16),
                  ),
                ],
              ),
              Text("View all ${obj.comments!.length} comments",
                  style: const TextStyle(fontSize: 16))
            ],
          ),
        )
      ],
    ),
  );
}
