
import 'package:cloud_firestore/cloud_firestore.dart';
import 'package:flutter/material.dart';
import 'package:movie_flutter_application/core/main/models/category_model.dart';



class CategoryScreen extends StatefulWidget {
  final Category? model;
  const CategoryScreen({super.key, this.model});

  @override
  State<CategoryScreen> createState() => _CategoryScreenState();
}

class _CategoryScreenState extends State<CategoryScreen> {
  @override
  Widget build(BuildContext context) {
    return Scaffold(
      backgroundColor: Colors.blueAccent.shade100,
      // appBar: AppBar(
      //   flexibleSpace: Container(
      //     decoration: const BoxDecoration(),
      //   ),
      //   title: Text(
      //     sharedPreferences!.getString("name") ?? 'Null',
      //   ),
      //   centerTitle: true,
       
      // ),
      //drawer: const MyDrawer(),
      body: SingleChildScrollView(
        physics: const BouncingScrollPhysics(),
        child: Column(
          children: [
            const SizedBox(height: 50,),
            Padding(
              padding: const EdgeInsets.symmetric(vertical: 10),
              child: Column(
                mainAxisAlignment: MainAxisAlignment.spaceEvenly,
                children: [
                  Container(
              width: MediaQuery.of(context).size.width,
              height: 250,
              decoration: BoxDecoration(
                image: DecorationImage(
                  fit: BoxFit.fill,
                  image: NetworkImage(widget.model!.imgUrl!),
                ),
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 20, top: 20),
              child: Text(
                widget.model!.name.toString(),
                style: const TextStyle(
                  fontSize: 20,
                  fontWeight: FontWeight.bold,
                ), //textAlign: TextAlign.start,
              ),
            ),
            Container(
              alignment: Alignment.centerLeft,
              padding: const EdgeInsets.only(left: 30, top: 20),
              child: Text(
                widget.model!.subject.toString(),
                style: const TextStyle(
                  fontSize: 14,
                  fontWeight: FontWeight.normal,
                ), //textAlign: TextAlign.start,
              ),
            ),
                
                ],
              ),
            ),
            const SizedBox(height: 15,),

           
            
            
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
