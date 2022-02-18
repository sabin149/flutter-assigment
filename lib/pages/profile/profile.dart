import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import "package:provider/provider.dart";
import '../../model/post_model.dart';
import '../shared/theme.dart';
import '../shared/themes.dart';
import '../shared/widgets/persistent_header.dart';

class Profile extends StatefulWidget {
  const Profile(  {Key? key}) : super(key: key);
  @override 
  _ProfileState createState() => _ProfileState();
} 
class _ProfileState extends State<Profile> {
 
  @override 
  Widget build(BuildContext context) { 

    return Scaffold( 
      appBar: AppBar(
        title: const Text('Profile'),
        
      ),
      body:DefaultTabController(
        length: 2,
        child: NestedScrollView(
          headerSliverBuilder: (context, index) { 
            return [
              SliverAppBar(
                centerTitle: false,
                pinned: true,
                backgroundColor: whiteColor,
                elevation: 0,
                title: Row(
                  children: [
                    Text(
                      // "${post.user!.username}",
                      "user01",
                      style: TextStyle(
                        color: blackColor,  
                        fontWeight: bold,
                        fontSize: 24,
                        
                      ),
                    ),
                    const SizedBox(width: 5),   
                  ],
                ),
                actions: [
                  Container(
                    height: 50,
                    width: 25,
                    margin: const EdgeInsets.only(left: defaultMargin),
                    child:  IconButton(
                    onPressed: () {},
                    icon: Icon(
                      Icons.file_upload,
                      color: blackColor,
                      size: 28,
                    ),
                  ),
                  ),
                  const SizedBox(width: 5),
                  IconButton(
                    onPressed: () {
                       Navigator.pushNamed(context, '/settings'); 
                    },
                    icon: Icon(  
                      FontAwesomeIcons.bars,
                      color: blackColor, 
                      size: 24,
                    ),
                  ), 
                ],
              ),
              SliverToBoxAdapter(
                child: Column(
                  crossAxisAlignment: CrossAxisAlignment.start,
                  children: [
                    Row(
                      children: [
                        Container(
                          width: 90,
                          height: 90,
                          margin:
                              const EdgeInsets.symmetric(horizontal: defaultMargin),
                          child: Stack(
                            children: [
                              ClipOval(
                                child: Container(
                                  decoration:  BoxDecoration(
                                    color: blackColor,
                                    shape: BoxShape.circle,
                                    image:  const DecorationImage( 
                                      fit: BoxFit.cover,
                                      image:   NetworkImage(
                                        "https://i.ytimg.com/vi/m5ab9B8jNbQ/hq720.jpg?sqp=-oaymwEcCNAFEJQDSFXyq4qpAw4IARUAAIhCGAFwAcABBg==&rs=AOn4CLCa3lptkq48qSJ7zfcDzC2T_9uYxg"
                                      ),
                                    ),
                                  ),
                                ),
                              ),
                              Positioned(
                                right: 0,
                                bottom: 0,
                                child: Container(
                                  height: 26,
                                  width: 26,
                                  decoration: BoxDecoration(
                                    color: whiteColor,
                                    shape: BoxShape.circle,
                                  ),
                                  child: Icon(
                                    Icons.add_circle_sharp,
                                    color: blueColor,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        // posts(model),
                        // followers(model),
                        // followings(model),
                        const SizedBox(width: 20),
                      ],
                    ),
                    const SizedBox(height: 10),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                         "edr",
                         
                        style: TextStyle(
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        "@rfprivatestore",
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      width: 100,
                      margin: const EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Text(
                        "@monfadev",
                        style: TextStyle(
                          color: Colors.blue.shade700,
                          fontSize: 13,
                          fontWeight: medium,
                        ),
                        textAlign: TextAlign.start,
                        overflow: TextOverflow.ellipsis,
                      ),
                    ),
                    const SizedBox(height: 5),
                    Padding(
                      padding:
                          const EdgeInsets.symmetric(horizontal: defaultMargin),
                      child: Row(
                        children: [
                          Expanded(
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: BorderSide(
                                    color: greyBorderColor,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Text(
                                "Edit Profile",
                                style: TextStyle(
                                  color: blackColor,
                                ),
                              ),
                            ),
                          ),
                          const SizedBox(width: 5),
                          Container(
                            width: 40,
                            child: TextButton(
                              style: TextButton.styleFrom(
                                shape: RoundedRectangleBorder(
                                  borderRadius: BorderRadius.circular(3),
                                  side: BorderSide(
                                    color: greyBorderColor,
                                  ),
                                ),
                              ),
                              onPressed: () {},
                              child: Icon(
                                Icons.expand_more_outlined,
                                size: 20,
                                color: blackColor,
                              ),
                            ),
                          ),
                        ],
                      ),
                    ),
                    const SizedBox(height: 5),
                    Container(
                      height: 95,
                      child: ListView(
                        scrollDirection: Axis.horizontal,
                        shrinkWrap: true,
                        children: [
                          Column(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                margin: const EdgeInsets.symmetric(
                                    horizontal: defaultMargin),
                                child: Stack(
                                  children: [
                                    ClipOval(
                                      child: Container(
                                        padding: const EdgeInsets.all(4),
                                        height: 65,
                                        width: 65,
                                        decoration: const BoxDecoration(
                                          image:  DecorationImage(
                                            image: AssetImage(
                                                "assets/icons/stroke_seen_solid.png"),
                                          ),
                                        ),
                                        child: Container(
                                          decoration: const BoxDecoration(
                                            shape: BoxShape.circle,
                                            image:  DecorationImage(
                                              image:  AssetImage(
                                                  "assets/search/0.png"),
                                              fit: BoxFit.cover,
                                            ),
                                          ),
                                        ),
                                      ),
                                    ),
                                  ],
                                ),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                child: const Text(
                                  "Highlights",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                          Column(
                            children: [
                              Container(
                                width: 65,
                                height: 65,
                                decoration: BoxDecoration(
                                  shape: BoxShape.circle,
                                  border: Border.all(color: greyBorderColor),
                                ),
                                child: const Icon(Icons.add),
                              ),
                              const SizedBox(height: 3),
                              Container(
                                child: const Text(
                                  "New",
                                  textAlign: TextAlign.center,
                                  overflow: TextOverflow.ellipsis,
                                ),
                              ),
                            ],
                          ),
                        ],
                      ),
                    ),
                  ],
                ),
              ),
              SliverPersistentHeader(
                pinned: true,
                delegate: PersistentHeader(
                  mnExtent: 50,
                  mxExtent: 50,
                  child: TabBar(
                    labelColor: blackColor,
                    unselectedLabelColor: Colors.grey,
                    indicatorColor: blackColor,
                    indicatorWeight: 1,
                    tabs: const [
                      Tab(
                        icon: Icon(
                          Icons.grid_on,
                        ),
                      ),
                      Tab(
                        icon: Icon(
                          Icons.assignment_ind_outlined,
                        ),
                      ),
                    ],
                  ),
                ),
              ),
            ];
          },
          body: TabBarView(
            children: [
              CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate((_, index) {
                      return Container(
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/search/$index.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }, childCount: 17),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                  ),
                ],
              ),
              CustomScrollView(
                slivers: [
                  SliverGrid(
                    delegate: SliverChildBuilderDelegate((_, index) {
                      return Container( 
                        alignment: Alignment.bottomLeft,
                        decoration: BoxDecoration(
                          image: DecorationImage(
                            image: AssetImage("assets/search/$index.png"),
                            fit: BoxFit.cover,
                          ),
                        ),
                      );
                    }, childCount: 17),
                    gridDelegate: const SliverGridDelegateWithFixedCrossAxisCount(
                      crossAxisCount: 3,
                      crossAxisSpacing: 1,
                      mainAxisSpacing: 1,
                    ),
                  ),
                ],
              ),
            ],
          ),
        ),
      ),
    );
  }

  Widget posts(PostModel post) {
    return Expanded(
      child: Column(
        children: [
          Text(
          
            "${post.user!.followers!.length}",
            style: TextStyle( 
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          Text(
            "Posts", 
            style: TextStyle( 
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
    
  }
  Widget followers(PostModel post) {
    return Expanded(
      child: Column(
        children: [
          Text(
            
            "${post.user!.followers!.length}",
            style: TextStyle( 
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          Text(
            "Followers", 
            style: TextStyle( 
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
    
  }
  Widget followings(PostModel post) {
    return Expanded(
      child: Column(
        children: [
          Text(
           
            "${post.user!.followers!.length}",
            style: TextStyle( 
              fontSize: 18,
              fontWeight: bold,
            ),
          ),
          Text(
            "Followings", 
            style: TextStyle( 
              fontSize: 16,
              fontWeight: medium,
            ),
          ),
        ],
      ),
    );
    
  }
}
