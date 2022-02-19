import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/shared/themes.dart';
import '../../../model/post_model.dart';
import 'package:carousel_slider/carousel_slider.dart';

class PostItem extends StatelessWidget {
  final PostModel? post;
  const PostItem({Key? key, this.post}) : super(key: key);

  @override
  Widget build(BuildContext context) {
    return Container(
      decoration: BoxDecoration(
        color: Colors.white,
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
                Navigator.pushNamed(context, '/profile', arguments: post);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage(
                  '${post!.user!.avatar}',
                ),
              ),
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile', arguments: post);
              },
              child: Text(
                "${post!.user!.username}",
                style: TextStyle(
                    color: blackColor.withOpacity(.8),
                    fontWeight: FontWeight.w400,
                    fontSize: 21),
              ),
            ),
            trailing: InkWell(
                onTap: () {}, child: const Icon(FontAwesomeIcons.ellipsisV)),
          ),
          // AspectRatio(
          //   aspectRatio: 1,
          //   child: Image.network(
          //     "${post!.images![0].url}",
          //     fit: BoxFit.cover,
          //     width: double.infinity,
          //   ),
          // ),

          GestureDetector(
            child: Stack(
              alignment: Alignment.center,
              children: [
                CarouselSlider(
                  items: post!.images!.map((iurl) {
                    return Image.network(
                      '${iurl.url}',
                      fit: BoxFit.cover,
                      width: MediaQuery.of(context).size.width,
                    );
                  }).toList(),
                  options: CarouselOptions(
                    aspectRatio: 1,
                    autoPlay: true,
                    enlargeCenterPage: true,
                    height: MediaQuery.of(context).size.height / 2,
                    viewportFraction: 1,
                    enableInfiniteScroll: false,
                    reverse: false,
                    autoPlayInterval: Duration(seconds: 5),
                    pauseAutoPlayOnTouch: true,
                  ),
                ),

                // HeartOverlayAnimator(
                //     triggerAnimationStream: _doubleTapImageEvents.stream),
              ],
            ),
            // onDoubleTap: _onDoubleTapLikePhoto,
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
                        FontAwesomeIcons.heart,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {
                        Navigator.pushNamed(context, '/comments',
                            arguments: post);
                      },
                      icon: const Icon(
                        FontAwesomeIcons.comment,
                        size: 30,
                      ),
                    ),
                    IconButton(
                      onPressed: () {},
                      icon: const Icon(
                        Icons.send_rounded,
                        size: 31,
                      ),
                    ),
                  ],
                ),
                IconButton(
                  onPressed: () {},
                  icon: const Icon(
                    FontAwesomeIcons.bookmark,
                    size: 30,
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
                    Navigator.pushNamed(context, '/comments', arguments: post);
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

class PhotoCarouselIndicator extends StatelessWidget {
  final int? photoCount;
  final int ?activePhotoIndex;

  const PhotoCarouselIndicator({Key? key, this.photoCount, this.activePhotoIndex}) : super(key: key);

  Widget _buildDot({required bool isActive}) {
    return Container(
      child: Padding(
        padding: const EdgeInsets.only(left: 3.0, right: 3.0),
        child: Container(
          height: isActive ? 7.5 : 6.0,
          width: isActive ? 7.5 : 6.0,
          decoration: BoxDecoration(
            color: isActive ? Colors.blue : Colors.grey,
            borderRadius: BorderRadius.circular(4.0),
          ),
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