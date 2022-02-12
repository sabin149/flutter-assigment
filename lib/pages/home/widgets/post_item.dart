import 'package:flutter/material.dart';

import '../../../model/post_model.dart';

class PostItem extends StatelessWidget {
  final PostModel? post;

  const PostItem({
    Key? key,
    this.post,
  }) : super(key: key); 

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
          color: Colors.white,
          border: Border(top: BorderSide(color: Colors.grey.withOpacity(.3)))),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile',arguments: post);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${post!.user!.avatar}',
                ), 
              ),
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile',arguments: post);
              },
              child: Text(
                "${post!.user!.username}", 
                style: TextStyle(
                    color: Colors.black.withOpacity(.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 21),
              ),
            ),
            trailing: const Icon(Icons.more_vert),
          ),
          Image.network(
            "${post!.images![0].url}",
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
                      onPressed: () {
                           Navigator.pushNamed(context, '/comments');
                      },
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
                  '${post!.likes!.length} likes',
                  // "liked by ${post.likes![0].username} and ${post.likes!.length-1} others",
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Row(
                  children: [
                    Text(
                      "${post!.user!.username}",
                      style: const TextStyle(
                          fontWeight: FontWeight.bold, fontSize: 16),
                    ),
                    Text(
                      " ${post!.content}",
                      style: const TextStyle(fontSize: 16),
                    ),
                  ],
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/comments');
                  },
                  child: Text("View all ${post!.comments!.length} comments",
                      style: const TextStyle(fontSize: 16)),
                )
              ],
            ),
          )
        ],
      ),
    );
  }
}
