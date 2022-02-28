import 'package:awesome_notifications/awesome_notifications.dart';
import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/database/post_database.instance.dart';
import 'package:frontend/entity/post_entity.dart';
import 'package:frontend/pages/shared/themes.dart';
import 'package:frontend/services/httppost.dart';
import 'package:motion_toast/motion_toast.dart';
import '../../../model/post_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostItem extends StatefulWidget {
  final PostModel? post;
  final ValueChanged<String>? onPost;

  const PostItem({Key? key, this.post, this.onPost}) : super(key: key);

  @override
  State<PostItem> createState() => _PostItemState();
}

class _PostItemState extends State<PostItem> {
  bool _isSaved = false;

  // String? postId;
  // String? postAvatar; 
  // String? postUsername;
  // String? postLikeCount;
  // String? postContent;
  // String? postCommentCount;
 
// Future.delayed(const Duration(seconds: 4), () => 'Large Latte');

 insertPostData(PostEntity postdta) async {

try {
//   final database= await DatabaseInstance.instance.getDatabaseInstance();
//  await database.postDao.insertPost(postdta);
//  print("success");

} catch (e) {
  // print("failed");
  // print(e);  
} 
  }
  
  Future<List<PostEntity>> displayData() async {
    var database = await DatabaseInstance.instance.getDatabaseInstance();
    var result = database.postDao.findAllPosts();
    return result;
  }

  int _current = 0;
  final CarouselController _controller = CarouselController();

  Future<String> likePosts(String postId, String userId) {
    var res = HttpConnectPost().likePost(postId, userId);
    return res;
  }

  Future<String> unLikePosts(String postId, String userId) {
    var res = HttpConnectPost().unLikePost(postId, userId);
    return res;
  }
 
  Future<String> deletePosts(String postid, String userid) {
    var res = HttpConnectPost().deletePost(postid, userid);
    return res;
  }

  void _toggleIsSaved() {
    setState(() {
      _isSaved = !_isSaved;
    });
  }

  @override
  Widget build(BuildContext context) {
    var postId=widget.post!.sId;
    var postAvatar=widget.post!.user!.avatar;
    var postUsername=widget.post!.user!.username;
    var postLikeCount=widget.post!.likes!.length.toString();
    var postContent=widget.post!.content;
    var postCommentCount=widget.post!.comments!.length.toString();

PostEntity postdta=PostEntity(
  postId: postId,
  avatar: postAvatar,
  username: postUsername,
  likeCount: postLikeCount,
  postContent: postContent,
  commentCount: postCommentCount,
);
  
 setState(() {
     insertPostData(postdta); 
 });


    return Container(
      decoration: BoxDecoration(
        border: Border(
          top: BorderSide(
            color: Colors.grey.withOpacity(.3),
          ),
        ),
      ),
      child: Column(
        crossAxisAlignment: CrossAxisAlignment.start,
        children: [
          ListTile(
            leading: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile',
                    arguments: widget.post);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${widget.post!.user!.avatar}',
                ),
              ),
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile',
                    arguments: widget.post);
              },
              child: Text(
                "${widget.post!.user!.username}",
                style: TextStyle(
                    color: blackColor.withOpacity(.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 21),
              ),
            ),
            trailing: InkWell( 
                onTap: () => showDialog<String>(
                      context: context,
                      builder: (BuildContext context) => AlertDialog(
                        title: const Text('Delete Post',
                            textAlign: TextAlign.center,
                            style: TextStyle(
                              fontWeight: FontWeight.w500,
                            )),
                        content: const Text(
                            'Are you sure you want to delete this post?'),
                        actions: <Widget>[
                          TextButton(
                            onPressed: () => Navigator.pop(context, 'Cancel'),
                            child: const Text('Cancel'),
                          ),
                          TextButton(
                            onPressed: () async {
                              var res = await deletePosts("${widget.post!.sId}",
                                  "${widget.post!.user!.sId}");
                              if (res == "true") {
                                Navigator.pushReplacementNamed(context, "/");
                                  AwesomeNotifications().createNotification(
                                      content: NotificationContent(
                                    id: 1,
                                    channelKey: 'letsconnect',
                                    title: 'Success',
                                    body: 'Post Deleted',
                                  ));
                                MotionToast.success(
                                  description: const Text("Post Deleted"),
                                ).show(context);
                              } else {
                                MotionToast.error(description: Text(res))
                                    .show(context);
                              }
                            },
                            child: const Text('OK'),
                          ),
                        ],
                      ),
                    ),
                child: const Icon(FontAwesomeIcons.ellipsisV)),
          ),
          GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  carouselController: _controller,
                  items: widget.post!.images!.map((iurl) {
                    return Image.network(
                      '${iurl.url}',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    );
                  }).toList(),
                  options: CarouselOptions(
                      aspectRatio: 1,
                      enlargeCenterPage: true,
                      height: MediaQuery.of(context).size.height / 2,
                      viewportFraction: 1,
                      onPageChanged: (index, reason) {
                        setState(() {
                          _current = index;
                        });
                      }),
                ),
              ],
            ),
          ),
          Row(
            mainAxisAlignment: MainAxisAlignment.spaceBetween,
            children: [
              const Padding(
                padding: EdgeInsets.all(8.0),
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  icon: widget.post!.likes!.isNotEmpty
                      ? Icon(
                          Icons.favorite,
                          color: redColor,
                        )
                      : const Icon(Icons.favorite_border),
                  onPressed: () async {
                    if (widget.post!.likes!.length > 1) {
                      await unLikePosts(
                          "${widget.post!.sId}", " ${widget.post!.user!.sId}");

                      MotionToast.success(
                        description: const Text('Post UnLiked'),
                      ).show(context);
                      Navigator.pushReplacementNamed(context, "/");
                    } else {
                      await likePosts(
                          "${widget.post!.sId}", " ${widget.post!.user!.sId}");

                      MotionToast.success(
                        description: const Text('Post Liked'),
                      ).show(context);
                    }
                    Navigator.pushReplacementNamed(context, "/");
                  }),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28.0,
                icon: const Icon(Icons.comment),
                onPressed: () => {
                  Navigator.pushNamed(context, "/comments",
                      arguments: widget.post)
                },
              ),
              IconButton(
                  padding: EdgeInsets.zero,
                  iconSize: 28.0,
                  icon: const Icon(Icons.send),
                  onPressed: () => {Navigator.pushNamed(context, "/settings")}),
              const Spacer(),
              if (widget.post!.images!.length > 1)
                PhotoCarouselIndicator(
                  photoCount: widget.post!.images!.length,
                  activePhotoIndex: _current,
                ),
              const Spacer(),
              const Spacer(),
              IconButton(
                padding: EdgeInsets.zero,
                iconSize: 28.0,
                icon: _isSaved
                    ? const Icon(Icons.bookmark)
                    : const Icon(Icons.bookmark_border),
                onPressed: _toggleIsSaved,
              )
            ],
          ),
          Padding(
            padding: const EdgeInsets.only(left: 8.0, bottom: 16.0),
            child: Column(
              crossAxisAlignment: CrossAxisAlignment.start,
              children: [
                Text(
                  '${widget.post!.likes!.length} likes',
                  style: const TextStyle(
                      fontSize: 16, fontWeight: FontWeight.bold),
                ),
                Padding(
                  padding: const EdgeInsets.only(bottom: 8.0),
                  child: Row(
                    children: [
                      Text(
                        "${widget.post!.user!.username}",
                        style: const TextStyle(
                            fontWeight: FontWeight.bold, fontSize: 16),
                      ),
                      Text(
                        " ${widget.post!.content}",
                        style: const TextStyle(fontSize: 16),
                      ),
                    ],
                  ),
                ),
                InkWell(
                  onTap: () {
                    Navigator.pushNamed(context, '/comments',
                        arguments: widget.post);
                  },
                  child: Text(
                      "View all ${widget.post!.comments!.length} comments",
                      style: const TextStyle(fontSize: 16)),
                ),
              ],
            ),
          )
        ],
      ),
    );
  }
}

class PhotoCarouselIndicator extends StatelessWidget {
  final int? photoCount;
  final int? activePhotoIndex;

  const PhotoCarouselIndicator(
      {Key? key, this.photoCount, this.activePhotoIndex})
      : super(key: key);

  Widget _buildDot({required bool isActive}) {
    return Padding(
      padding: const EdgeInsets.only(left: 3.0, right: 3.0),
      child: Container(
        height: isActive ? 7.5 : 6.0,
        width: isActive ? 7.5 : 6.0,
        decoration: BoxDecoration(
          color: isActive ? Colors.blue : Colors.grey,
          borderRadius: BorderRadius.circular(4.0),
        ),
      ),
    );
  }

  @override
  Widget build(BuildContext context) {
    return Row(
      children: List.generate(photoCount!, (i) => i)
          .map((i) => _buildDot(isActive: i == activePhotoIndex))
          .toList(),
    );
  }
}
