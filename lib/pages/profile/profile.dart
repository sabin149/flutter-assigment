import 'package:flutter/material.dart';
import 'package:font_awesome_flutter/font_awesome_flutter.dart';
import 'package:snippet_coder_utils/ProgressHUD.dart';
import '../shared/themes.dart';
import '../shared/widgets/persistent_header.dart';
import '../upload.dart';
import '/model/user_model.dart';
import '../../model/post_model.dart';
import '../../services/httpuser.dart';

class Profile extends StatefulWidget {
  final PostModel? post;
  const Profile({Key? key, this.post, String? id}) : super(key: key);
  @override
  _ProfileState createState() => _ProfileState();
}

class _ProfileState extends State<Profile> {
  bool isApiCallProcess = false;

  @override
  void initState() {
    super.initState();
  }

  @override
  Widget build(BuildContext context) {
    final post = ModalRoute.of(context)!.settings.arguments as PostModel;

    return Scaffold(
      body: ProgressHUD(
        child: loadUserDetails(post.user!.sId),
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
                    automaticallyImplyLeading: true,
                    centerTitle: false,
                    pinned: true,
                    backgroundColor: whiteColor,
                    elevation: 0,
                    title: Row(
                      children: [
                        Text(
                          "${model.data!.username}",
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
                        child: IconButton(
                          onPressed: () {
                            Navigator.push(
                                context,
                                MaterialPageRoute(
                                    builder: (context) => const Upload()));
                          },
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
                            // posts(model.data.),
                            // followers(),
                            // followings(model),
                            const SizedBox(width: 20),
                          ],
                        ),
                        const SizedBox(height: 10),
                        Container(
                          width: 100,
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
                          width: 100,
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
