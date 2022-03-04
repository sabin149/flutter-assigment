import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:frontend/pages/shared/config.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '../../../model/user_model.dart';
import '../../../services/httpuser.dart';
import '../../shared/themes.dart';
import '../../shared/widgets/persistent_header.dart';
import '../../upload/upload.dart';

class MyProfile extends StatefulWidget {
  const MyProfile({Key? key}) : super(key: key);

  @override
  _MyProfileState createState() => _MyProfileState();
}

class _MyProfileState extends State<MyProfile> {
  bool isApiCallProcess = false;

  late Future<UserModel> futureUser;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    return Scaffold(
      
      body: ProgressHUD(
        child: loadUserDetails(Config.userId),
        inAsyncCall: isApiCallProcess,
        opacity: 0.3,
        key: UniqueKey(),
      ),
    );
  }

  Widget loadUserDetails(userid) {
    return FutureBuilder(
      future: HttpConnectUser().getUserDetails(userid),
      builder: (
        BuildContext context,
        AsyncSnapshot<UserModel?> model,
      ) {
        if (model.hasData) {
          return DefaultTabController(
            length: 2,
            child: NestedScrollView(
              headerSliverBuilder: (context, index) {
                return [
                  SliverAppBar(
                    centerTitle: false,
                    pinned: true, //
                    elevation: 0,
                    title: Row(
                      children: [ 
                        Text(
                          "My Profile",
                          style: TextStyle(
                            fontWeight: bold,
                            fontSize: 20,
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
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Upload()));
                          },
                          icon: const Icon(
                            Icons.file_upload,
                            size: 28,
                          ),
                        ),
                      ),
                      const SizedBox(width: 5),
                      IconButton(
                        onPressed: () {
                          Navigator.pushNamed(context, '/settings');
                        },
                        icon: const Icon(
                          FontAwesomeIcons.bars,
                          size: 24,
                        ),
                      ),
                    ],
                  ),
                  SliverToBoxAdapter(
                    child: Column(
                      crossAxisAlignment: CrossAxisAlignment.start,
                      children: [ 
                        const SizedBox(height: 10),
                        Row( 
                          children: [
              
                             const SizedBox(width: 14),
                            const Icon(Icons.lock),
                            const SizedBox(width: 10),
                            Text(
                              "${model.data!.username}",
                              style: TextStyle( 
                                fontWeight: bold,
                                fontSize: 24,
                              ),  
                            ),
                            const SizedBox(width: 5),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Row(
                          children: [
                            Container(
                              width: 90,
                              height: 90,
                              margin: const EdgeInsets.symmetric(
                                  horizontal: defaultMargin),
                              child: Stack(
                                children: [
                                  ClipOval(
                                    child: Container(
                                      decoration: BoxDecoration(
                                        color: blackColor,
                                        shape: BoxShape.circle,
                                        image: DecorationImage(
                                          fit: BoxFit.cover,
                                          image: NetworkImage(
                                              "${model.data!.avatar}"),
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
                            Expanded(
                              child: Column(
                                children: [
                                  Text(
                                    "${model.data!.saved!.length}",
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
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/followers',
                                          arguments: model.data);
                                    },
                                    child: Text(
                                      "${model.data!.followers!.length}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(context, '/followers',
                                          arguments: model.data);
                                    },
                                    child: Text(
                                      "Followers",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            Expanded(
                              child: Column(
                                children: [
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/followings',
                                          arguments: model.data);
                                    },
                                    child: Text(
                                      "${model.data!.following!.length}",
                                      style: TextStyle(
                                        fontSize: 18,
                                        fontWeight: bold,
                                      ),
                                    ),
                                  ),
                                  InkWell(
                                    onTap: () {
                                      Navigator.pushNamed(
                                          context, '/followings',
                                          arguments: model.data);
                                    },
                                    child: Text(
                                      "Followings",
                                      style: TextStyle(
                                        fontSize: 16,
                                        fontWeight: medium,
                                      ),
                                    ),
                                  ),
                                ],
                              ),
                            ),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Text(
                            "${model.data!.fullname}",
                            style: TextStyle(fontWeight: bold, fontSize: 18),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Container(
                          width: 200,
                          margin: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
                          child: Text(
                            "${model.data!.story}",
                            style: TextStyle(
                              fontSize: 16,
                              fontWeight: normal,
                            ),
                            textAlign: TextAlign.start,
                            overflow: TextOverflow.ellipsis,
                          ),
                        ),
                        const SizedBox(height: 5),
                        Padding(
                          padding: const EdgeInsets.symmetric(
                              horizontal: defaultMargin),
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
                                  onPressed: () {
                                    Navigator.pushNamed(
                                        context, '/editprofile',
                                        arguments: model.data);
                                        

                                  },
                                  child: const Text(
                                    "Edit Profile",
                                    style: TextStyle(
                                      fontSize: 16,
                                    ),
                                  ),
                                ),
                              ),
                              const SizedBox(width: 5),
                              SizedBox(
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
                                  child: const Icon(
                                    Icons.expand_more_outlined,
                                    size: 20,
                                  ),
                                ),
                              ),
                            ],
                          ),
                        ),
                        const SizedBox(height: 5),
                        SizedBox(
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
                                              image: DecorationImage(
                                                image: AssetImage(
                                                    "assets/icons/stroke_seen_solid.png"),
                                              ),
                                            ),
                                            child: Container(
                                              decoration: const BoxDecoration(
                                                shape: BoxShape.circle,
                                                image: DecorationImage(
                                                  image: AssetImage(
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
                                  const Text(
                                    "Highlights",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
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
                                      border:
                                          Border.all(color: greyBorderColor),
                                    ),
                                    child: const Icon(Icons.add),
                                  ),
                                  const SizedBox(height: 3),
                                  const Text(
                                    "New",
                                    textAlign: TextAlign.center,
                                    overflow: TextOverflow.ellipsis,
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
                        }, childCount: 6),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
                          crossAxisCount: 3,
                          crossAxisSpacing: 1,
                          mainAxisSpacing: 1,
                        ),
                      ),
                    ],
                  ),

                  //saved
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
                        }, childCount: 3),
                        gridDelegate:
                            const SliverGridDelegateWithFixedCrossAxisCount(
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
          );
        }
        return const Center(
          child: CircularProgressIndicator(),
        );
      },
    );
  }
}