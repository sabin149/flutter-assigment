import 'package:flutter/material.dart';
import 'package:frontend/pages/shared/themes.dart';

import 'widgets/category.dart';
import 'widgets/search_item.dart';

class Search extends StatefulWidget {
  const Search({ Key? key }) : super(key: key);

  @override
  _SearchState createState() => _SearchState();
}

class _SearchState extends State<Search> {
  @override
  Widget build(BuildContext context) { 
    return Scaffold( 
      body: getSearch(),
      );
  }
  Widget getSearch() { 

    var size = MediaQuery.of(context).size;
    return SingleChildScrollView(
        child: Column(
          
      children:[
       const SizedBox(
          height: 20,
       ),
        SafeArea(
          child: Row(
            children: [
              const SizedBox(
                width: 15,
              ),
              Container(
                width: size.width - 30,
                height: 45,
                decoration: BoxDecoration(
                  borderRadius: BorderRadius.circular(10),
                ),
                child: TextField(
                  decoration: InputDecoration(
                      border: OutlineInputBorder(
                          borderRadius: BorderRadius.circular(10)),
                      prefixIcon: Icon(
                        Icons.search,
                        color: Colors.black.withOpacity(0.3),
                      )),
                  style: TextStyle(color: blackColor.withOpacity(0.3)),
                  cursorColor: blackColor.withOpacity(0.3),
                ),
              ),
              const SizedBox(
                width: 15,
              )
            ],
          ),
        ),
        const SizedBox(
          height: 15,
        ),
        SingleChildScrollView(
          scrollDirection: Axis.horizontal,
          child: Padding(
             padding: const EdgeInsets.only(left: 15),
            child: Row(
                children: List.generate(searchCategories.length, (index) {
              return CategoryStoryItem(
                name: searchCategories[index],
              );
            })),
          ),
        ),
        const SizedBox(
          height: 15, 
        ),
        Wrap(
          spacing: 1,
          runSpacing: 1,
          children:
          
           List.generate(searchImage.length, (index) {
            return Container(
              width: (size.width - 3) / 3,
              height: (size.width - 3) / 3,
              decoration: BoxDecoration(
                  image: DecorationImage(
                      image: AssetImage(searchImage[index]),
                      fit: BoxFit.cover)),
            );
          }
          
          ),
        )
      ],
    ));
  }
}
