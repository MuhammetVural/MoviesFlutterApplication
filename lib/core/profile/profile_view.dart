
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';

import '../../extensions/global.dart';
import '../../extensions/my_drawer.dart';
import 'models/person_model.dart';


class ProfileView extends StatefulWidget {
  final Person? model;
  const ProfileView({super.key, this.model});

  @override
  State<ProfileView> createState() => _ProfileViewState();
}

class _ProfileViewState extends State<ProfileView> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      appBar: AppBar(
        flexibleSpace: Container(
          decoration: const BoxDecoration(),
        ),
        title: Text(
          sharedPreferences!.getString("name") ?? 'Null',
        ),
        centerTitle: true,
      ),
      drawer: const MyDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(
              height: 50,
            ),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  CircleAvatar(
                      radius: 100,
                      // backgroundImage:
                      //     NetworkImage(widget.model!.sellerAvatarUrl!)
                          ),
                  const SizedBox(
                    height: 15,
                  ),
                  Text(
                    widget.model!.userName!,
                    style: const TextStyle(
                        fontSize: 23, fontWeight: FontWeight.bold),
                  ),
                  const SizedBox(
                    height: 5,
                  ),
                  Text(
                    widget.model!.userEmail!,
                    style: const TextStyle(
                        fontSize: 14, fontWeight: FontWeight.normal),
                  ),
                ],
              ),
            ),
            const SizedBox(
              height: 15,
            ),

            SizedBox(
              height: 5,
            ),
            Row(
              mainAxisAlignment: MainAxisAlignment.center,
            )

            //   Padding(
            //     padding: const EdgeInsets.all(8.0),
            //     child: StreamBuilder(
            //         stream: FirebaseFirestore.instance
            //             .collection("sellers")
            //             .doc(sharedPreferences!.getString('uid'))
            //             .collection("menus")
            //             .doc(widget.model!.menuID)
            //             .collection("items")
            //             .snapshots(),
            //         builder: (context, snapshot) {
            //           return !snapshot.hasData
            //               ? Padding(
            //                   padding: EdgeInsets.all(0),
            //                   child: circularProgress(),
            //                 )
            //               : Container(
            //                   padding: EdgeInsets.only(top: 15, bottom: 40),
            //                   width: MediaQuery.of(context).size.width,
            //                   child: ListView.builder(
            //                       shrinkWrap: true, //important
            //                       physics: NeverScrollableScrollPhysics(),
            //                       itemCount: snapshot.data!.docs.length,
            //                       itemBuilder: (context, index) {
            //                         Items model = Items.fromJson(
            //                             snapshot.data!.docs[index].data());
            //                         return ItemsCardDesign(
            //                           model: model,
            //                           context: context,
            //                         );
            //                       }),
            //                 );
            //         }),
            //   ),
          ],
        ),
      ),
    );
  }
}
