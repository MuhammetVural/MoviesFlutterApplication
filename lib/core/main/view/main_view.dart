import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_application/core/main/models/category_model.dart';
import 'package:movie_flutter_application/extensions/global.dart';
import 'package:movie_flutter_application/extensions/my_drawer.dart';

import '../../../extensions/widgets/category_design_widget.dart';
import '../../auth/login/view/login_view.dart';

class MainView extends StatefulWidget {
  const MainView({super.key});

  @override
  State<MainView> createState() => _MainViewState();
}

final TextEditingController _searchController = TextEditingController();

class _MainViewState extends State<MainView> {
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
                        const Text(
                          "Sezin Karagün",
                          style: TextStyle(
                              color: Colors.black,
                              fontWeight: FontWeight.w300,
                              fontSize: 17),
                        ),
                      ],
                    ),
                    const CircleAvatar()
                  ],
                ),
              ),
              preferredSize: const Size.fromHeight(40)),
        ),
        body: Column(
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
            Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'My Collection',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: ListView.builder(
                  shrinkWrap: true,
                  scrollDirection: Axis.horizontal,
                  itemCount: img.length,
                  itemBuilder: (context, index) {
                    return Container(
                      child: Padding(
                        padding: const EdgeInsets.only(left: 20),
                        child: CircleAvatar(
                          radius: 60,
                          backgroundImage: AssetImage(
                              "assets/images/doktorlar/${img[index]}"),
                        ),
                      ),
                    );
                  }),
            ),
            SizedBox(
              height: 15,
            ),
            Container(
              alignment: Alignment.centerLeft,
              child: const Padding(
                padding: EdgeInsets.only(left: 15),
                child: Text(
                  'Comedy Movies',
                  style: TextStyle(
                      fontSize: 22,
                      fontWeight: FontWeight.w500,
                      color: Colors.black),
                ),
              ),
            ),
            SizedBox(
              height: 150,
              child: StreamBuilder(
                  stream: FirebaseFirestore.instance
                      .collection("Comedy")
                      .snapshots(),
                  builder: (context, snapshot) {
                    return !snapshot.hasData
                        ? Padding(
                            padding: EdgeInsets.all(0),
                            child: LinearProgressIndicator(),
                          )
                        : Container(
                            child: ListView.builder(
                                scrollDirection: Axis.horizontal,
                                shrinkWrap: true, //important
                                physics: BouncingScrollPhysics(),
                                itemCount: snapshot.data!.docs.length,
                                itemBuilder: (context, index) {
                                  Category model = Category.fromJson(
                                      snapshot.data!.docs[index].data());
                                  return CategoryDesignWidget(
                                    model: model,
                                    context: context,
                                  );
                                }),
                          );
                  }),
            ),
            // Expanded(
            //   child: ListView.builder(
            //     shrinkWrap: true,
            //     scrollDirection: Axis.vertical,
            //     itemCount: 3,
            //     itemBuilder: (context, index) {
            //       return InkWell(
            //         onTap: () {
            //           Navigator.push(
            //               context,
            //               MaterialPageRoute(
            //                   builder: (context) => CategoryDetailPage(
            //                         getIndex: index,
            //                       )));
            //         },
            //         child: Column(
            //           crossAxisAlignment: CrossAxisAlignment.start,
            //           children: [
            //             Row(
            //               mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //               children: [
            //                 Padding(
            //                   padding: const EdgeInsets.only(left: 20),
            //                   child: Text(
            //                     state.categories[index].name,
            //                     style: const TextStyle(
            //                         fontWeight: FontWeight.w600,
            //                         fontSize: 22),
            //                   ),
            //                 ),
            //                 Padding(
            //                   padding: const EdgeInsets.only(right: 10),
            //                   child: TextButton(
            //                     onPressed: () {
            //                     //  router.push(HomeRoute(loginModel: null));
            //                     },
            //                     child: const Text(
            //                       'View All',
            //                       style: TextStyle(
            //                           color: Colors.black,
            //                           fontWeight: FontWeight.w500,
            //                           fontSize: 12),
            //                     ),
            //                   ),
            //                 ),
            //               ],
            //             ),
            //             Container(
            //               decoration: BoxDecoration(
            //                   borderRadius: BorderRadius.circular(4)),
            //               height: 180,
            //               child: ListView.builder(
            //                 shrinkWrap: true,
            //                 scrollDirection: Axis.horizontal,
            //                 itemCount: 3,
            //                 itemBuilder: (context, subIndex) {
            //                   return Padding(
            //                     padding: const EdgeInsets.all(15),
            //                     child: Container(
            //                       padding: const EdgeInsets.all(10),
            //                       color: ColorManager.textFieldGreyBackround,
            //                       child: Row(
            //                         crossAxisAlignment:
            //                             CrossAxisAlignment.center,
            //                         children: [
            //                           Container(
            //                             width: 80,
            //                             height: 180,
            //                             padding: const EdgeInsets.all(10),
            //                             child: Image(
            //                                 image: NetworkImage(
            //                               state2.products[index].cover,
            //                             )),
            //                           ),
            //                           Column(
            //                             mainAxisAlignment:
            //                                 MainAxisAlignment.spaceEvenly,
            //                             crossAxisAlignment:
            //                                 CrossAxisAlignment.start,
            //                             children: [
            //                               Column(
            //                                 crossAxisAlignment:
            //                                     CrossAxisAlignment.start,
            //                                 children: [
            //                                   Text(
            //                                     state2.products[subIndex].name,
            //                                     style: TextStyle(
            //                                         color:
            //                                             ColorManager.textColor,
            //                                         fontSize: 16,
            //                                         fontWeight:
            //                                             FontWeight.w500),
            //                                   ),
            //                                   const SizedBox(
            //                                     height: 5,
            //                                   ),
            //                                   Text(
            //                                     state2
            //                                         .products[subIndex].author,
            //                                     style: TextStyle(
            //                                         color:
            //                                             ColorManager.textColor,
            //                                         fontSize: 16,
            //                                         fontWeight:
            //                                             FontWeight.w400),
            //                                   ),
            //                                 ],
            //                               ),
            //                               Text(
            //                                 state2.products[index].price
            //                                     .toString(),
            //                                 style: const TextStyle(
            //                                     fontSize: 16,
            //                                     fontWeight: FontWeight.bold),
            //                               )
            //                             ],
            //                           ),
            //                         ],
            //                       ),
            //                     ),
            //                   );
            //                 },
            //               ),
            //             ),
            //           ],
            //         ),
            //       );
            //     },
            //   ),
            // ),
            // Row(
            //   mainAxisAlignment: MainAxisAlignment.spaceBetween,
            //   children: [
            //     const Padding(
            //       padding: EdgeInsets.only(left: 20),
            //       child: Text('',
            //        // loginModel.email,
            //         style: TextStyle(
            //             fontWeight: FontWeight.w600, fontSize: 20),
            //       ),
            //     ),
            //     Padding(
            //       padding: const EdgeInsets.only(right: 10),
            //       child: TextButton(
            //         onPressed: () {
            //          // router.push(HomeRoute(loginModel: null));
            //         },
            //         child: const Text('',
            //         //  loginModel.token,
            //           style: TextStyle(
            //              // color: ColorManager.orangeButtonColor,
            //               fontWeight: FontWeight.w500),
            //         ),
            //       ),
            //     ),
            //   ],
            // ),

            const SizedBox(
              height: 20,
            ),
          ],
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
