import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/shared/themes.dart';
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
    bool _isLiked = false;
  
   int _current = 0;
  final CarouselController _controller = CarouselController();
  

    void _toggleIsSaved() {
    setState(() => _isSaved = !_isSaved);
  }

   void _toggleLiked() {
    setState(() => _isLiked = !_isLiked);
  }
 

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
                Navigator.pushNamed(context, '/profile', arguments: widget.post);
              },
              child: CircleAvatar(
                backgroundImage: NetworkImage( 
                  '${widget.post!.user!.avatar}',
                ),
              ),
            ),
            title: InkWell(
              onTap: () {
                Navigator.pushNamed(context, '/profile', arguments: widget.post);
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
                onTap: () {}, child: const Icon(FontAwesomeIcons.ellipsisV)),
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
                

                // HeartOverlayAnimator(
                //     triggerAnimationStream: _doubleTapImageEvents.stream),
              ],
            ),
            // onDoubleTap: _onDoubleTapLikePhoto,
          ),

          // Padding(
          //   padding: const EdgeInsets.all(8.0),
          //   child: Row(
          //     mainAxisAlignment: MainAxisAlignment.spaceBetween,
          //     children: [
          //       Row(
          //         children: [
                    // IconButton(
                    //   onPressed: () {},
                    //   icon: const Icon(
                    //     FontAwesomeIcons.heart,
                    //     size: 30,
                    //   ),
                    // ),
          //           IconButton(
          //             onPressed: () {
          //               Navigator.pushNamed(context, '/comments',
          //                   arguments: post);
          //             },
          //             icon: const Icon(
          //               FontAwesomeIcons.comment,
          //               size: 30,
          //             ),
          //           ),
          //           IconButton(
          //             onPressed: () {},
          //             icon: const Icon(
          //               Icons.send_rounded,
          //               size: 31,
          //             ),
          //           ),
          //         ],
          //       ),
          //       IconButton(
          //         onPressed: () {},
          //         icon: const Icon(
          //           FontAwesomeIcons.bookmark,
          //           size: 30,
          //         ),
          //       ),
          //     ],
          //   ),
          // ),
          
          Row(
          mainAxisAlignment: MainAxisAlignment.spaceBetween,
          children:[
            const Padding(
              padding: EdgeInsets.all(8.0),
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 28.0,
              //  icon:widget.post!.likes!.isNotEmpty?Icon(Icons.favorite, color: redColor,):const Icon(Icons.favorite_border),

            // icon:_isLiked?  : const ,
              onPressed: _toggleLiked,
            icon:_isLiked?  Icon(Icons.favorite, color: redColor,) : const Icon(Icons.favorite_border),
              // onPressed: (){},
 
            ),
            IconButton(
              padding: EdgeInsets.zero,
              iconSize: 28.0,  
              icon: const Icon(Icons.comment),
              onPressed: () => {
                Navigator.pushNamed(context, "/comments",arguments: widget.post)
               
              },
            ),
             IconButton(
              padding: EdgeInsets.zero,
              iconSize: 28.0,
              icon: const Icon(Icons.send),
              onPressed: () => {

                Navigator.pushNamed(context, "/settings")
              }),
            

            const Spacer(),
        
            if (widget.post!.images!.length > 1)
              PhotoCarouselIndicator(
                photoCount: widget.post!.images!.length ,
                activePhotoIndex: _current,
              ),
            const Spacer(),
            const Spacer(),
            IconButton( 
              padding: EdgeInsets.zero,
              iconSize: 28.0,
             icon:
                  _isSaved ? const Icon(Icons.bookmark) : const Icon(Icons.bookmark_border),
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
                  // "liked by ${post.likes![0].username} and ${post.likes!.length-1} others",
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
                    Navigator.pushNamed(context, '/comments', arguments: widget.post);
                  },
                  child: Text("View all ${widget.post!.comments!.length} comments",
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
  final int ?activePhotoIndex;

  const PhotoCarouselIndicator({Key? key, this.photoCount, this.activePhotoIndex}) : super(key: key);

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
