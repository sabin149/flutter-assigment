import 'package:flutter/material.dart';

import '../../../model/post_model.dart';

class CommentItem extends StatefulWidget {
    final PostModel? comment;
  const CommentItem({ Key? key, this.comment,  }) : super(key: key);

  @override
  _CommentItemState createState() => _CommentItemState();
}

class _CommentItemState extends State<CommentItem> {
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
          leading: CircleAvatar(
            backgroundImage: NetworkImage(
              'https://picsum.photos/200/300/?random'),
            ),
          
          title: Text(
            "dcgfhvg"
            ,
            style: TextStyle(
                color: Colors.black.withOpacity(.8),
                fontWeight: FontWeight.w400,
                fontSize: 21),
          ),
         ),
      ],
      ),
    );
  }
}