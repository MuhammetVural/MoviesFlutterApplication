import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_application/core/main/models/category_model.dart';
import 'package:movie_flutter_application/extensions/global.dart';
import 'package:movie_flutter_application/extensions/my_drawer.dart';

import '../../../extensions/widgets/category_design_widget.dart';
import '../profile/profile_view.dart';

class SearchView extends StatefulWidget {
  const SearchView({super.key});

  @override
  State<SearchView> createState() => _SearchViewState();
}

final TextEditingController _searchController = TextEditingController();

class _SearchViewState extends State<SearchView> {
  List symptoms = [
    "Domates",
    "Fesleğen",
    "Gül",
    "Lale",
    "Biber",
    "Nergiz",
    "Karpuz",
    "Kabak",
  ];
  List img = [
    "d1.jpg",
    "d2.jpg",
    "d3.jpg",
    "d4.jpg",
    "d5.jpg",
    "d6.jpg",
  ];
  @override
  Widget build(BuildContext context) {
    return Scaffold(
        drawer: const MyDrawer(),
        appBar: AppBar(
          elevation: 0,
          backgroundColor: Colors.transparent,
          bottom: PreferredSize(
              child: Padding(
                padding: const EdgeInsets.all(20.0),
                child: Row(
                  mainAxisAlignment: MainAxisAlignment.spaceBetween,
                  children: [
                    Row(
                      children: [
                        Builder(builder: (context) {
                          return IconButton(
                              onPressed: () {
                                Scaffold.of(context).openDrawer();
                              },
                              icon: const Icon(Icons.menu));
                        }),
                        Text(
                         // sharedPreferences!.getString("name") ?? 'Null',
                          "Sezin Karagün",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    InkWell(
                        onTap: () {
                          Navigator.push(
                              context,
                              MaterialPageRoute(
                                  builder: (c) => const ProfileView()));
                        },
                        child: CircleAvatar(
                            //backgroundImage: NetworkImage(sharedPreferences!.getString("photoUrl")!)
                                )
                                )
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(40)),
        ),
        body: SingleChildScrollView(
          child: Column(
            crossAxisAlignment: CrossAxisAlignment.stretch,
            children: [
              Padding(
                padding: EdgeInsets.only(left: 30, right: 30, bottom: 20),
                child: TextField(
                  cursorColor: Colors.grey,
                  style: TextStyle(
                    color: Colors.black54.withOpacity(0.8),
                  ),
                  decoration: InputDecoration(
                    labelText: 'Search',
                    labelStyle: TextStyle(color: Colors.grey.withOpacity(0.7)),
                    filled: true,
                    floatingLabelBehavior: FloatingLabelBehavior.never,
                    fillColor: Colors.white,

                    //prefixIcon: const Icon(Icons.search),
                    suffixIcon: const Icon(Icons.search),

                    border: OutlineInputBorder(
                        borderRadius: BorderRadius.circular(5.0),
                        borderSide: const BorderSide(
                          width: 0,
                          style: BorderStyle.none,
                        )),
                  ),
                  controller: _searchController,
                ),
              ),
              const SizedBox(
                height: 40,
              ),
              Padding(
                padding: const EdgeInsets.only(left: 35.0, right: 35, bottom: 40),
                child: Column(children: [
                  Row(
                    mainAxisAlignment: MainAxisAlignment.spaceBetween,
                    children: [
                      Text("Sort by", style: TextStyle(color: Colors.grey, fontSize: 16),),
                      Icon(Icons.assessment),
                    ],
                  ),
                  
                ],),
              )
              ],
          ),
        ));
    // child: ElevatedButton(
    //     onPressed: () {
    //       fAuth.signOut();
    //       Navigator.push(
    //           context, MaterialPageRoute(builder: (c) => const LoginView()));
    //     },
    //     child: Text("Sign out")),
  }
}
